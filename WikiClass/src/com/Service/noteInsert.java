package com.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

public class noteInsert implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//Ŭ������ȣ, ��Ʈ��ȣ, ��Ʈ����, ��Ʈ���, �ۼ���, �ۼ���¥
		ClassDAO cdao = new ClassDAO();
		int classNum = Integer.parseInt(request.getParameter("classNum"));
		String noteName = request.getParameter("noteName");
		String nickname = request.getParameter("nickname");
		String editer1 = request.getParameter("editor1");
		
		System.out.println("Ŭ���� ��ȣ : "+classNum);
		System.out.println("��Ʈ ���� : "+noteName);
		System.out.println("�ۼ��� : "+nickname);
		System.out.println("��Ʈ �� : "+editer1);
		
		
		
	}

}
