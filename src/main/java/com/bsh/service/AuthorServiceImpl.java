package com.bsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsh.mapper.AuthorMapper;
import com.bsh.model.AuthorVO;
import com.bsh.model.Criteria;

@Service
public class AuthorServiceImpl implements AuthorService{

	@Autowired
	AuthorMapper authorMapper;

	//작가 등록
	@Override
	public void authorEnroll(AuthorVO author) throws Exception {
		authorMapper.authorEnroll(author);
	}
	
	//작가 목록
	@Override
	public List<AuthorVO> authorGetList(Criteria cri) throws Exception {
		return authorMapper.authorGetList(cri);
	}

	//작가 총 수
	@Override
	public int authorGetTotal(Criteria cri) throws Exception {
		return authorMapper.authorGetTotal(cri);
	}

}
