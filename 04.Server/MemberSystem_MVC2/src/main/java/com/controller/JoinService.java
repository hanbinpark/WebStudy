package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post방식 - 한글깨짐방식
		request.setCharacterEncoding("EUC-KR");
		
		// 사용자가 입력한 7가지의 정보를 가져오기(id,pw,nick,email,phone,gender,age)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// 입력받은 정보를 데이터베이스에 저장하기
		MemberDAO dao = new MemberDAO();
		dao.join(new MemberDTO(id, pw, nick, email, phone, gender, age));
	
		// 회원가입 후 main.jsp로 이동하기
		response.sendRedirect("main.jsp");
	}

}
