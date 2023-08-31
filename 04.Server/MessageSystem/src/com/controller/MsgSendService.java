package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.ICommand;
import com.model.MessageDAO;
import com.model.MessageDTO;

public class MsgSendService implements ICommand {
	
		@Override
		public String execute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			System.out.println("메세지 전송 기능 구현");
			
			String send_name = request.getParameter("send_name");
			String receive_email = request.getParameter("receive_email");
			String content = request.getParameter("content");
		
			MessageDAO dao = new MessageDAO();
			MessageDTO dto = new MessageDTO(send_name, receive_email, content);
			
			
			int cnt = dao.insert(dto);
			
		
			return "main.jsp#two"; // #two 메세지 작성했던 곳으로 이동
		}
		
		
	
}
