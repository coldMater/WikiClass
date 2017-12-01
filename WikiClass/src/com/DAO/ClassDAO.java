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

import com.VO.classVO;

public class ClassDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public void getConn() {
		
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		try {
			p.load(in);
		} catch (IOException e1) {
			System.out.println("classDAO getConn properties errer");
			e1.printStackTrace();
		}
		
		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		try {
			Class.forName(p.getProperty("dbclass"));
		} catch (ClassNotFoundException e) {
			System.out.println("classDAO forName error");
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (SQLException e) {
			System.out.println("classDAO connection error");
			e.printStackTrace();
		}
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
			System.out.println("classDAO close finally error");
			e.printStackTrace();
		}
	}

	public int groupInsert(String name, String content) {
		getConn();
		String sql = "insert into wikigroup values(wikigroup_num.nextval,?,?)";
		int cnt=-1;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, content);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ClassDAO groupInsert error");
			e.printStackTrace();
		}
		close();
		return cnt;
	}

	public int groupSelectOne(String name) {
		getConn();
		String sql = "select * from wikigroup where name=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO groupSelectOne error");
			e.printStackTrace();
		}
		close();
		return 0;
	}

	public int groupNumselect(String name) {
		getConn();
		String sql = "select * from wikigroup where name=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO groupNumselect error");
			e.printStackTrace();
		}
		close();
		return 0;
	}

	public int personInsert(int groupnum, String[] person) {
		getConn();
		String sql = "insert into group_person values(?,?)";
		int cnt=-1;
		try {
			for(int i=0 ; i<person.length ; i++) {
				if(person[i]!=null) {
					pst = conn.prepareStatement(sql);
					pst.setInt(1, groupnum);
					pst.setString(2, person[i]);
					cnt = pst.executeUpdate();
				}
			}
		} catch (SQLException e) {
			System.out.println("ClassDAO groupInsert error");
			e.printStackTrace();
		}
		close();
		return cnt;
	}
	
	public classVO selectNameOne(int num) {
		getConn();
		classVO cvo = null;
		//Ŭ���� ��ȣ��, �׷��̸�, �г���, Ŭ���� ��ȣ, Ŭ�����̸�, Ŭ���� �о�, Ŭ���� �̹���, Ŭ���� ����, Ŭ���� ����Ʈ
		String sql = "select wikigroup.name, member.nickname, wikiclass.num,wikiclass.name,wikiclass.favorite, wikiclass.imgPath, wikiclass.classPath, wikiclass.senddate from wikigroup,member,wikiclass where wikigroup.num=(select group_num from wikiclass where num=?) and member.num=(select mem_num from wikiclass where num=?)  and wikiclass.num=?"; 
			
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setInt(2, num);
			pst.setInt(3, num);
			rs = pst.executeQuery();
			System.out.println("rs.next �ȵ���");
			if(rs.next()) {
				System.out.println("rs.next ����");
				String group_name = rs.getString(1); 
				String mem_name = rs.getString(2);
				String name = rs.getString(4);
				String favorite = rs.getString(5); 
				String imgPath = rs.getString(6); 
				String classPath = rs.getString(7); 
				String senddate = rs.getString(8); 
				cvo = new classVO(group_name, mem_name, num, name, favorite, imgPath, classPath, senddate);
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO selectNameOne error");
			e.printStackTrace();
		}
		close();
		return cvo;
		
	}

	public int groupclassSelectOne(String groupName, String className) {
		//�׷� �̸����� �׷� ��ȣ�� ���������, �׷��ȣ�� Ŭ���� �̸����� ���� �ִ��� Ȯ��
		getConn();
		String sql = "select * from wikiclass where name=? and group_num=(select num from wikigroup where name=?)"; 
			
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, className);
			pst.setString(2, groupName);
			rs = pst.executeQuery();

			if(rs.next()) {//���� ������ Ŭ���� ��� ���ϰ�
				return 1;
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO groupclassSelectOne error");
			e.printStackTrace();
		}
		close();
		return 0;
	}
	
	public ArrayList<classVO> classSelectAll() {
		getConn();
		String sql = "select * from wikiclass"; 
		ArrayList<classVO> list = new ArrayList<classVO>();	
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int group_num = rs.getInt(1);
				int mem_num = rs.getInt(2);
				int num = rs.getInt(3); 
				String name = rs.getString(4);
				String favorite = rs.getString(5); 
				String imgPath = rs.getString(6); 
				String classPath = rs.getString(7); 
				String senddate = rs.getString(8); 
				String group_name = gNumName(group_num);
				String mem_nickname = mNumNickname(mem_num);
				classVO cvo = new classVO(group_name, mem_nickname, num, name, favorite, imgPath, classPath, senddate);
				list.add(cvo);
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO classSelectAll error");
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public classVO getClass(String num) {
		getConn();
		classVO tempVO = null;
		try {
			pst = conn.prepareStatement("select * from wikiclass where num = ?");
			pst.setString(1, num);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				tempVO = new classVO(rs.getString(1),
											 rs.getString(2),
											 Integer.parseInt(rs.getString(3)),
											 rs.getString(4),
											 rs.getString(5),
											 rs.getString(6),
											 rs.getString(7),
											 rs.getString(8));
			}
//			private String group_name; //�׷� ��ȣ
//			private String mem_name; //ȸ�� ��ȣ
//			private int num; //Ŭ���� ��ȣ
//			private String name; //Ŭ���� ��
//			private String favorite; //�о�
//			private String imgPath; //�̹��� ���
//			private String classPath; //Ŭ���� ����-->��η� ����
//			private String senddate; //�ۼ� ��¥
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tempVO;
	}

	private String mNumNickname(int mem_num) {
		String sql = "select * from member where num=?"; 
		String nickname = "";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1,mem_num);
			ResultSet rs1 = pst.executeQuery();
			
			if(rs1.next()) {
				nickname = rs1.getString(4);
			}
			
		}catch (SQLException e) {
			System.out.println("ClassDAO mNumNickname error");
			e.printStackTrace();
		}
		return nickname;
	}

	private String gNumName(int group_num) {
		String sql = "select * from wikigroup where num=?"; 
		String name = "";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1,group_num);
			ResultSet rs2 = pst.executeQuery();
			
			if(rs2.next()) {
				name = rs2.getString(2);
			}
		}catch (SQLException e) {
			System.out.println("ClassDAO gNumName error");
			e.printStackTrace();
		}
		return name;
	}
	public String mNumNicknameOne(int mem_num) {
		getConn();
		String sql = "select * from member where num=?"; 
		String nickname = "";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1,mem_num);
			ResultSet rs1 = pst.executeQuery();
			
			if(rs1.next()) {
				nickname = rs1.getString(4);
			}
			
		}catch (SQLException e) {
			System.out.println("ClassDAO mNumNickname error");
			e.printStackTrace();
		}
		close();
		return nickname;
	}
	
	//ȸ���̸��Ϸ� ���Ե� �׷� ��������
	public ArrayList<String> selectNameGroup(String email){
		getConn();
		ArrayList<String> list = new ArrayList<String>();
		String sql ="";
		System.out.println("selectNameGroup�� �Ѿ�� email : "+email);
		try {
			int group_num=0;
			//�̸��Ϸ� �׷� ��ȣ�� �޾ƿ´�.
			sql = "select group_num from group_person where nickname=(select nickname from member where email=?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				group_num = rs.getInt(1);
				//�޾ƿ� �׷��ȣ�� �׷��̸� ������ͼ� ArrayList�� ��´�.
				sql = "select name from wikigroup where num=?";
				pst = conn.prepareStatement(sql);
				pst.setInt(1, group_num);
				ResultSet rs1 = pst.executeQuery();
				
				if(rs1.next()) {
					list.add(rs1.getString(1));
				}
			
			}
		}catch (SQLException e) {
			System.out.println("ClassDAO selectNameGroup error");
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	/*public int selectGrantOne(String email, int classNum) {
		//ȸ�� �̸��ϰ� Ŭ���� ��ȣ�� class_grant���̺��� ��ȸ ������ 1
		
	}*/
}
