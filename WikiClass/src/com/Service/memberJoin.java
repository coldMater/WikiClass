package com.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;

public class memberJoin implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("Password1");
		String nickname = request.getParameter("nickname");
		String uri = request.getParameter("uri");
		
		memberDAO mdao = new memberDAO();
		int cnt = mdao.join(email,password,nickname);
		
		try {
			RequestDispatcher dis = null;
			System.out.println("회원가입 cnt ="+cnt);
			if (cnt > 0) {// 1이면 회원가입 성공
				request.setAttribute("check", 2);
				dis = request.getRequestDispatcher("memberLogin.jsp?uri="+uri);
			} else {
				request.setAttribute("check", 3);
				dis = request.getRequestDispatcher("memberJoin.jsp");
			}
			dis.forward(request, response);
			
		} catch (IOException e) {
			System.out.println("memberJoin error");
			e.printStackTrace();
		}catch (ServletException e) {
			System.out.println("memberJoin dis error");
			e.printStackTrace();
		}

		
		
	}

}
