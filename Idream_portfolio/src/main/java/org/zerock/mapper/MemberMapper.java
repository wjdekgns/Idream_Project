package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.NoticeVO;

public interface MemberMapper {

	// Page662 MemberMapper 인터페이스 생성 후 read() 추상 메서드 정의함.
	public MemberVO read(String userid);
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;

	public void idChk(MemberVO vo);
	
	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);	
	
	
	
}
