package com.bsh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsh.mapper.MemberMapper;
import com.bsh.model.MemberVO;

@Service
public class MemberServiceImpl  implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	//회원가입
	@Override  
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	// 아이디 중복체크
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}
	
	//로그인
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}

}
