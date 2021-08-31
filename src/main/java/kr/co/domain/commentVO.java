package kr.co.domain;

import lombok.Data;

@Data
public class commentVO {
   private int idx_c;     //댓글 번호
   private String comment;   //댓글
   private int idx_b;       //게시판 번호
   private String id;       //사용자 id
}