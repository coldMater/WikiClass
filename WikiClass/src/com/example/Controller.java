package com.example;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Service.adminLogin;
import com.Service.classInsert;
import com.Service.classUpdate;
import com.Service.command;
import com.Service.groupInsert;
import com.Service.groupUpdate;
import com.Service.memberJoin;
import com.Service.memberLogin;
import com.Service.mypageInsert;
import com.Service.nicknameUpdate;
import com.Service.noteInsert;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	HashMap<String, command> map = new HashMap<String, command>();

	@Override
	public void init() throws ServletException {
		super.init();
		map.put("memberLogin.do", new memberLogin());
		map.put("memberJoin.do", new memberJoin());
		map.put("groupInsert.do", new groupInsert());
		map.put("classInsert.do", new classInsert());
		map.put("noteInsert.do", new noteInsert());
		map.put("mypageInsert.do", new mypageInsert());
		map.put("adminLogin.do", new adminLogin());
		map.put("groupUpdate.do", new groupUpdate());
		map.put("classUpdate.do", new classUpdate());
		map.put("nicknameUpdate.do", new nicknameUpdate());
	}
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Start @@ com.example/Controllder.java");
		request.setCharacterEncoding("euc-kr");
		
		String uri = request.getRequestURI();
		System.out.println("연결된 uri --> "+uri);
		String path = request.getContextPath();
		System.out.println(path);
		String req_uri = uri.substring(path.length()+1);
		System.out.println("자른 후 문자열 --> "+req_uri);
		
		command command = null;
		command = map.get(req_uri);
		System.out.println("Final @@ com.example/Controllder.java");
		command.execute(request, response);
		
	}
}

