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

public class memberDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public void getConn() {
		
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		try {
			p.load(in);
		} catch (IOException e1) {
			System.out.println("memberDAO getConn properties errer");
			e1.printStackTrace();
		}
		
		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		try {
			Class.forName(p.getProperty("dbclass"));
		} catch (ClassNotFoundException e) {
			System.out.println("memberDAO forName error");
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (SQLException e) {
			System.out.println("memberDAO connection error");
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
			System.out.println("memberDAO close finally error");
			e.printStackTrace();
		}
	}
	
	//회원 로그인
	public int login(String email, String password) {
		getConn();
		String sql = "select * from member where email=? and password=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.out.println("memberDAO login error");
			e.printStackTrace();
		}
		close();
		return 0;
	}

	public int join(String email, String password, String nickname) {
		getConn();
		String sql = "insert into member values(member_num.nextval,?,?,?,to_char(sysdate,'YYYY-MM-DD'))";
		int cnt = -1;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, nickname);
			cnt = pst.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("memberDAO join error");
			e.printStackTrace();
		}
		close();
		return cnt;
	}

	public MemberVO emailselect(String email) {
		getConn();
		String sql = "select * from member where email=?";
		MemberVO mvo = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt(1);
				String password = rs.getString(3);
				String nickname = rs.getString(4);
				String senddate = rs.getString(5);
				mvo = new MemberVO(num,email, password, nickname,senddate);
			}else {
				return null;
			}
		} catch (SQLException e) {
			System.out.println("memberDAO emailselect error");
			e.printStackTrace();
		} 
		close();
		return mvo;
	}

	//방문자 카운트(처음들어올땐 insert, 2번째부터는 count되게) (미구현)
	public void logincount() {
		getConn();
		String sql = "insert into visit_info values(visit_info_num.nextval,to_char(sysdate,'YYYY-MM-DD'))";
		try {
			pst = conn.prepareStatement(sql);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("memberDAO emailselect error");
			e.printStackTrace();
		} 
		close();
	}

	public MemberVO emailselectOne(String nickname) {
		getConn();
		String sql = "select * from member where nickname=?";
		MemberVO mvo = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, nickname);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt(1);
				String email = rs.getString(2);
				String password = rs.getString(3);
				String senddate = rs.getString(5);
				mvo = new MemberVO(num,email, password, nickname,senddate);
			}else {
				return null;
			}
		} catch (SQLException e) {
			System.out.println("memberDAO emailselectOne error");
			e.printStackTrace();
		} 
		close();
		return mvo;
	}
	
	
}
