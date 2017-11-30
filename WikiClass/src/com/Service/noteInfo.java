package com.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.adminDAO;
import com.VO.memberInfoVO;
import com.VO.noteInfoVO;

@WebServlet("/noteInfo")
public class noteInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		adminDAO dao = new adminDAO();
		
		HttpSession session = request.getSession();
		
		ArrayList<noteInfoVO> list = dao.getNoteInfo();
		
		
		for (noteInfoVO infoVo : list) {
			infoVo.getAuthor();
			infoVo.getClassnum();
			infoVo.getNotename();
			infoVo.getPath();
			infoVo.getSenddate();
		}
		
		session.setAttribute("noteInfo",list);
		
		
		response.sendRedirect("admin/index/document.jsp");
		
		}
	}


