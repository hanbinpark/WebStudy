package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.PostDAO;
import com.model.PostDTO;

@WebServlet("/PostSearchService")
public class PostSearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String input = request.getParameter("searchTitle");
	
		PostDAO dao = new PostDAO();
		ArrayList<PostDTO> list = dao.searchTitle(input);
	
	}

}
