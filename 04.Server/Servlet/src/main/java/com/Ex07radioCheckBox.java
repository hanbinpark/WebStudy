package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex07radioCheckBox
 */
@WebServlet("/Ex07radioCheckBox")
public class Ex07radioCheckBox extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		String marriage = request.getParameter("marriage");
		
		// 동일한 name으로 여러 개의 데이터를 받는 방법
		String[] hobby = request.getParameterValues("hobby");
		
		System.out.println(marriage);
		
		// 체크한 취미 개수만큼 출력
		for(int i = 0; i < hobby.length; i++) {
			System.out.println(hobby[i]);			
		}
	}

}
