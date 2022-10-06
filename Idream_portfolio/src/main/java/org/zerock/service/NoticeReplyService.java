package org.zerock.service;

import java.util.List;


import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeReplyPageDTO;
import org.zerock.domain.NoticeReplyVO;
import org.zerock.domain.NoticeVO;

public interface NoticeReplyService {

	public int register(NoticeReplyVO vo);
	public NoticeReplyVO get(Long rno);
	public int modify(NoticeReplyVO vo);
	public int remove(Long rno);
	public List<NoticeReplyVO> getList(Criteria cri, Long bno);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public NoticeReplyPageDTO getListPage(Criteria cri, Long bno);
	
}
