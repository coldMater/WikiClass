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
		//author : 해당 과정을 수행한 사람의 ID
		//noteID : 해당 과정이 적용된 노트의 ID 
		//classID : 해당 노트가 속한 클래스의 ID
		//classification : 분류(등록:0, 조회 : 1, 수정:2,삭제:3)
		//title_before_action : 과정이 수행되기 전의 제목 저장
		//content_before_action : 과정이 수행되기 전의 내용 저장
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
