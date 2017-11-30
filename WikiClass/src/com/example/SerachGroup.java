package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

@WebServlet("/SerachGroup")
public class SerachGroup extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		
		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.groupSelectOne(name);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(cnt != 0) {
			out.print("�׷��� �����մϴ�.");
		}else {
			out.print("��밡���� �׷� �Դϴ�.");
		}
		
	}

}