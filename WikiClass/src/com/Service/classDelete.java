package com.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.adminDAO;

@WebServlet("/classDelete")
public class classDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 int num = Integer.parseInt(request.getParameter("num"));

		try {
			adminDAO dao = new adminDAO();
			int cnt = dao.classDelete(num);

			if (cnt > 0)
				response.sendRedirect("groupInfo");
		} catch (Exception e) {
			System.out.println("classDelete Fail");

	}

}
}