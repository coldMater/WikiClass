package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.VO.MemberVO;

@WebServlet("/SerachEmail")
public class SerachEmail extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		System.out.println("넘겨 받은 값 >> "+email);
		
		memberDAO mdao = new memberDAO();
		MemberVO wmvo = mdao.emailselect(email);
		
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(wmvo == null) {
			out.print("가입가능한 이메일입니다.");
		}else {
			out.print("이메일이 존재합니다.");
		}
		
		
	}

}
