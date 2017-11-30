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
			
		System.out.println("adminLogin�� ���� ���̵�� ��й�ȣ : "+id+"/"+Password);
		adminDAO adao = new adminDAO();
		int cnt = adao.login(id,Password);

		try {
			if (cnt == 1) {// 1�̸� �α��� ����
				/*
				//�α��� ������ request�������� ���̵� ����
				RequestDispatcher dis = request.getRequestDispatcher("admin/index/dashboard.jsp");
				dis.forward(request, response);
				*/
				System.out.println("adminLogin�� ���� ���̵� : "+id);
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
