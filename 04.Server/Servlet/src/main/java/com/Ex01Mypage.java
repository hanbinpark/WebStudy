package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex01Mypage
 */
@WebServlet("/Ex01Mypage")
public class Ex01Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Hello World!");
		
		// 페이지를 요청한 client의 ip획득
		String ip = request.getRemoteAddr();
		System.out.println(ip);
		
		// 응답객체에 인코딩 적용
		response.setCharacterEncoding("EUC-KR");
		
		// Web Page Text 및 Tag를 사용하기 위해서는 out객체 필요
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		if(ip.equals("0:0:0:0:0:0:0:1")) {
			
			// 다영언니 : 192.168.0.83
			
			out.print("<h1>"+ip+"다영언니 Hi</h1>");
			out.print("<img src='img.jpg'>");
		}else {
			out.print("<h1>"+ip+"Hi</h1>");
			out.print("<img src='img.jpg'>");
		}
		out.print("</body>");
		out.print("</html>");
	}

}
