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

@WebServlet("/NoteMovingService")
public class NoteMovingService extends HttpServlet {
	ArrayList<NodeVO> nodeList;
	ArrayList<NodeVO> offsprings;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
	//////////////////////////
	// **** �ڽ����� �߰��ϱ�  ****//
	//////////////////////////

		
		//���� �۾����� Ŭ����
		String classID = (String)request.getParameter("classID");
		//�̵��� ��� ���̵� 
		String nodeID = (String)request.getParameter("noteID");
		//�̵���ų �θ��� ���̵� 
		String parentID = (String)request.getParameter("parentID");
		
		System.out.println(nodeID+"�� "+parentID+"�� �θ�� ���� �׷����� �̵��ϴ� ���μ��� ���� (class:"+classID);
		
		NodeDAO nodeDAO = new NodeDAO();
		nodeList = nodeDAO.select(classID);
		
		//�̵��� ���(��ü)
		NodeVO nodeVO = null;
		nodeVO = getNodeByID(nodeID);
		
		String tempPID = "0";
		String tempSID = "0";
				
		
		if(nodeVO != null) {
			tempPID = nodeVO.getParentID();
			tempSID = nodeVO.getSiblingID();
		}
			
//////////�̵� �� �˻�(�̵��Ϸ��� ���� �ش� ����� �ڼ� ��� �� �ϳ�����)
		offsprings = new ArrayList<NodeVO>();
		
		boolean isOffspring = false;
		ArrayList<NodeVO> offspring = getOffsprings(nodeID);
		for (int i = 0; i < offspring.size(); i++) {
			if(parentID.equals(offspring.get(i).getNoteID())) {
				//�̵��Ϸ��� ���� �� �ڽ��� ����� ��
				isOffspring = true;
			}
		}


//////////�̵� �� ����
		if(isOffspring) {
			System.out.println("�Է¿��� : �̵��Ϸ��� ���� �� �ڽ��̴�.");
		} else if (nodeVO==null && !parentID.equals("0")){
			System.out.println(nodeVO==null);
			System.out.println(parentID!="0");
			System.out.println("�Է¿��� : �̵��� ���� �Է��� ID �� ���� Node�� ����.");
		} else if ((getNodeByID(parentID)==null && !parentID.equals("0"))){
			System.out.println(getNodeByID(parentID)==null);
			System.out.println(parentID!="0");
			System.out.println((getNodeByID(parentID)==null && !parentID.equals("0")));
			System.out.println("�Է¿��� : �Է��� Parent ID �� ���� Node�� ����.");
		} else if (nodeID.equals(parentID)){
			System.out.println("�Է¿��� : �Է��� ID �� Parent ID �� �����ϴ�. ");
		} else {
			//�̵��ϱ� �� �̵� �� ��ġ���� �̵��� ��Ʈ�� ���� ��Ʈ�� �ִ���
			NodeVO nextSibling = getNodeBySibling(nodeID);
			if(nextSibling!=null) {
				String nextSiblingID = nextSibling.getNoteID();
				//���� ������ ���� ��� DAO �� �����Ͽ� ������ UPDATE ����
				//nextSibling �� p�� s ���� ���� tempPID, tempSID �� �Ǿ�� �Ѵ�.
				System.out.println("next Sibling�� "+nextSiblingID+"�� P : "+tempPID+" S : "+tempSID+"�� ����");
				nodeDAO.updateNode(nextSiblingID,tempPID,tempSID);
				//SQL = update class_tree_info set parent_id ='tempPID', sibling_id = 'tempSID' where =  note_id='nextSiblingID';
			} else {
				System.out.println("���� ��Ʈ�� �����Ƿ� ���� ��Ʈ�� S�� �ٲ��� �ʴ´�.");
			}
			
			//���� ��带 �̵���Ű��
			//�̵� �� ����� �θ� 
			NodeVO groupLastSibling = getLastSiblingByParent(parentID);
			
			if(groupLastSibling!=null) {
				//�ڽ��� �ִ�. �� �ڽ��� �˻��Ѵ�. 
				System.out.println("������ ��� ID : "+groupLastSibling.getNoteID());
				//������ ��带 ������ ������ �̵��� ����� Sibling ���� ����
					//��Ʈ�� ȥ�� �־��� ���� ������ �̷������ �ȵȴ�. 
					System.out.println("�̵��� ��� : " + nodeID + "  ���� ��� : " + groupLastSibling.getNoteID());	
					if(nodeID.equals(groupLastSibling.getNoteID())) {
						//�̵��� ��尡 ȥ�� �����Ƿ� �̵��� ���� ���� ��尡 ����.
						System.out.println("��ȯ ��� ��尡 �ڽ��̱� ������ ����ȣ�� ����. ���� �������� �ʴ´�.");	
					} else {
						System.out.println(nodeVO.getNoteID()+"��  Parent�� 0 Sibling��"+groupLastSibling.getNoteID()+"�� ����");		
						nodeDAO.updateNode(nodeVO.getNoteID(), "0", groupLastSibling.getNoteID());
					}
			} else {
				//������ �ڽ��� Null �̹Ƿ� �ش� �θ�� �ڽ��� ����.   
				System.out.println("�ش� �θ� "+parentID+"�� �ڽ��� ����.");
				System.out.println(nodeID+"�� P : "+parentID+"  S : 0 �� ����");
				nodeDAO.updateNode(nodeID, parentID, "0");
				//���� ����� Parent �� ���� Parent ������, Sibling �� 0���� �����Ѵ�. 
			}

		}
		
		System.out.println("=====NoteMovingService.java/Servlet=====");
		request.setAttribute("classIDnow", classID);
		request.setAttribute("noteID", nodeID);

		RequestDispatcher dispatcher = request.getRequestDispatcher("NoteLoadingService");
		dispatcher.forward(request, response);

		
		//////////////////////////
		// **** �������� �߰��ϱ�  ****//
		//////////////////////////
		
		//������ �߰��ϱ�(���� ����)
	}
	
	
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
