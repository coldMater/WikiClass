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

		// 그룹이름, 그룹에대한 설명 데이터베이스에 업데이트
		// 사람들 그룹 번호에 맞는 추가
		String name = request.getParameter("groupName");
		int num = Integer.parseInt(request.getParameter("groupNum"));
		String content = request.getParameter("groupContent");
		String[] person = request.getParameterValues("person");
		
		
		System.out.println("그룹 번호: " + num);
		System.out.println("그룹 설명 : " + content);
		System.out.print("추가된 사람 :");
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i] + "/");
		}

		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.groupUpdate(num, content);

		try {
			PrintWriter out = response.getWriter();
			if (cnt > 0) {
				// 그룹의 이름으로 검색해서 그룹 번호를 가지고온다.
				// 그룹에 추가된 사람 테이블에서 그룹번호, 닉네임 저장
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
