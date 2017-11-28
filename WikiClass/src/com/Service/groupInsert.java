package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

public class groupInsert implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			response.setContentType("text/html; charset=euc-kr");
		
		//�׷��̸�, �׷쿡���� ���� �����ͺ��̽��� �߰�
		//����� �׷� ��ȣ�� �´� �߰�
		String name = request.getParameter("groupName");
		String content = request.getParameter("groupContent");
		String[] person = request.getParameterValues("person");
		
		System.out.println("�׷� �� : "+name);
		System.out.println("�׷� ���� : "+content);
		System.out.print("�߰��� ��� :");
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i]+"/");
		}
		
		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.groupInsert(name,content);
		
		try {
			PrintWriter out = response.getWriter();
		if(cnt>0) {
			//�׷��� �̸����� �˻��ؼ� �׷� ��ȣ�� ������´�.
			//�׷쿡 �߰��� ��� ���̺��� �׷��ȣ, �г��� ����
			int groupnum = cdao.groupNumselect(name);
			cnt = cdao.personInsert(groupnum,person);
			
			if(cnt>0) {
				out.println("<script>");
				out.println("alert('�׷��� �����Ǿ����ϴ�.');");
				out.println("</script>");
				response.sendRedirect("class_index.jsp");
			}
		}else {
				out.println("<script>");
				out.println("alert('�׷��� �����Ǿ����ϴ�.');");
				out.println("</script>");
				response.sendRedirect("class_index.jsp");
		}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
