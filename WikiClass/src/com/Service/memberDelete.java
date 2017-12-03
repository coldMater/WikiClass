package com.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.adminDAO;

@WebServlet("/memberDelete")
public class memberDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String num = request.getParameter("num");

		try {
			adminDAO dao = new adminDAO();
			int cnt = dao.memberDelete(num);

			if (cnt > 0)
				response.sendRedirect("memberInfo");
		} catch (Exception e) {
			System.out.println("memberDelete Fail");
		}
		
	}

}
