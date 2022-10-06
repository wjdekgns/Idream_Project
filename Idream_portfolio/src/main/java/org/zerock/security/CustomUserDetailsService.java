package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// 666Page CustomUserDetailsService 구성을 위한 소스 코딩
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + userName);
		
		// Page670 아래 소스 2줄 추가 코딩 : userName means userid
		MemberVO vo = memberMapper.read(userName);
		log.warn("queried by member mapper : " + vo);
				
		// Page670 소스 코딩할 때 아래 1줄 소스 주석 처리
		// return null;
		
		// Page670 아래 1줄 소스 추가 코딩
		// loadUserByUsername() 메서드는 내부적으로 MemberMapper를 이용해서
		// MemberVO를 조회하고, 만일 MemberVO의 인스턴스를 얻을 수 있다면
		// CustomUser 타입의 객체로 변환해서 반환 처리 합니다.
		return vo == null ? null : new CustomUser(vo);
	}
}
