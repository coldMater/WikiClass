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
		//그룹 이름으로 그룹 번호를 가지고오고, 그룹번호랑 클래스 이름으로 값이 있는지 확인
		int cnt = cdao.groupclassSelectOne(groupName,className);
		
		//그룹이 있는지 확인
		int cnt2 = cdao.groupSelectOne(groupName);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(cnt2==1) {
			if(cnt==1) {
				out.print("사용할 수 없는 class입니다.");
			}else {
				out.print("사용 가능 한 class입니다.");
			}
		}else {
			out.print("그룹을 먼저 만들어 주세요.");
		}
		
		
	}

}
