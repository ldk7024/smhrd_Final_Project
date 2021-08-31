package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.domain.BoardVO;

@Mapper // -> 일반적으로 생략!
public interface BoardMapper {
  // SQL --> X Mapper File(XML)
   public List<BoardVO> boardList();

   public void boardInsert(BoardVO vo); // insert SQL~
 }
