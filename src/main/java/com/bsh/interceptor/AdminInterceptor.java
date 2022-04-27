package com.bsh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bsh.model.MemberVO;

public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO lvo = (MemberVO) session.getAttribute("member");
		if(lvo == null || lvo.getAdminCk() == 0) {		//관리자 게정이 아닌 경우
			response.sendRedirect("/main");
			return false;
		}
		return true;		//관리자 계정인 경우
	}

}
