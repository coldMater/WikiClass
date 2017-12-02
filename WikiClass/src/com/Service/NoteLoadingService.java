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
	ArrayList<NodeVO> nodeList; // 전달되는 인자는 클래스의 번호
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

		// ParentID 를 추출하기(Set 을 이용하여 중복값 제외하고 입력)
		for (int i = 0; i < nodeList.size(); i++) {
			String parentID = nodeList.get(i).getParentID();
			parentIDList.add(parentID);
		}

		// 입력된 ParentID 별로 그룹핑하기
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

		// parentID 별 그룹 출력해보기


		// parentID 가 0 인 그룹 선택 (groupHash 변수 - HashMap 이용)

		ArrayList<NodeVO> groupZero = groupHash.get("0");
		if (groupZero != null) {
			getNextGroup(groupZero);

			tag = "<ul>"+tag+"</ul>";
			
			System.out.println("=====NoteLoadingService.java/Servlet=====");

			request.setAttribute("classIDnow", classID);
			
		} else {
			System.out.println("groupZero 가 없다. ");
		}
		String noteID = (String) request.getAttribute("noteID");
		if(noteID==null) {
			
			noteID=(String)request.getParameter("noteID");
		}
		String menuList = tag;
		request.setAttribute("list", menuList);
		request.setAttribute("classID", classID);
		request.setAttribute("noteID", noteID);
		
		System.out.println("classID : "+classID);
		System.out.println("noteID : "+noteID);
		
		System.out.println("Final @@ com.Service/NoteLoadingService.java");
		RequestDispatcher dispatcher = null;

		if(noteID==null) {
			dispatcher = request.getRequestDispatcher("class_print.jsp");
		} else {
			dispatcher = request.getRequestDispatcher("class_generic.jsp");
		}
		
		dispatcher.forward(request, response);
		
		tag = "";
	}

	int depth = 0;
	String tag = "";
	public String getNextGroup(ArrayList<NodeVO> groupBefore) {
		//아래 부분에서 실제 목차의 HTML 구조가 만들어진다. 
		
		for (int i = 0; i < groupBefore.size(); i++) {
			NodeVO node =  groupBefore.get(i);
			String id = node.getNoteID();
			String pid = node.getParentID();
			String sid = node.getSiblingID();
			ArrayList<NodeVO> groupNext = groupHash.get(id);
			
			tag += "<li id = "+id+" data-nid ="+id+" data-pid="+pid+" data-sid="+sid+" data-depth="+depth+" style='border-top:0px;'>";
			if(depth==0) {
				if(groupNext == null) {
					tag+="<span style='padding-bottom:0px;padding-top:0px;'>";
				} else {
					tag+="<span class='opener' style='padding-bottom:0px;padding-top:0px;'>";
				}
				
			}

			;

			getNoteVO(id);
			tag += "<a style='padding-bottom:0px;' href = "+"'NoteLoadingService?classID="+classID+"&noteID="+id+"' title = '"+("[N:"+id+", P:"+pid+", S:"+sid+", D:"+depth+"]")+"'>";
			tag += 							((depth<=1)?"<B>":"")
																						
											+ ((depth>=2)?"└ ":"") +getNoteVO(id).getTitle()
											
											+ "</font>"
											+((depth<=1)?"</B>":"");
			tag += "</a>";
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
