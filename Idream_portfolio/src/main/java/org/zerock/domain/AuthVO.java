package org.zerock.domain;

import lombok.Data;

// Page661 AuthVO는 tbl_member_auth의 칼럼을 그대로 반영해서
// userid, auth를 지정합니다.
@Data
public class AuthVO {
	private String userid;
	private String auth;
}
