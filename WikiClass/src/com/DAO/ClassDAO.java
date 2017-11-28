package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
				pst = conn.prepareStatement(sql);
				pst.setInt(1, groupnum);
				pst.setString(2, person[i]);
				cnt = pst.executeUpdate();
			}
		} catch (SQLException e) {
			System.out.println("ClassDAO groupInsert error");
			e.printStackTrace();
		}
		close();
		return cnt;
	}
	
	
	
	
}
