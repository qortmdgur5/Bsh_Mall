package com.bsh.mapper;

import com.bsh.model.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member);
	
	//아이디 중복검사
	public int idCheck(String memberId);

}
