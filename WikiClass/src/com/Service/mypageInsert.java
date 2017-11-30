package com.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mypageInsert implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//마이페이지 분야 추가부분 
		String[] favortie = request.getParameterValues("favortie");
		String favortieResult = "";
		
		for (int i = 0; i < favortie.length; i++) {
			favortieResult+=favortie[i]+",";
		}
		System.out.println("선택된 분야 : "+favortieResult);
		
		
	}

}
