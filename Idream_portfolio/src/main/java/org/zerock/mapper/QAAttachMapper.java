package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.QAAttachVO;

public interface QAAttachMapper {

	// Page552 ~ Page553 BoardAttachMapper 인터페이스의 경우,
	// 첨부파일의 수정이라는 개념이 존재하지 않기 때문에, insert()와 delete() 작업만을
	// 등록 처리 합니다. 특정 게시물의 번호로 첨부파일을 찾는 작업이 필요하므로
	// findByqno() 메서드를 정의했습니다.
	public void insert(QAAttachVO vo);
	public void delete(String uuid);
	public List<QAAttachVO> findByqno(Long qno);
	
	// Page578 첨부파일의 삭제 처리
	public void deleteAll(Long qno);
	
	// Page600 getOldFiles() 추상 메서드 정의
	public List<QAAttachVO> getOldFiles();	
	
}
