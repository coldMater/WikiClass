package com.VO;

import java.util.ArrayList;

import com.DAO.adminDAO;

public class GraphFieldClassVO {
		
	adminDAO dao = new adminDAO();
	
	
	ArrayList<GraphFieldClassVO> SearchList = dao.GraphFieldClass();


	public GraphFieldClassVO(ArrayList<GraphFieldClassVO> i) {
		super();
		SearchList = i;
	}


	
	
	
	}


	
	
	
	

