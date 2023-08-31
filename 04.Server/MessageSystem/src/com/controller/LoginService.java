package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.ICommand;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class LoginService implements ICommand{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		System.out.println("로그인 기능 구현");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
	
		MemberDTO dto = new MemberDTO(email, pw);
		MemberDAO dao = new MemberDAO();
		
		MemberDTO info = dao.login(dto);
		if(info != null) {
			// 세션에 로그인 정보 저장
			// 세션은 서버에 있는 영역
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		}else {
			System.out.println("로그인 실패");
		}
	
		return "main.jsp";
	}
}
