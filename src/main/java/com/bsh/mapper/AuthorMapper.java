package com.bsh.mapper;

import java.util.List;

import com.bsh.model.AuthorVO;
import com.bsh.model.Criteria;

public interface AuthorMapper {
	
	//작가 등록
	public void authorEnroll(AuthorVO author);
	
	//작가 목록
	public List<AuthorVO> authorGetList(Criteria cri);
	
	//작가 총 수
    public int authorGetTotal(Criteria cri);

}
