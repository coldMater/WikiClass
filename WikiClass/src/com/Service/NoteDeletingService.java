package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.NodeDAO;
import com.VO.NodeVO;


@WebServlet("/NoteDeletingService")
public class NoteDeletingService extends HttpServlet {
	ArrayList<NodeVO> nodeList;
	ArrayList<NodeVO> offsprings;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//** Note Delete �� ���� ** // 
			//������ ��尡 ���� classID�� �޾ƿ´�. 
			//classID �� ���� nodeList �� �ҷ��´�. 
			//������ ����� nodeID �� �޾ƿ´�. 
			//������ ����� parentID �� �޾ƿ´�. 
			//������ ����� ������ nodeID�� �������� ��带 ������.(��� ������� NoteMovingService �� �̵� �� �غ������ �����ϴ�.) 
				//���� sibling�� ���� �÷��ִ� �����̴�.
					//���� sibling �� ���� ���� �� ������ �����ȴ�.
					//���� sibling �� sibling ���� ������ ��尡 ���� �ִ� sibling ������ ��ü�Ѵ�.(##UPDATE##) 
			//�ش� ����� parent ���� -1 �� �ٲ��ش�. (##UPDATE##)

		
		String classID = request.getParameter("classID");
		String nodeID = request.getParameter("nodeID"); //This node Will be deleted.

		NodeDAO nodeDAO = new NodeDAO();
		nodeList = nodeDAO.select(classID);
		
		NodeVO nextSibling = getNodeBySibling(nodeID); // nodeID �� sibling ������ ���� node �� �˻��Ͽ� ��ȯ�Ѵ�. 
		NodeVO nodeVO = getNodeByID(nodeID);
		
		if(nodeVO==null) {
			System.out.println("���(ID:"+nodeID+")�� ��尡 �������� �ʴ´�.");
			
		} else {
			if(nextSibling!=null) {
				String tempPID = nodeVO.getParentID();
				String tempSID = nodeVO.getSiblingID();
				
				String nextSiblingID = nextSibling.getNoteID();
				//���� ������ ���� ��� DAO �� �����Ͽ� ������ UPDATE ����
				//nextSibling �� p�� s ���� ���� tempPID, tempSID �� �Ǿ�� �Ѵ�.
				System.out.println("next Sibling �� ����� P, S�� �����Ѵ�.");
				System.out.println("SQL : next Sibling�� "+nextSiblingID+"�� P : "+tempPID+" S : "+tempSID+"�� ����");
				nodeDAO.updateNode(nextSiblingID,tempPID,tempSID);
				//SQL = update class_tree_info set parent_id ='tempPID', sibling_id = 'tempSID' where =  note_id='nextSiblingID';
			} else {
				System.out.println("���� ��Ʈ�� �����Ƿ� ���� ��Ʈ�� S�� �ٲ��� �ʴ´�.");
			}
		
			System.out.println("ID : "+ nodeID +"�� ����� ������ �����Ѵ�.");
			//��� ������(����) : �ش� ����� pid ����
			System.out.println("SQL : "+nodeID+"�� P : -1, S : -1 ���� �Է�");
			nodeDAO.updateNode(nodeID,"-1","-1");	
		}
		
		System.out.println("=====NoteDeletingService.java/Servlet=====");
		request.setAttribute("classIDnow",classID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("NoteLoadingService");
		dispatcher.forward(request, response);
		
	}
	
	//Method//
	
	public NodeVO getLastSiblingByParent(String parentID){
		NodeVO lastNode = null;
		for(int i = 0;i<nodeList.size();i++) {
			if (nodeList.get(i).getParentID().equals(parentID) && nodeList.get(i).getSiblingID().equals("0")) {				
				lastNode = nodeList.get(i);
				String brotherID = lastNode.getNoteID();
				//�ش� ��Ʈ�� ID �� ������ ��尡 �ִ���
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

	public ArrayList<NodeVO> getOffsprings(String parentID){
		
		NodeVO nodeCursor = null;
		for (int i = 0; i < nodeList.size(); i++) {
			if(nodeList.get(i).getParentID().equals(parentID)){
				nodeCursor = nodeList.get(i);
				offsprings.add(nodeCursor);
				getOffsprings(nodeCursor.getNoteID());
				while(true) {
					if(getNodeBySibling(nodeCursor.getNoteID())!=null) {
						nodeCursor = getNodeBySibling(nodeCursor.getNoteID());
						offsprings.add(nodeCursor);
						getOffsprings(nodeCursor.getNoteID());
					} else {
						break;
					}
					
				}
				
				
			} else {
				
			}
		}
		
		return offsprings;
	}
}
