package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.VO.MemberVO;

@WebServlet("/SerachClassPerson")
public class SerachClassPerson extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�Ѿ�� �г����� ���� �׷���� ������� �ľ�
		//�׷� �̸����� �׷� ��ȣ �˰� �г����� �ִ��� �ľ�
		String nickname = request.getParameter("nickname");
		String groupname = request.getParameter("groupname");
		
		System.out.println("SerachClassPerson���� �Ѿ�� �г���/�׷��̸�"+nickname+"/"+groupname);
		
		memberDAO mdao = new memberDAO();
		int cnt = mdao.groupPersonSelectOne(nickname,groupname);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(nickname=="") {
			out.print("����ֽ��ϴ�.");
		}else if(cnt == 0) {
			out.print("�׷쿡 �������� �ʴ� ������Դϴ�.");
		}else {
			out.print("�߰��� ������ ����� �Դϴ�.");
		}
	
	
	}

}
