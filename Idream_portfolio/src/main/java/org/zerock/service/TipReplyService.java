package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.TipReplyPageDTO;
import org.zerock.domain.TipReplyVO;

public interface TipReplyService {

	public int register(TipReplyVO vo);
	public TipReplyVO get(Long rno);
	public int modify(TipReplyVO vo);
	public int remove(Long rno);
	public List<TipReplyVO> getList(Criteria cri, Long bno);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public TipReplyPageDTO getListPage(Criteria cri, Long bno);
	
}
