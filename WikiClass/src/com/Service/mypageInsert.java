package com.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mypageInsert implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//���������� �о� �߰��κ� 
		String[] favortie = request.getParameterValues("favortie");
		String favortieResult = "";
		
		for (int i = 0; i < favortie.length; i++) {
			favortieResult+=favortie[i]+",";
		}
		System.out.println("���õ� �о� : "+favortieResult);
		
		
	}

}
