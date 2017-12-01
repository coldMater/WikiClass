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

@WebServlet("/SerachClassPerson")
public class SerachClassPerson extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//넘어온 닉네임이 속한 그룹안의 사람인지 파악
		//그룹 이름으로 그룹 번호 알고 닉네임이 있는지 파악
		String nickname = request.getParameter("nickname");
		String groupname = request.getParameter("groupname");
		
		System.out.println("SerachClassPerson으로 넘어온 닉네임/그룹이름"+nickname+"/"+groupname);
		
		memberDAO mdao = new memberDAO();
		int cnt = mdao.groupPersonSelectOne(nickname,groupname);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(nickname=="") {
			out.print("비어있습니다.");
		}else if(cnt == 0) {
			out.print("그룹에 존재하지 않는 사용자입니다.");
		}else {
			out.print("추가가 가능한 사용자 입니다.");
		}
	
	
	}

}
