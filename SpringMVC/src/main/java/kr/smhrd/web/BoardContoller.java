package kr.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.domain.BoardVO;
import kr.smhrd.domain.MinVO;
import kr.smhrd.domain.SearchVO;
import kr.smhrd.mapper.BoardMapper;

//POJO
@Controller
public class BoardContoller { //new BoardController(); => Spring Container9DI
	
	//@Autowired // defendency 인젝션 = DI
	@Inject //자동으로 인식
	//@Resource("boardMapper")
	private BoardMapper boardMapper;
	//게시판 리스트를 가져오는 동작
	@GetMapping("/boardList.do") //핸들러 매핑 @  @RequestMapping
	public void boardList(Model model) {
		List<BoardVO> list = boardMapper.boardList(); //sessionFactory가 처리
		model.addAttribute("list", list); // 객체바인딩 ->ModelAndView->Model(*)
		//return "boardList"; //  -->ViewResolver-->/WEB-INF/views/boardList.jsp
		//void로 주고 return을 삭제 (void를 주면 매핑 주소로 감 , 단 리다이렉트는 안됨!)
	}
	@RequestMapping("/boardListAjax.do")
	public @ResponseBody List<BoardVO> boardListAjax() {
		List<BoardVO> list = boardMapper.boardListAjax(); //sessionFactory가 처리
		return list; //객체를 리턴--{JSON API}--> String 변환--> 응답
	}
	@RequestMapping("/boardDeleteAjax.do")
	public @ResponseBody int boardDeleteAjax(int idx){
		int cnt = boardMapper.boardDeleteAjax(idx);
		return cnt;
	}
	
	@RequestMapping("/boardForm.do") //핸들러 매핑 @
	public void boardForm() {		
		//return "boardForm"; //boardForm.jsp
	}
	@PostMapping("/boardInsert.do") //핸들러 매핑 @ @RequestMapping
	public String boardInsert(BoardVO vo) { //파라메터수집(자동)-> new BoardVO();
		boardMapper.boardInsert(vo);
		return "redirect:/boardList.do";
	}
	@RequestMapping("/boardContent.do")
	public void boardContent(int idx, Model model) {				
	    BoardVO vo = boardMapper.boardContent(idx);
	    model.addAttribute("vo", vo);
		//return "boardContent";    // void로 주고 return을 삭제 (void를 주면 매핑 주소로 감 , 단 리다이렉트는 안됨!)
	}
	@RequestMapping("/boardDelete.do")
	public String boardDelete(int idx) {
	  boardMapper.boardDelete(idx);	   
		return "redirect:/boardList.do";
	}
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		boardMapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}
	   @RequestMapping("/MinInsert.do")
	   public String MinInsert(MinVO vo) {  //파라메터수집(자동) -> new BoardVO();
	      boardMapper.MinInsert(vo);
	      return "redirect:/boardList.do";
	   }
	   @RequestMapping("/boardSearch.do")
	   public String boardSearch(SearchVO vo, Model model) {
		   List<BoardVO> list = boardMapper.boardSearch(vo);
		   model.addAttribute("list",list);
		   return "boardList";
	   }
}
