package com.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;


public class memberLogin implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("Password");
		String uri = request.getParameter("uri");
		
		System.out.println("memberLogin.java uri = "+uri);
		memberDAO mdao = new memberDAO();
		int cnt = mdao.login(email,password);
		String userNum = mdao.emailselect(email).getNum()+"";
		//로그인 횟수 카운트(미구현)
		//mdao.logincount();
		
		
		try {
			if (cnt == 1) {// 1이면 로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("userNum", userNum);
				
				//접근한 곳에 따라 로그인 후 띄어주는 창이 다르다.
				if(uri.equals("main_index.jsp")) {
					response.sendRedirect("main_index.jsp");
				}else{
					response.sendRedirect("class_index.jsp");
				}
			} else {
				//로그인 실패시 경고창 띄우기...
				request.setAttribute("check", 1);
				RequestDispatcher dis = request.getRequestDispatcher("memberLogin.jsp?uri="+uri);
				
				try {
					dis.forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				}
				
			}
		} catch (IOException e) {
			System.out.println("memberLogin error");
			e.printStackTrace();
		}
		
		
	}

}
