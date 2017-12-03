package com.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.VO.MemberVO;


public class memberLogin implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("Password");
		String uri = request.getParameter("uri");
		
		System.out.println("memberLogin.java���� �Ѿ�� �̸���/�н����� : "+email+"/"+password);
		
		System.out.println("memberLogin.java uri = "+uri);
		memberDAO mdao = new memberDAO();
		int cnt = mdao.login(email,password);
		
		
		
		
		try {
			if (cnt == 1) {// 1�̸� �α��� ����
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				
				//�α��� �Ŀ� �α����� ��ȣ ��ȯ
				MemberVO mvo = mdao.emailselect(email);
				String userNum = mvo.getNum()+"";
				session.setAttribute("userNum", userNum);
				
				//������ ���� ���� �α��� �� ����ִ� â�� �ٸ���.
				if(uri.equals("main_index.jsp")) {
					response.sendRedirect("main_index.jsp");
				}else{
					response.sendRedirect("class_index.jsp");
				}
			} else {
				//�α��� ���н� ���â ����...
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
