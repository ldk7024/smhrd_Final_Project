package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.smhrd.domain.BoardVO;
import kr.smhrd.domain.MinVO;
import kr.smhrd.domain.SearchVO;

@Mapper // -> 일반적으로 생략!
public interface BoardMapper {
  // SQL --> X Mapper File(XML)
   public List<BoardVO> boardList();
   
   @Select("select * from tbl_board order by idx desc") //idx를 기준으로 내림차순
   public List<BoardVO> boardListAjax();
   
   public void boardInsert(BoardVO vo); // insert SQL~
   
   @Select("select * from tbl_board where idx=#{idx}") // xml에 쓸필요 없이 여기서 바로 가능!!!
   public BoardVO boardContent(int idx);// select SQL~
   
   public void boardDelete(int idx);
   
   @Update("update tbl_board set title = #{title}, contents = #{contents} where idx = #{idx}")
   public void boardUpdate(BoardVO vo);
   
   @Delete("delete from tbl_board where idx = #{idx}")
   public int boardDeleteAjax(int idx);
   
   @Insert("insert into min_board(id,pw,name,age) values(#{id},#{pw},#{name},#{age})")
   public void MinInsert(MinVO vo);

   public List<BoardVO> boardSearch(SearchVO vo);
   
   
   
 }
