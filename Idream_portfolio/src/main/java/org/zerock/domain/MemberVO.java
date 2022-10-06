package org.zerock.domain;

import java.util.Date;

import java.util.List;

import lombok.Data;

// Page660 회원 도메인 : tbl_member 테이블을 MyBatis를 이용하는
//                   코드로 처리하기 위해 코딩함
@Data
public class MemberVO {

	private String userid; // 아이디
	private String userpw; // 패스워드
	private String userName; // 이름
	private String email; // 이메일
	private String birth; // 생일
	private String phone_num; // 전화번호
	private String address1; // 도로명주소
	private String address2; // 지번주소
	private String address3; // 상세주소
	
	private boolean enabled; // 활성화
	
	private Date regDate; // 등록일
	private Date updateDate; // 수정일
	
	private String userauth; // 권한
	
	// MemberVO 클래스는 내부적으로 여러 개의 사용자 권한을 가질 수 있는 구조로 설계합니다.
	private List<AuthVO> authList;	
	
}
