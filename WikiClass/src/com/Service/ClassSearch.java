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
import com.VO.ClassSearchVO;
import com.VO.groupInfoVO;

@WebServlet("/ClassSearch")
public class ClassSearch extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		adminDAO dao = new adminDAO();
		
		HttpSession session = request.getSession();
		
		String classSearch=request.getParameter("num");
		
		ArrayList<ClassSearchVO> list = dao.getClassSearch(classSearch);
		
		for (ClassSearchVO ClassSearch : list) {
			ClassSearch.getNum();
			ClassSearch.getName();
			ClassSearch.getClasspath();
			ClassSearch.getFavorite();	
			ClassSearch.getImagepath();		
			ClassSearch.getMem_num();		
			ClassSearch.getSenddate();		
			ClassSearch.getGroup_num();	
		}
		
		session.setAttribute("ClassSearch",list);
		
		
		response.sendRedirect("admin/index/group.jsp");
		
		}	

}
