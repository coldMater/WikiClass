package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

public class mypageInsert implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//마이페이지 분야 추가부분 
		String[] favortie = request.getParameterValues("favortie");
		String favortieResult = "";
		String email = request.getParameter("email");
		for (int i = 0; i < favortie.length; i++) {
			if(!(favortie[i].equals("-분야-"))) {
				favortieResult+=favortie[i]+"_";
			}
		}
		System.out.println("관심분야 추가한 email : "+email);
		System.out.println("선택된 분야 : "+favortieResult);
		
		memberDAO mdao = new memberDAO();
		//회원이메일로 번호를 찾아서 분야 추가
		int cnt = mdao.updateFavorite(email,favortieResult);
		System.out.println("mypageInsert cnt값 : "+ cnt);
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(cnt >0) {
				out.println("<script>alert('분야 설정이 완료 되었습니다.');</script>");
				System.out.println("분야 설정 완료");
				response.sendRedirect("MyPage.jsp");
			}else {
				out.println("<script>alert('분야 설정에 실패하였습니다.');</script>");
				System.out.println("분야 설정 실패");
				response.sendRedirect("MyPage.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
