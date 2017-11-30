package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.adminDAO;

public class adminLogin implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String Password = request.getParameter("Password");
			
		System.out.println("adminLogin에 들어온 아이디와 비밀번호 : "+id+"/"+Password);
		adminDAO adao = new adminDAO();
		int cnt = adao.login(id,Password);

		try {
			if (cnt == 1) {// 1이면 로그인 성공
				/*
				//로그인 성공시 request영역으로 아이디 전달
				RequestDispatcher dis = request.getRequestDispatcher("admin/index/dashboard.jsp");
				dis.forward(request, response);
				*/
				System.out.println("adminLogin에 들어온 아이디 : "+id);
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				response.sendRedirect("admin/index/dashboard.jsp");
			} else {
				response.sendRedirect("adm.jsp");
			}
		} catch (IOException e) {
			System.out.println("adminLogin error");
			e.printStackTrace();
		}
		
	}

}
