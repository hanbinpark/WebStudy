package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.ICommand;
import com.model.MemberDTO;
import com.model.MessageDAO;

public class MsgAllDeleteService implements ICommand{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("메세지 전체 삭제 기능 구현");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		MessageDAO dao = new MessageDAO();
		
		dao.allDelete(info.getEmail());
		
		return "main.jsp#two";
		
	}

}
