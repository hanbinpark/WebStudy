package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex05makeTable
 */
@WebServlet("/Ex05makeTable")
public class Ex05makeTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String room = request.getParameter("room");
		System.out.println(room);
		
		int snum = Integer.parseInt(room);
		
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		out.print("<table border='1px solid black'>");
		out.print("<tr>");
		for(int i = 1; i <= snum; i++) {// for (초기식; 조건식; 증감식)
			out.print("<td>" + i + "</td>");
		}
		out.print("</tr>");
		out.print("</table>");
		
		out.print("</body>");
		out.print("</html>");
	}

}
