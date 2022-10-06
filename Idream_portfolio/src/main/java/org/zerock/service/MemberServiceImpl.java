package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberMapper dao;

	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);

	}

	@Override
	public int idChk(MemberVO vo) {
		return 0;
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return null;
	}

	@Override
	public List<MemberVO> getList(Criteria cri) {
		return dao.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotalCount(cri);
	}

}