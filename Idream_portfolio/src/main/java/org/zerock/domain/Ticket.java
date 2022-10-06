package org.zerock.domain;

import lombok.Data;

@Data
public class Ticket {
	
	private int tno;  // 번호(tno) 필드 정의
	private String owner; // 소유주(owner) 필드 정의
	private String grade; // 등급(grade) 필드 정의
}
