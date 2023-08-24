package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex03Input
 */
@WebServlet("/Ex03Input")
public class Ex03Input extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// url mapping 기본값은 class명과 동일
		
		//ex03input.html에서 작성한 text값을 console에 출력
		
		String talk = request.getParameter("talk");
		System.out.println(talk);
		
		
	}

}
