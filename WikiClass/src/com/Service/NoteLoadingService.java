package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.NodeDAO;
import com.VO.NodeVO;

@WebServlet("/NoteLoadingService")
public class NoteLoadingService extends HttpServlet {
	NodeDAO noteDAO = new NodeDAO();
	ArrayList<NodeVO> nodeList; // ���޵Ǵ� ���ڴ� Ŭ������ ��ȣ
	NodeVO nodeCursor;
	HashMap<String, ArrayList<NodeVO>> groupHash;
	String classID;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		
		classID = (String)request.getAttribute("classIDnow");
		if(request.getAttribute("classIDnow")==null) {
			classID = request.getParameter("classNum");
		}
		if(classID==null) {
			classID = request.getParameter("classID");
		}

		System.out.println("������ classID: "+classID);
		nodeList = noteDAO.select(classID);
		
		HashSet<String> parentIDList = new HashSet<String>();
		groupHash = new HashMap<String, ArrayList<NodeVO>>();

		// Node Grouping

		// ParentID �� �����ϱ�(Set �� �̿��Ͽ� �ߺ��� �����ϰ� �Է�)
		for (int i = 0; i < nodeList.size(); i++) {
			String parentID = nodeList.get(i).getParentID();
			parentIDList.add(parentID);
		}

		// �Էµ� ParentID ���� �׷����ϱ�
		Iterator<String> pl = parentIDList.iterator();
		while (pl.hasNext()) {
			ArrayList<NodeVO> tempNode = new ArrayList<NodeVO>();
			String parentID = pl.next();
			for (int i = 0; i < nodeList.size(); i++) {
				if (nodeList.get(i).getParentID().equals(parentID)) {
					if (nodeList.get(i).getSiblingID().equals("0")) {
						tempNode.add(nodeList.get(i));
						String brotherID = nodeList.get(i).getNoteID();
						while (true) {
							if (getNodeBySibling(brotherID) != null) {
								tempNode.add(getNodeBySibling(brotherID));
								brotherID = getNodeBySibling(brotherID).getNoteID();
							} else {
								break;
							}
						}
					}
				}
			}
			groupHash.put(parentID, tempNode);
		}

		// parentID �� �׷� ����غ���


		// parentID �� 0 �� �׷� ���� (groupHash ���� - HashMap �̿�)

		ArrayList<NodeVO> groupZero = groupHash.get("0");
		if (groupZero != null) {
			getNextGroup(groupZero);

			tag = "<ul>"+tag+"</ul>";
			
			System.out.println("=====NoteLoadingService.java/Servlet=====");

			request.setAttribute("classIDnow", classID);
			
		} else {
			System.out.println("groupZero �� ����. ");
		}
		String noteID = (String) request.getAttribute("noteID");
		if(noteID==null) {
			noteID=(String)request.getParameter("noteID");
		}
		String menuList = tag;
		request.setAttribute("list", menuList);
		request.setAttribute("classID", classID);
		request.setAttribute("noteID", noteID);
		System.out.println("���⼭ noteID �� ? "+noteID);
		if(noteID==null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("class_print.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("class_generic.jsp");
	        dispatcher.forward(request, response);	
		}
		
		tag = "";
	}

	int depth = 0;
	String tag = "";

	public String getNextGroup(ArrayList<NodeVO> groupBefore) {

		for (int i = 0; i < groupBefore.size(); i++) {
			NodeVO node =  groupBefore.get(i);
			String id = node.getNoteID();
			String pid = node.getParentID();
			String sid = node.getSiblingID();
			
			tag += "<li>";
			if(depth==0) {
				tag+="<span class = 'opener'>";
			}
			

			tag += "<a href = "+"'NoteLoadingService?classID="+classID+"&noteID="+id+"'>";
			tag += id + "([P:"+pid+" |S:"+sid+" |D:" + depth + ")";
			tag += "</a>";
			if(depth==0) {
				tag+="</span>";
			} else {
				tag+="</li>";
			}

			ArrayList<NodeVO> groupNext = groupHash.get(id);
			if (groupNext == null)
				continue;

			depth++;
			tag += "<ul>";
			getNextGroup(groupNext);
			depth--;
			tag += "</ul>";

			
		}

		return tag;
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