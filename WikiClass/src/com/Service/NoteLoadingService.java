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
import com.DAO.NoteDAO;
import com.VO.NodeVO;
import com.VO.NoteVO;

@WebServlet("/NoteLoadingService")
public class NoteLoadingService extends HttpServlet {
	NodeDAO nodeDAO = new NodeDAO();
	NoteDAO noteDAO = new NoteDAO();
	ArrayList<NodeVO> nodeList; // ���޵Ǵ� ���ڴ� Ŭ������ ��ȣ
	ArrayList<NoteVO> noteList;
	NodeVO nodeCursor;
	HashMap<String, ArrayList<NodeVO>> groupHash;
	String classID;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("Start @@ com.Service/NoteLoadingService.java");
		response.setContentType("text/html;charset=euc-kr");
		
		classID = (String)request.getAttribute("classIDnow");
		if(request.getAttribute("classIDnow")==null) {
			classID = request.getParameter("classNum");
		}
		if(classID==null) {
			classID = request.getParameter("classID");
		}
		nodeList = nodeDAO.select(classID);
		noteList = noteDAO.selectNotesByClassID(classID);
		
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
			
			//�±� �翷 ó��
			tag = "<ul style='border-left:2.5px solid rgba(32,192,255,0.5); left:-20px;padding-left:25px;'>"+tag+"</ul>";
			
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
		request.setAttribute("classNum", classID);
		request.setAttribute("noteID", noteID);
		
				
		System.out.println("Final @@ com.Service/NoteLoadingService.java");
		RequestDispatcher dispatcher = null;

		if(noteID==null) {
			dispatcher = request.getRequestDispatcher("class_print.jsp");
		} else {
			dispatcher = request.getRequestDispatcher("class_generic.jsp");
		}
		tag = "";
		dispatcher.forward(request, response);
		

	}

	int depth = 0;
	String tag ="";
	public String getNextGroup(ArrayList<NodeVO> groupBefore) {
		//�Ʒ� �κп��� ���� ������ HTML ������ ���������. 
		
		for (int i = 0; i < groupBefore.size(); i++) {
			NodeVO node =  groupBefore.get(i);
			String id = node.getNoteID();
			String pid = node.getParentID();
			String sid = node.getSiblingID();
			ArrayList<NodeVO> groupNext = groupHash.get(id);
			
			// <li>
			tag += "<li id = "+id+" class = 'note_list' data-nid ="+id+" data-pid="+pid+" data-sid="+sid+" data-depth="+depth+" style='border-top:0px;'>";
			tag += "<a draggable='true' ondrop='drag(event)' ondragover='d(event)' data-depth='"+depth+"'"+"class = 'note_link' style='display:inline;padding-bottom:0px;width:90%;' href = "+"'NoteLoadingService?classID="+classID+"&noteID="+id+"' title = '"+("[N:"+id+", P:"+pid+", S:"+sid+", D:"+depth+"]")+"'>";

			tag += getSpaceByDepth(depth) + getNoteVO(id).getTitle();

			tag += "</a>";
			if(depth==0) {
				
				// <span>
				if(groupNext == null) {
					tag+="<span data-depth='"+depth+"' style='padding-bottom:0px;padding-top:0px;top:-38px;left:10px;'>";

				} else {
					tag+="<span class='opener active' data-depth='"+depth+"' style='padding-bottom:0px;padding-top:0px;top:-38px;left:10px;'>";

				}
				
			}

			if(depth==0) {
				tag+="</span>";
			} else {
				tag+="</li>";
			}


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

	private String getSpaceByDepth(int depth2) {
		String temp = "";
		if(depth2==0) {
			
		} if(depth2==1) {
			
		} if(depth2>=2) {
			for (int i = 1; i < depth2; i++) {
				temp+="&nbsp&nbsp";
			}
		}
		return temp;
	}

	private NoteVO getNoteVO(String id) {
		NoteVO tempVO=null;
		for (int i = 0; i < noteList.size(); i++) {
			if(noteList.get(i).getNum().equals(id)) {
				tempVO = noteList.get(i);
			}
			
		}
		return tempVO;
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
