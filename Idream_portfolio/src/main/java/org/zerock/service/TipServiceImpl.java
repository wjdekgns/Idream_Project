package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.TipAttachVO;
import org.zerock.domain.TipVO;
import org.zerock.mapper.TipAttachMapper;
import org.zerock.mapper.TipMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
public class TipServiceImpl implements TipService {

	
	// @Setter(onMethod_ = @Autowired)
	// Spring 4.3 이상에서는 단일 파라미터를 받는 생성자의 경우 자동 처리
	// (파라미터를 자동으로 주입할 수 있음. 즉, 위에 @Setter 구문 안써도 됨)
	private TipMapper mapper;
	
	// Page566 BoardAttachMapper Setter 주입 처리
	// 위에서는 생략했음. 이번에는 Setter 주입 기재함.
	@Setter(onMethod_ = @Autowired)
	private TipAttachMapper attachMapper;
	
	// Page567 게시물의 등록 작업은 tbl_board 테이블과 tbl_attach 테이블 양쪽 모두
	// insert가 진행되어야 하기 때문에 트랜잭션 적용 처리가 필요합니다.
	@Transactional
	@Override
	public void register(TipVO board) {
		log.info("register... 등록 기능 활성화~ ^-^/" + board);
		
		mapper.insertSelectKey(board);
		
		// Page567 게시물 등록 추가 코딩 : BoardServiceImpl의 register()는
		// 트랜잭션 하에서 tbl_board에 먼저 게시물을 등록하고, 각 첨부파일은 생성된 게시물
		// 번호를 세팅한 후 tbl_attach 테이블에 데이터를 추가합니다.
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});		
	}

	// 특정 글 조회 작업의 기능 구현
	@Override
	public TipVO get(Long bno) {
		log.info("get... 특정 글 내용을 조회 합니다!" + bno);
		return mapper.read(bno);
	}

	// Page591 BoardService에서 게시물의 수정은 우선 기존의 첨부파일 관련 데이터를
	// 삭제한 후에 다시 첨부파일 데이터를 추가하는 방식으로 동작합니다. 그러기 위해
	// BoardService(Impl) 수정 코딩을 합니다.
	@Transactional
	@Override
	public boolean modify(TipVO board) {
		log.info("modify... 게시글을 수정 처리 합니다!" + board);
		
		// Page591 아래 소스 코딩 추가 시작
		// 참고로, 첨부파일은 수정이라기 보다는 삭제 후에 다시 추가한다는 개념이므로
		// 게시물의 수정 전과 수정 후의 데이터베이스 tbl_board, tbl_attach 테이블의
		// 변경 사항도 확인해 주시기 바랍니다.
		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult; // 왼쪽 소스 코딩까지가 Page591 소스 코딩 추가 끝
		
		
		// 정상적으로 수정이 이루어지면 1이라는 값이 반환되기 때문에
		// '==' 연산자를 이용해서 true/false를 처리할 수 있습니다.
		// Page591 소스 코딩할 때 아래 1줄 소스 주석 처리
		// return mapper.update(board) == 1;
	}

	// Page579 첨부파일 삭제와 실제 게시물의 삭제가 같이 처리되도록 트랜잭션 적용함
	@Transactional
	@Override
	public boolean remove(Long bno) {
		
		log.info("remove... 게시글을 삭제 처리 합니다!" + bno);
		
		// Page579 deleteAll 메서드 적용 : 아래 1줄 소스 코딩 추가
		attachMapper.deleteAll(bno);		
		
		// 정상적으로 삭제가 이루어지면 1이라는 값이 반환되기 때문에
		// '==' 연산자를 이용해서 true/false를 처리할 수 있습니다.
		return mapper.delete(bno) == 1;
	}
	
	// 목록(리스트) 작업의 기능 구현
//	@Override
//	public List<BoardVO> getList() {
//		log.info("getList... 목록 리스트 정보를 보여줍니다!");
//		return mapper.getList();
//	}
	// 목록(리스트) 작업의 기능 구현 : 페이징 기능 추가
	@Override
	public List<TipVO> getList(Criteria cri) {
		log.info("getList with criteria : 페이징 기능 추가!" + cri);
		return mapper.getListWithPaging(cri);
	}

	// Page323 하단 BoardServiceImpl 클래스 소스 추가 코딩
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count : 전체 개수 카운트!");
		return mapper.getTotalCount(cri);
	}

	// Page569 : getAttachList() 를 추가해서 게시물의 첨부파일들의 목록을 가져옵니다.
	@Override
	public List<TipAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

}



