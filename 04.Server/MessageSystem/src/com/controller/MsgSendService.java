package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MessageDAO;
import com.model.MessageDTO;

@WebServlet("/MsgSendService")
public class MsgSendService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		String send_name = request.getParameter("send_name");
		String receive_email = request.getParameter("receive_email");
		String content = request.getParameter("content");
	
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO(send_name, receive_email, content);
		
		
		int cnt = dao.insert(dto);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "메세지 전송 성공!";
		}else {
			msg = "메세지 전송 실패...";
			
		}
		
		response.setCharacterEncoding("EUC-KR");
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>"
				+  "alert('"+msg+"');"
				+  "location.href='main.jsp#two';"
				+ "</script>");
	
	}

}
