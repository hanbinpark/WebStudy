package com.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.VideoDAO;
import com.model.VideoDTO;

@WebServlet("/SearchService")
public class SearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		
		String titleInput = request.getParameter("title");
		System.out.println(titleInput);
		
		VideoDAO dao = new VideoDAO();
		ArrayList<VideoDTO> video = dao.select(titleInput);
		
		if (video.size() == 0) {
			System.out.println("null");
		} else {
			for(int i=0;i<video.size();i++) {
				System.out.println(video.get(i));
			}
			
		}
		
		response.sendRedirect("videoList.jsp");
	}
	
}
