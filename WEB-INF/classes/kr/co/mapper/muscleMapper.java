package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.domain.boardVO;
import kr.co.domain.commentVO;
import kr.co.domain.muscle1VO;
import kr.co.domain.muscleVO;
import kr.co.domain.userVO;

@Mapper
public interface muscleMapper {

	public muscleVO musclevideoAjax1(String word); // 단어검색 후 영상

	public muscle1VO musclevideoAjax2(String word);

	public String main(); // 메인페이지 이동

	public String gologin(); // 로그인페이지 이동

	public String gomain(); // 메인페이지 이동

	public String join(); // 회원가입페이지 이동

	public String goboard(); // 자유게시판으로 이동

	public userVO login(userVO vo); // 로그인 기능

	public String logout(); // 로그아웃 기능

	public String video(); // 실시간 웹캠 확인 가능가능!

	public String camera();

	public List<userVO> boardList();

	public String muscleBoardForm(); // 글쓰기 페이지로 이동

	public String muscleBoardContent(); // 게시판 상세보기 페이지로 이동

	public void boardInsert(userVO vo); // insert SQL~

	@Insert("insert into tbl_user(id,pw,name,tel) values(#{id},#{pw},#{name},#{tel})")
	public void userInsert(userVO vo);

	@Select("select * from board_tbl where idx_b=#{idx_b}")
	public boardVO muscleBoardContent(int idx_b); // 게시판 상세보기 기능

	@Select("select * from comment_tbl where idx_b=#{idx_b}")
	public List<commentVO> commentListAjax(int idx_b);

	public void commentInsert(commentVO vo);

	@Select("select * from dic_tbl")
	public List<muscleVO> search();

	@Select("select count(*) from tbl_user where id = #{id} and pw = #{pw}")
	public int checkId(userVO vo);

	public userVO returnmypage(String id);

	public void memberupdate(userVO vo); // 회원정보 수정기능

	@Select("select * from tbl_user where id = #{id}")
	public userVO mypage(String id);

	@Select("select * from board_tbl where id = #{id}")
	public List<boardVO> myboard(String id); // 내가 쓴 게시글 확인기능

	@Select("select * from comment_tbl where id = #{id}")
	public List<commentVO> mycomment(String id); // 내가 쓴 댓글 확인기능

	public void mypageupdate(boardVO vo);

	public List<boardVO> returnmypagecontent(int idx_b);

	@Delete("delete from board_tbl where idx_b=#{idx_b}")
	public void mypagedelete(int idx_b);

	@Update("update comment_tbl set comment=#{comment} where idx_c=#{idx_c}")
	public void reveiwupdate(commentVO vo);

	@Delete("delete from comment_tbl where idx_c=#{idx_c}")
	public void reviewDelete(int idx_c);

}
