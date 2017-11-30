package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import com.DAO.adminDAO;
import com.VO.memberInfoVO;

import oracle.net.aso.a;
@WebServlet("/memberInfo")
public class memberInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		adminDAO dao = new adminDAO();
		
		HttpSession session = request.getSession();
		
		ArrayList<memberInfoVO> list = dao.getMemberInfo();
		
		
		for (memberInfoVO vo : list) {
			vo.getCompany();
			vo.getEmail();
			vo.getFavorite();
			vo.getGender();
			vo.getNickname();
			vo.getNum();
			vo.getSenddate();
			vo.getAge();
		}
		
		session.setAttribute("memberInfo",list);
		
		
		response.sendRedirect("admin/index/member.jsp");
		
		}
	
	
		
	
	
}
