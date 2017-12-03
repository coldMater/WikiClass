package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

public class groupUpdate implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=euc-kr");

		// �׷��̸�, �׷쿡���� ���� �����ͺ��̽��� ������Ʈ
		// ����� �׷� ��ȣ�� �´� �߰�
		String name = request.getParameter("groupName");
		int num = Integer.parseInt(request.getParameter("groupNum"));
		String content = request.getParameter("groupContent");
		String[] person = request.getParameterValues("person");
		
		
		System.out.println("�׷� ��ȣ: " + num);
		System.out.println("�׷� ���� : " + content);
		System.out.print("�߰��� ��� :");
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i] + "/");
		}

		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.groupUpdate(num, content);

		try {
			PrintWriter out = response.getWriter();
			if (cnt > 0) {
				// �׷��� �̸����� �˻��ؼ� �׷� ��ȣ�� ������´�.
				// �׷쿡 �߰��� ��� ���̺��� �׷��ȣ, �г��� ����
				int groupnum = cdao.groupNumselect(name);
				cnt = cdao.personInsert(groupnum, person);

				if (cnt > 0) {
					request.setAttribute("groupUpdate", 1);
					RequestDispatcher dis = request.getRequestDispatcher("group_print.jsp");
					dis.forward(request, response);
				} else {
					request.setAttribute("groupUpdate", 2);
					RequestDispatcher dis = request.getRequestDispatcher("group_print.jsp");
					dis.forward(request, response);
				}
			} else {
				request.setAttribute("groupUpdate", 2);
				RequestDispatcher dis = request.getRequestDispatcher("group_print.jsp");
				dis.forward(request, response);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
