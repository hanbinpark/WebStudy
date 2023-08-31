package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.ICommand;

public class LogoutService implements ICommand {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		System.out.println("로그아웃 기능 구현");
		HttpSession session = request.getSession();
		
		// 로그아웃할 때는 invalidate()사용
		session.invalidate();
		
		return "main.jsp";
	}
}
