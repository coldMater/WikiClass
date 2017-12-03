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

public class classUpdate implements command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
		System.out.println("Ŭ���� ���� ��ư�� Ŭ���Ͽ� classUpdate�� ���Խ��ϴ�.");
		response.setContentType("text/html; charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		System.out.println("classUpdate���� �������� �޾ƿ� ���̵� : "+email);
		
		//�������� Form������ üũ
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
			
		ServletContext context =  request.getSession().getServletContext();//���ø����̼ǿ� ���� ������ ������.  
		String saveDir = context.getRealPath("classImage");//��ǻ���� �����θ� �޾ƿ´�.
		int maxSize = 3*1024*1024; //3MB
		String encoding = "euc-kr";
		MultipartRequest multi = null;
		System.out.println("������ >> "+saveDir);
		
		//DefaultFileRenamePolicy(): ���ϸ��� �ߺ��� ��� �ڵ����� �ٲ��ش�.
		if(isMulti) {
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			
			FileDAO fdao = FileDAO.getInstance();
			int classNum = Integer.parseInt(multi.getParameter("classNum"));
			String favortie = multi.getParameter("favortie");
			String img = multi.getFilesystemName("img");
			String editor1 = multi.getParameter("editor1");
			
			//���� �߰�(���� �߰� ������ ����鸸 �Ѿ��
			//class_grant���̺� Ŭ������ȣ�� ȸ����ȣ �߰�
			String[] person = multi.getParameterValues("person");
			for (int i = 0; i < person.length; i++) {
				System.out.println("class_grant�� �Ѿ ȸ�� �г��� "+person[i]);
			}
			
			System.out.println("classInsert���� classNum###�о� :" +classNum+"###"+favortie);
			if(favortie.equals("-�о�-")) {
				favortie="������������";
			}
			int cnt=0;
			cnt = fdao.classUploadImg(email, classNum, favortie, img, editor1);
			if(cnt>0) {
				System.out.println("Ŭ���� ���� �Ϸ�");
				String className = multi.getParameter("className");
				System.out.println("classInsert���� ���� classNum�� :"+classNum);
				cnt = fdao.classGrantInsert(person,className);
				if(cnt>0) {
					System.out.println("class Update���� ���� �ֱ� ����");
					response.sendRedirect("class_print.jsp?classNum="+classNum);
				}
				
			}else {
				System.out.println(img+"���� ���� ����");
				request.setAttribute("classUpdate", 2);
				RequestDispatcher dis = request.getRequestDispatcher("class_print.jsp.jsp");
				dis.forward(request, response);
			}
			
		}else {
			System.out.println("�Ϲ����� Form �Դϴ�.");
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
