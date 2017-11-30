package com.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

public class noteInsert implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//클래스번호, 노트번호, 노트제목, 노트경로, 작성자, 작성날짜
		ClassDAO cdao = new ClassDAO();
		int classNum = Integer.parseInt(request.getParameter("classNum"));
		String noteName = request.getParameter("noteName");
		String nickname = request.getParameter("nickname");
		String editer1 = request.getParameter("editor1");
		
		System.out.println("클래스 번호 : "+classNum);
		System.out.println("노트 제목 : "+noteName);
		System.out.println("작성자 : "+nickname);
		System.out.println("노트 글 : "+editer1);
		
		
		
	}

}
