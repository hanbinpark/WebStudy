package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class Ex02GSON
 */
@WebServlet("/Gson")
public class Ex02GSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// JSON객체생성
		JsonObject jsonObj = new JsonObject();
		
		// JSON객체에 속성과 값 추가하기
		jsonObj.addProperty("data","Hello");
		jsonObj.addProperty("data2","JSON객체생성성공!");
		
		// 만들어진 JSON객체 출력해보기
		System.out.println(jsonObj);
		
		// 응답한 형식을 지정 + 한글데이터가 꺠지지않도록 설정!
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(jsonObj);
		
	}

}
