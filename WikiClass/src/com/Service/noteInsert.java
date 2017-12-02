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
import com.DAO.NoteHistoryDAO;
import com.VO.NodeVO;

import sun.rmi.server.Dispatcher;

public class noteInsert implements command{
	ArrayList<NodeVO> nodeList;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//클래스번호, 노트번호, 노트제목, 노트경로, 작성자, 작성날짜
		System.out.println("Start @@ com.Service/noteInsert.java");
		ClassDAO cdao = new ClassDAO();
		String classID = request.getParameter("classNum");
		String noteName = request.getParameter("noteName");
		String nickname = request.getParameter("nickname");
		String editor1 = request.getParameter("editor1");
		if(request.getSession().getAttribute("userNum")==null) {
			System.out.println("세션에 저장된 userNum 값이 없습니다. ");	
		}
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
				
		if(noteID!=null) {
			//결과값을 히스토리에 추가
			NoteHistoryDAO hisDAO = new NoteHistoryDAO();
			hisDAO.insertHistory(userNum, noteID, classID, "0", noteName, editor1); //분류(등록:0, 조회 : 1, 수정:2, 삭제:3)
		}
		
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
			
			System.out.println("Final @@ com.Service/noteInsert.java");
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
