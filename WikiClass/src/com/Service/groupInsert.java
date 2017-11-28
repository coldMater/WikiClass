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
		
		//그룹이름, 그룹에대한 설명 데이터베이스에 추가
		//사람들 그룹 번호에 맞는 추가
		String name = request.getParameter("groupName");
		String content = request.getParameter("groupContent");
		String[] person = request.getParameterValues("person");
		
		System.out.println("그룹 명 : "+name);
		System.out.println("그룹 설명 : "+content);
		System.out.print("추가된 사람 :");
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i]+"/");
		}
		
		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.groupInsert(name,content);
		
		try {
			PrintWriter out = response.getWriter();
		if(cnt>0) {
			//그룹의 이름으로 검색해서 그룹 번호를 가지고온다.
			//그룹에 추가된 사람 테이블에서 그룹번호, 닉네임 저장
			int groupnum = cdao.groupNumselect(name);
			cnt = cdao.personInsert(groupnum,person);
			
			if(cnt>0) {
				out.println("<script>");
				out.println("alert('그룹이 생성되었습니다.');");
				out.println("</script>");
				response.sendRedirect("class_index.jsp");
			}
		}else {
				out.println("<script>");
				out.println("alert('그룹이 생성되었습니다.');");
				out.println("</script>");
				response.sendRedirect("class_index.jsp");
		}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
