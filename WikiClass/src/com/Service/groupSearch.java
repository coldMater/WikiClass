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
import com.VO.groupSearchVO;
import com.VO.noteSearchVO;

@WebServlet("/groupSearch")
public class groupSearch extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		adminDAO dao = new adminDAO();
		
		HttpSession session = request.getSession();
		
		String search = (String)request.getParameter("search");
		ArrayList<groupSearchVO> list = dao.getGroupSearch(search);
		
		
		for (groupSearchVO groupSearch : list) {
		groupSearch.getNum();
		groupSearch.getName();
		groupSearch.getContent();		
		}
		
		session.setAttribute("groupInfo",list);
		
		
		response.sendRedirect("admin/index/group.jsp");
		
		}	

}
