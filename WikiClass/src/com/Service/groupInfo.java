package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.adminDAO;
import com.VO.groupInfoVO;
import com.VO.groupSearchVO;

@WebServlet("/groupInfo")
public class groupInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	adminDAO dao = new adminDAO();
		
		HttpSession session = request.getSession();
		
		ArrayList<groupInfoVO> list = dao.getGroupInfo();
		
		
		for (groupInfoVO groupInfo : list) {
			groupInfo.getNum();
			groupInfo.getName();
			groupInfo.getContent();		
		}
		
		session.setAttribute("groupInfo",list);
		
		
		response.sendRedirect("admin/index/group.jsp");
		
		}	
	

}
