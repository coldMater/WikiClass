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

@WebServlet("/SerachPerson")
public class SerachPerson extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nickname = request.getParameter("nickname");
		
		memberDAO mdao = new memberDAO();
		MemberVO mvo = mdao.emailselectOne(nickname);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		System.out.println("넘어온 닉네임 값 : "+nickname);
		if(nickname=="") {
			out.print("비어있습니다.");
		}else if(mvo == null) {
			out.print("존재하지 않는 사용자입니다.");
		}else {
			out.print("추가가 가능한 사용자 입니다.");
		}
	}

}
