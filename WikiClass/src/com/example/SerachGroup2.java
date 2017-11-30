package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;

/**
 * Servlet implementation class SerachGroup2
 */
@WebServlet("/SerachGroup2")
public class SerachGroup2 extends HttpServlet {
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		
		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.groupSelectOne(name);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(cnt != 0) {
			out.print("사용 가능한 그룹 입니다.");
		}else {
			out.print("그룹이 없습니다. 만드시려면 클릭하세요");
		}
		
	}

}
