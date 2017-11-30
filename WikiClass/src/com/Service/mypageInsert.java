package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

public class mypageInsert implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//���������� �о� �߰��κ� 
		String[] favortie = request.getParameterValues("favortie");
		String favortieResult = "";
		String email = request.getParameter("email");
		for (int i = 0; i < favortie.length; i++) {
			if(!(favortie[i].equals("-�о�-"))) {
				favortieResult+=favortie[i]+"_";
			}
		}
		System.out.println("���ɺо� �߰��� email : "+email);
		System.out.println("���õ� �о� : "+favortieResult);
		
		memberDAO mdao = new memberDAO();
		//ȸ���̸��Ϸ� ��ȣ�� ã�Ƽ� �о� �߰�
		int cnt = mdao.updateFavorite(email,favortieResult);
		System.out.println("mypageInsert cnt�� : "+ cnt);
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(cnt >0) {
				out.println("<script>alert('�о� ������ �Ϸ� �Ǿ����ϴ�.');</script>");
				System.out.println("�о� ���� �Ϸ�");
				response.sendRedirect("MyPage.jsp");
			}else {
				out.println("<script>alert('�о� ������ �����Ͽ����ϴ�.');</script>");
				System.out.println("�о� ���� ����");
				response.sendRedirect("MyPage.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
