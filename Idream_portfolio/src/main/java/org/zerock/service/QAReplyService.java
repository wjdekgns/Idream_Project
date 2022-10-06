package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QAReplyPageDTO;
import org.zerock.domain.QAReplyVO;

public interface QAReplyService {

	public int register(QAReplyVO vo);
	public QAReplyVO get(Long rno);
	public int modify(QAReplyVO vo);
	public int remove(Long rno);
	public List<QAReplyVO> getList(Criteria cri, Long qno);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public QAReplyPageDTO getListPage(Criteria cri, Long qno);
	
}
