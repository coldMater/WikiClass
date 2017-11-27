package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
