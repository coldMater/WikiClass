package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class NoteHistoryDAO {
	PreparedStatement pst;
	Connection conn;
	ResultSet rs;

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
	
	public int insertHistory(String author, String noteID, String classID, String classification, String bef_title, String bef_content) {
		//author : �ش� ������ ������ ����� ID
		//noteID : �ش� ������ ����� ��Ʈ�� ID 
		//classID : �ش� ��Ʈ�� ���� Ŭ������ ID
		//classification : �з�(���:0, ��ȸ : 1, ����:2,����:3)
		//title_before_action : ������ ����Ǳ� ���� ���� ����
		//content_before_action : ������ ����Ǳ� ���� ���� ����
		getConn();
		int cnt =0;
		try {
			pst = conn.prepareStatement("insert into note_history values(?,?,?,?,sysdatetime,?,?)");
			pst.setString(1, author);
			pst.setString(2, noteID);
			pst.setString(3, classID);
			pst.setString(4, classification);
			pst.setString(5, bef_title);
			pst.setString(6, bef_content);
			cnt = pst.executeUpdate();
			
			pst.close();
			conn.close();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
}
