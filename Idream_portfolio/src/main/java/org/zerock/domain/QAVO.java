package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class QAVO {

	private Long qno;
	private String title;
	private String content; 
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	// Page481 댓글의 숫자를 의미하는 인스턴스 변수 한개 추가
	 private int replyCnt;
	
	// Page552 기존의 BoardVO는 등록 시 한 번에 BoardAttachVO를 처리할 수 있도록
	// List<BoardAttachVO>를 추가합니다.
	private List<QAAttachVO> attachList;
	
}
