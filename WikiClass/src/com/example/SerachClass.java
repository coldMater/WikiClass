package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

@WebServlet("/SerachClass")
public class SerachClass extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String groupName = request.getParameter("groupName");
		String className = request.getParameter("className");
		
		ClassDAO cdao = new ClassDAO();
		//�׷� �̸����� �׷� ��ȣ�� ���������, �׷��ȣ�� Ŭ���� �̸����� ���� �ִ��� Ȯ��
		int cnt = cdao.groupclassSelectOne(groupName,className);
		
		//�׷��� �ִ��� Ȯ��
		int cnt2 = cdao.groupSelectOne(groupName);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(cnt2==1) {
			if(cnt==1) {
				out.print("����� �� ���� class�Դϴ�.");
			}else {
				out.print("��� ���� �� class�Դϴ�.");
			}
		}else {
			out.print("�׷��� ���� ����� �ּ���.");
		}
		
		
	}

}
