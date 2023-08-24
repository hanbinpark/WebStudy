package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CommentsDAO;
import com.model.CommentsDTO;
import com.model.MemberDTO;
import com.model.ReviewDAO;
import com.model.ReviewDTO;

@WebServlet("/ReviewUpdateService")
public class ReviewUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		
		//HttpSession session = request.getSession();
				//MemberDTO info = (MemberDTO)session.getAttribute("info");
				
				//String id = info.getId();
				String id = "user";
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		int videoNo = Integer.parseInt(request.getParameter("videoNo")) ;
		String content = request.getParameter("content");
		int score = 0;
				//Integer.parseInt(request.getParameter("score")) ;
		
		System.out.println(no);
		System.out.println(videoNo);
		System.out.println(content);
		System.out.println(score);
		ReviewDTO dto = new ReviewDTO(videoNo,id, content, score,no);
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.update(dto);
		
		if(cnt > 0) {
			System.out.println("리뷰 수정 성공");
			
		}else {
			System.out.println("리뷰 수정 실패");
		}
	
		response.sendRedirect("video_contens_view.jsp?no="+videoNo);
	}

}
