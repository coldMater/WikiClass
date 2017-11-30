package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.VO.ClassSearchVO;
import com.VO.groupInfoVO;
import com.VO.groupSearchVO;
import com.VO.memberInfoVO;
import com.VO.noteInfoVO;
import com.VO.noteSearchVO;
	
public class adminDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
		
	public void getConn() {
		
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		try {
			p.load(in);
		} catch (IOException e1) {
			System.out.println("adminDAO getConn properties errer");
			e1.printStackTrace();
		}
		
		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		try {
			Class.forName(p.getProperty("dbclass"));
		} catch (ClassNotFoundException e) {
			System.out.println("adminDAO forName error");
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (SQLException e) {
			System.out.println("adminDAO connection error");
			e.printStackTrace();
		}
	}
	
	public int login(String id, String password) {
		getConn();
		String sql = "select * from admin where id=? and password=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.out.println("adminDAO login error");
			e.printStackTrace();
		}
		close();
		return 0;
	}
	
	public String getMemberNum() {//DB���� ��ȸ������ ��������
		getConn();
		String sql = "select count(*) from member";
		String num="";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getMemberNum() error");
			e.printStackTrace();
		}
		close();
		return num;
	}
	
	public String getGroupNum() {//DB���� �׷찳�� ��������
		getConn();
		String sql = "select count(*) from wikigroup";
		String num="";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getGroupNum() error");
			e.printStackTrace();
		}
		close();
		return num;
	}
	
	public String getDocumentNum() {//DB���� �������� ��������
		getConn();
		String sql = "select count(*) from note";
		String num="";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getDocumentNum() error");
			e.printStackTrace();
		}
		close();
		return num;
	}
	
	public int getTimeChart() {//�ð��뺰 ���� �α��� �� ��Ʈ

		getConn();
		String sql = "select  from visit_info where(";
		String strNum = "";
		int num=0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				strNum = rs.getString(1);
				num = Integer.parseInt(strNum);
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getTimeChart() error");
			e.printStackTrace();
		}
		close();
		return num;
	} 
	
	public int getDayChart() {//���Ϻ� ���� �α��� �� ��Ʈ
		getConn();
		String sql = "select count(*) from note";
		String strNum = "";
		int num=0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				strNum = rs.getString(1);
				num = Integer.parseInt(strNum);
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getDayChart() error");
			e.printStackTrace();
		}
		close();
		return num;
	} 
	
	public int getMonthChart() {//���� ������ �� ��Ʈ
		getConn();
		String sql = "select count(*) from note";
		String strNum = "";
		int num=0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				strNum = rs.getString(1);
				num = Integer.parseInt(strNum);
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getMonthChart() error");
			e.printStackTrace();
		}
		close();
		return num;
	} 
	
	public void getAdminInsertMemo(String memo) {//������������ �޸�ֱ�
		getConn();
		String sql = "insert into admin_memo values(?,?,?,?)";
		int cnt = -1;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, 1);
			pst.setString(4, memo);
			cnt = pst.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("adminDAO getAdminInsertMemo1 error");
			e.printStackTrace();
		}
		close();
	} 
	
	public int getAdminDeleteMemo(String num) {//������������ �޸����
		getConn();
		
		int cnt = -1;
		try {
			pst = conn.prepareStatement("delete web_message where memo1 = ?");
			pst.setString(1, num);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	} 
		
	public ArrayList<memberInfoVO> getMemberInfo() {//ȸ������: DB���� ȸ������ ��������
		ArrayList<memberInfoVO> infoList = new ArrayList<>();
		getConn();
		String sql = "select member.*, member_info.* from member inner join MEMBER_INFO on member.num=member_info.num";
		
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				infoList.add(new memberInfoVO( rs.getInt(1),rs.getString(2),
						rs.getString(4),rs.getString(5),rs.getString(7),
						rs.getString(8),rs.getInt(9),rs.getInt(10) ));
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getMemberInfo() error");
			e.printStackTrace();
		}
		close();
		return infoList;
	}
	
	public ArrayList<noteInfoVO> getNoteInfo() {//�����м�: DB���� ��Ʈ(Ŭ����)���� ��������
	
		ArrayList<noteInfoVO> infoList = new ArrayList<>();
		getConn();
		String sql = "select * from note";
		
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				infoList.add(new noteInfoVO( rs.getInt(1),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6) ));
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getNoteInfo() error");
			e.printStackTrace();
		}
		close();
		return infoList;
	}
	
	public ArrayList<noteSearchVO> getNoteSearch(String search) {//��Ʈ�˻�: DB���� �˻��� ��Ʈ���� ��������
		
		ArrayList<noteSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from note where name = ?"; 
		
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				SearchList.add(new noteSearchVO( rs.getInt(1),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6) ));
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getNoteSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}
	
	public ArrayList<groupInfoVO> getGroupInfo() {//�׷����: DB���� ��Ʈ(Ŭ����)���� ��������
		
		ArrayList<groupInfoVO> infoList = new ArrayList<>();
		getConn();
		String sql = "select * from wikigroup";
		
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				infoList.add(new groupInfoVO( rs.getInt(1),rs.getString(2),
						rs.getString(3) ));
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getGroupInfo() error");
			e.printStackTrace();
		}
		close();
		return infoList;
	}
	
	public ArrayList<groupSearchVO> getGroupSearch(String search) {//�׷�˻�: DB���� �˻��� �׷����� ��������
		
		ArrayList<groupSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from wikigroup where name = ?"; 
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				SearchList.add(new groupSearchVO( rs.getInt(1),rs.getString(2),
						rs.getString(3)));
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getGroupSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}
	
	public ArrayList<ClassSearchVO> getClassSearch(String classSearch) {//Ŭ��������: ���õ� �׷쿡�� Ŭ���� ���� ��������
		
		ArrayList<ClassSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from wikiclass where group_num=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, classSearch);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				SearchList.add(new ClassSearchVO( rs.getInt(1),rs.getInt(2),
						rs.getInt(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getString(8) ));
				
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getClassSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}
	
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println("adminDAO close finally error");
			e.printStackTrace();
		}
	}
	
}
