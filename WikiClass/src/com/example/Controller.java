package com.example;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Service.adminLogin;
import com.Service.command;
import com.Service.groupInsert;
import com.Service.memberJoin;
import com.Service.memberLogin;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	HashMap<String, command> map = new HashMap<String, command>();
	
	@Override
	public void init() throws ServletException {
		super.init();
		map.put("adminLogin.do", new adminLogin());
		map.put("memberLogin.do", new memberLogin());
		map.put("memberJoin.do", new memberJoin());
		map.put("groupInsert.do", new groupInsert());
		
	}
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		String uri = request.getRequestURI();
		System.out.println("연결된 uri --> "+uri);
		String path = request.getContextPath();
		System.out.println(path);
		String req_uri = uri.substring(path.length()+1);
		System.out.println("자른 후 문자열 --> "+req_uri);
		
		command command = null;
		command = map.get(req_uri);
		command.execute(request, response);
	}
}
