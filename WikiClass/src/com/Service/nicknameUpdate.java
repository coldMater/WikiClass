package com.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class nicknameUpdate implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String nickname = request.getParameter("nicknameinput");
		
		
		
		
	}
}
