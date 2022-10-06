package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.MissingReplyPageDTO;
import org.zerock.domain.MissingReplyVO;
import org.zerock.domain.NoticeReplyPageDTO;
import org.zerock.domain.NoticeReplyVO;
import org.zerock.mapper.MissingMapper;
import org.zerock.mapper.MissingReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MissingReplyServiceImpl implements MissingReplyService {
	
    @Setter(onMethod_ = @Autowired)
	private MissingReplyMapper mapper;
    
    // Page484 다음 2줄 소스 추가 코딩해줌.
    @Setter(onMethod_ = @Autowired)
    private MissingMapper boardMapper;

    // Page485 ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는
    // @Transactional의 처리를 해줍니다.
    @Transactional
	@Override
	public int register(MissingReplyVO vo) {
		log.info("register.... register 처리!" + vo);
		// Page485 다음 1줄 소스 추가 코딩해줌.
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public MissingReplyVO get(Long rno) {
		log.info("get.... get 처리!" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(MissingReplyVO vo) {
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
		MissingReplyVO vo = mapper.read(rno);		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		return mapper.delete(rno);
	}

	@Override
	public List<MissingReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board~! " + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public MissingReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new MissingReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
	
	
	
}




