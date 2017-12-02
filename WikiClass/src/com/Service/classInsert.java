package com.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.DAO.FileDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class classInsert implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("클래스 만들기 버튼을 클릭하여 classInsert에 들어왔습니다.");
		response.setContentType("text/html; charset=euc-kr");
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		System.out.println("classInsert에서 세션으로 받아온 아이디 : "+email);
		
		//파일전송 Form인지를 체크
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
			
		ServletContext context =  request.getSession().getServletContext();//어플리케이션에 대한 정보를 가진다.  
		String saveDir = context.getRealPath("classImage");//컴퓨터의 절대경로를 받아온다.
		int maxSize = 3*1024*1024; //3MB
		String encoding = "euc-kr";
		MultipartRequest multi = null;
		System.out.println("절대경로 >> "+saveDir);
		
		
		try {
		//DefaultFileRenamePolicy(): 파일명이 중복될 경우 자동으로 바꿔준다.
		if(isMulti) {
			
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			
			FileDAO fdao = FileDAO.getInstance();
			String groupName = multi.getParameter("groupName");
			String className = multi.getParameter("className");
			String favortie = multi.getParameter("favortie");
			String img = multi.getFilesystemName("img");
			String editor1 = multi.getParameter("editor1");
			
			//권한 추가(권한 추가 가능한 사람들만 넘어옴
			//class_grant테이블에 클래스번호와 회원번호 추가
			String[] person = multi.getParameterValues("person");
			for (int i = 0; i < person.length; i++) {
				System.out.println("class_grant에 넘어갈 회원 닉네임 "+person[i]);
			}
			
			System.out.println("classInsert에서 className :" +className);
			int cnt=0;
			cnt = fdao.uploadImg(email, groupName, className, favortie, img, editor1);
			if(cnt>0) {
				System.out.println(img+"파일 저장 완료");
				String encoded = URLEncoder.encode(className);
				
				//그룹이름과 클래스 이름은 겹치는게 없으므로 클래스 번호를 가지고온다.
				int classNum = fdao.selectClassNumOne(groupName,className);
				System.out.println("classInsert에서 받은 classNum값 :"+classNum);
				cnt = fdao.classGrantInsert(person,className);
				if(cnt>0) {
					System.out.println("class Insert에서 권한 넣기 성공");
					response.sendRedirect("class_print.jsp?classNum="+classNum);
				}
				
			}else {
				System.out.println(img+"파일 저장 실패");
				request.setAttribute("classInsert", 2);
				RequestDispatcher dis = request.getRequestDispatcher("class_class_insert.jsp");
				dis.forward(request, response);
			}
			
		}else {
			System.out.println("일반전송 Form 입니다.");
		}
		
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
