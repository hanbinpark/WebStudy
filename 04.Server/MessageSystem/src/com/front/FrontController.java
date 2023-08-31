package com.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.JoinService;
import com.controller.LoginService;
import com.controller.LogoutService;
import com.controller.MsgAllDeleteService;
import com.controller.MsgDeleteService;
import com.controller.MsgSendService;
import com.controller.UpdateService;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.MessageDAO;
import com.model.MessageDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	// HashMap 생성
	HashMap<String, ICommand> map = new HashMap<>();
	
	
	@Override
	public void init() throws ServletException {
		super.init();
		// 누군가에 의해서 현재 서블릿 들어오게 된다면
		// 서블릿을 실행할 수 있게 서블릿 객체를 생성하는 메소드
		// 이 메소드는 최초에 의해서 1번만 실행됨
		map.put("JoinService.do", new JoinService());
		map.put("LoginService.do", new LoginService());
		map.put("LogoutService.do", new LogoutService());
		map.put("UpdateService.do", new UpdateService());
		map.put("MsgSendService.do", new MsgSendService());
		map.put("MsgAllDelete.do", new MsgAllDeleteService());
		map.put("MsgDelete.do", new MsgDeleteService());
		
	}

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("프론트 컨트롤러 실행!");
		
		// 1. client가 요쳥한 URL 가져오기
		String requestURI = request.getRequestURI();
		
		// 2. Context Path (웹 어플리케이션의 시작 주소)
		String contextPath = request.getContextPath();
	
		// 3. client 요청 부분만 분리
		String command = requestURI.substring(contextPath.length()+1);
		
		request.setCharacterEncoding("EUC-KR");
		
		//ICommand service = map.get(command);
		//String moveUrl = service.execute(request, response);
		//response.sendRedirect(moveUrl);
		
		response.sendRedirect(map.get(command).execute(request, response));
	}

}
