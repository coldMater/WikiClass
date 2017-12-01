package com.Service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;
import com.DAO.NodeDAO;
import com.DAO.NoteDAO;
import com.VO.NodeVO;

import sun.rmi.server.Dispatcher;

public class noteInsert implements command{
	ArrayList<NodeVO> nodeList;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//클래스번호, 노트번호, 노트제목, 노트경로, 작성자, 작성날짜
		ClassDAO cdao = new ClassDAO();
		String classID = request.getParameter("classNum");
		String noteName = request.getParameter("noteName");
		String nickname = request.getParameter("nickname");
		String editor1 = request.getParameter("editor1");
		System.out.println("세션에서 가져온 Num 값 : "+request.getSession().getAttribute("userNum"));
		String userNum = (String)request.getSession().getAttribute("userNum");
		
		System.out.println("클래스 번호 : "+classID);
		System.out.println("노트 제목 : "+noteName);
		System.out.println("작성자 : "+nickname);
		System.out.println("노트 글 : "+editor1);
		
		NodeDAO dao = new NodeDAO();
		nodeList = dao.getElders(classID);
		
		NoteDAO noteDao = new NoteDAO();
		
		ServletContext context =  request.getSession().getServletContext();//어플리케이션에 대한 정보를 가진다.  
		String saveDir = context.getRealPath("NoteText");
		System.out.println(saveDir);
		
		String lastSiblingID = "0"; // 클래스 생성 후 최초 추가시 sibling id 는 0 이다.
		if(getLastSibling() != null) {
			lastSiblingID = getLastSibling().getNoteID();
		} 
		String noteID = noteDao.insertNote(noteName, saveDir, lastSiblingID, classID, userNum);
		
		String fileName = saveDir+"\\"+noteID+".txt";
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName));
			fw.write(editor1);
			fw.flush();
			fw.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println("=====insertNote.java=====");
		try {
			
			request.setAttribute("classIDnow", classID);
			request.setAttribute("noteID", noteID);
			RequestDispatcher dis = request.getRequestDispatcher("NoteLoadingService");
			dis.forward(request, response);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public NodeVO getLastSibling(){
		NodeVO lastNode = null;
		for(int i = 0;i<nodeList.size();i++) {
			if (nodeList.get(i).getSiblingID().equals("0")) {
				lastNode = nodeList.get(i);
				String brotherID = lastNode.getNoteID();
				//해당 노트의 ID 를 가지는 노드가 있는지
				while (true) {
					if (getNodeBySibling(brotherID) != null) {
						lastNode = getNodeBySibling(brotherID);
						brotherID = getNodeBySibling(brotherID).getNoteID();
					} else {
						break;
					}
				}
			}
	
		}
		return lastNode;
	}
	
	public NodeVO getNodeBySibling(String siblingID) {
		for (int i = 0; i < nodeList.size(); i++) {
			if (nodeList.get(i).getSiblingID().equals(siblingID)) {
				return nodeList.get(i);
			}
		}
		return null;
	}

	public NodeVO getNodeByID(String ID) {
		for (int i = 0; i < nodeList.size(); i++) {
			if (nodeList.get(i).getNoteID().equals(ID)) {
				return nodeList.get(i);
			}
		}
		return null;
	}
}
