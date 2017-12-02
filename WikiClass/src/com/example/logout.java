package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logout extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getParameter("uri");
		
		HttpSession session = request.getSession();
		session.removeAttribute("email");
		session.removeAttribute("userNum");
		
		if(uri.equals("main_index.jsp")) {
			response.sendRedirect("main_index.jsp");
		}else {
			response.sendRedirect("class_index.jsp");
		}
	}

}
