package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.QAReplyPageDTO;
import org.zerock.domain.QAReplyVO;
import org.zerock.mapper.QAMapper;
import org.zerock.mapper.QAReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QAReplyServiceImpl implements QAReplyService {
	
    @Setter(onMethod_ = @Autowired)
	private QAReplyMapper mapper;
    
    // Page484 다음 2줄 소스 추가 코딩해줌.
    @Setter(onMethod_ = @Autowired)
    private QAMapper boardMapper;

    // Page485 ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는
    // @Transactional의 처리를 해줍니다.
    @Transactional
	@Override
	public int register(QAReplyVO vo) {
		log.info("register.... register 처리!" + vo);
		// Page485 다음 1줄 소스 추가 코딩해줌.
		boardMapper.updateReplyCnt(vo.getQno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public QAReplyVO get(Long rno) {
		log.info("get.... get 처리!" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(QAReplyVO vo) {
		log.info("modify.... modify 처리!" + vo);
		return mapper.update(vo);
	}

	// Page485 ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는
    // @Transactional의 처리를 해줍니다.
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove.... remove 처리!" + rno);
		
		// Page485 다음 2줄 소스 추가 코딩해줌.
		QAReplyVO vo = mapper.read(rno);		
		boardMapper.updateReplyCnt(vo.getQno(), -1);
		
		return mapper.delete(rno);
	}

	@Override
	public List<QAReplyVO> getList(Criteria cri, Long qno) {
		log.info("get Reply List of a Board~! " + qno);
		return mapper.getListWithPaging(cri, qno);
	}

	@Override
	public QAReplyPageDTO getListPage(Criteria cri, Long qno) {
		return new QAReplyPageDTO(mapper.getCountByqno(qno), mapper.getListWithPaging(cri, qno));
	}
	
	
	
}




