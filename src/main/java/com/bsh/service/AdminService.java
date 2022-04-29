package com.bsh.service;

import java.util.List;

import com.bsh.model.BookVO;
import com.bsh.model.CateVO;

public interface AdminService {
	
	/* 상품 등록 */
	public void bookEnroll(BookVO book);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();

}
