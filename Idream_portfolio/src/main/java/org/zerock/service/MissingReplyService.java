package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MissingReplyPageDTO;
import org.zerock.domain.MissingReplyVO;

public interface MissingReplyService {

	public int register(MissingReplyVO vo);
	public MissingReplyVO get(Long rno);
	public int modify(MissingReplyVO vo);
	public int remove(Long rno);
	public List<MissingReplyVO> getList(Criteria cri, Long bno);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public MissingReplyPageDTO getListPage(Criteria cri, Long bno);
	
}
