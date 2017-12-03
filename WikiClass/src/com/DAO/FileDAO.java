package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.VO.MemberVO;

public class FileDAO {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	private static FileDAO instance = new FileDAO();
	
	public static FileDAO getInstance() {
		return instance;
	}
	
	public void getConn() {
		//현재 작업하고 있는 자바파일의 클래스파일을 기준으로 db.properties을 읽어옴
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		try {
			p.load(in);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		try {
			Class.forName(p.getProperty("dbclass"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if (rs != null) rs.close();
		if (pst != null) pst.close();
		if (conn != null) conn.close();
	}

	public int uploadImg(String email,String groupName, String className, String favortie, String img, String editor1) {
		getConn();
		int cnt = -1;
		try {
			int group_num = -1;//그룹 이름으로 그룹 번호 가지고온다.
			String sql = "select * from wikigroup where name=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, groupName);
			rs = pst.executeQuery();
			if(rs.next()) {
				group_num = rs.getInt(1);
			}
			int member_num = -1;//회원 아이디로 회원 번호 가지고온다.
			sql = "select * from member where email=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if(rs.next()) {
				member_num = rs.getInt(1);
			}
			
			System.out.println("그룹 번호 : "+group_num);
			System.out.println("회원 번호 : "+member_num);
			System.out.println("클래스 이름 : "+ className);
			System.out.println("분야 : "+ favortie);
			System.out.println("이미지 경로 : "+ img);
			System.out.println("클래스 내용 : "+ editor1);
			sql = "insert into wikiclass values(?,?,wikiclass_num.nextval,?,?,?,?,to_char(sysdate,'YYYY-MM-DD'))";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, group_num);
			pst.setInt(2, member_num);
			pst.setString(3, className);
			pst.setString(4, favortie);
			pst.setString(5, img);
			pst.setString(6, editor1);
			cnt = pst.executeUpdate();
				
			close();
		} catch (SQLException e) {
			System.out.println("FileDAO uploadImg error");
			e.printStackTrace();
		}
		
		return cnt;
	}

	public int classGrantInsert(String[] person, String className) {
		getConn();
		int cnt = -1;
		try {//class_num,mem_num 권한테이블 추가
			memberDAO mdao = new memberDAO();
			int mem_num = 0;
			int class_num = 0;
			
			//클래스이름으로 클래스번호 가지고오기
			String sql = "select * from wikiclass where name=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, className);
			rs = pst.executeQuery();
			if(rs.next()) {
				class_num = rs.getInt(3);
			
				//닉네임을 넣고 번호를 가지고 온다.
				for(int i=0 ; i<person.length ; i++) {
					sql = "select * from member where nickname=?";
					pst = conn.prepareStatement(sql);
					pst.setString(1, person[i]);
					rs = pst.executeQuery();
					
					if(rs.next()) {
						mem_num = rs.getInt(1);
						sql = "insert into class_grant values(?,?)";
						pst = conn.prepareStatement(sql);
						pst.setInt(1, class_num);
						pst.setInt(2, mem_num);
						cnt = pst.executeUpdate();
					}
				}
			}
			
			close();
		} catch (SQLException e) {
			System.out.println("FileDAO classGrantInsert error");
			e.printStackTrace();
		}
		
		return cnt;
	}

	public int selectClassNumOne(String groupName, String className) {
		getConn();
		int classNum = 0;
		try {//그룹이름과 클래스 이름은 겹치는게 없으므로 클래스 번호를 가지고온다.
			System.out.println("selectClassNumOne에 넘어온 그룹이름, 클래스 이름 :"+groupName+"//"+className);
			String sql = "select num from wikiclass where name=? and group_num=(select num from wikigroup where name=?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, className);
			pst.setString(2, groupName);
			rs = pst.executeQuery();
			if(rs.next()) {
				classNum = rs.getInt(1);
			}
			close();
		} catch (SQLException e) {
			System.out.println("FileDAO selectClassNumOne error");
			e.printStackTrace();
		}
		
		return classNum;
	}

	public int classUploadImg(String email, int classNum, String favortie, String img, String editor1) {
		getConn();
		try {
			String sql = "update wikiclass set imgpath=?,favorite=?,classpath=? where num=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, img);
			pst.setString(2, favortie);
			pst.setString(3, editor1);
			pst.setInt(4, classNum);
			int cnt = pst.executeUpdate();
			if(cnt>0) {
				return 1;
			}
			close();
		} catch (SQLException e) {
			System.out.println("FileDAO classUploadImg error");
			e.printStackTrace();
		}
		
		return 0;
	}







}
