package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.NoticeVO;

public interface MemberService {
   
   // 회원가입
   public void register(MemberVO vo) throws Exception;



   public int idChk(MemberVO vo);



   public MemberVO login(MemberVO vo);
   
   
   // public List<MemberVO> getList();
   
   public List<MemberVO> getList(Criteria cri);

   public int getTotal(Criteria cri);	
   
}