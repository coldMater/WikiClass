package com.DAO;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.VO.NoteVO;

public class NoteDAO {
	PreparedStatement pst;
	PreparedStatement pst2;
	PreparedStatement pst3;
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

	public String insertNote(String title, String path, String siblingID, String classID, String userNum) {
		getConn();
		String sequenceNow = "";
		try {
			System.out.println(title + " " + path + " " + siblingID + " " + classID + " " + userNum);

			pst = conn.prepareStatement("insert into note values(NOTE_NUM.NEXTVAL,?,?,sysdate,?)");
			pst.setString(1, title);
			pst.setString(2, path);
			pst.setString(3, userNum);
			int cnt = pst.executeUpdate();

			pst2 = conn.prepareStatement("insert into class_tree_info values(NOTE_NUM.CURRVAL,0,?,?)");
			pst2.setString(1, siblingID);
			pst2.setString(2, classID);
			int cnt2 = pst2.executeUpdate();

			pst3 = conn.prepareStatement("select NOTE_NUM.CURRVAL from dual");
			rs = pst3.executeQuery();
			if (rs.next()) {
				sequenceNow = rs.getString(1);
				
			}

			System.out.println(cnt);
			System.out.println(cnt2);

			pst.close();
			pst2.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sequenceNow;
	}

	public NoteVO getNote(String num) {
		NoteVO tempVO = null;
		getConn();
		try {
			pst = conn.prepareStatement("select * from note where num = ?");
			pst.setString(1, num);
			rs = pst.executeQuery();
			if(rs.next()) {

				
				TextReadWriteDAO trwDAO = new TextReadWriteDAO();
				String content = trwDAO.readNote(rs.getString(3), rs.getString(1));
				
			    
				tempVO = new NoteVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),content);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
		return tempVO;
	}
	
	public ArrayList<NoteVO> selectNotesByClassID(String classID){
		ArrayList<NoteVO> tempArr= new ArrayList<NoteVO>();
		NoteVO tempVO = null;
		getConn();
		
		try {//** select 문으로 리턴된 결과 row들을 또다시 select 에서 사용할 때에는 in 을 사용해주어야 한다. 
			pst = conn.prepareStatement("select * from note where num in (select note_id from class_tree_info where class_id = ?)");
			pst.setString(1, classID);
			rs = pst.executeQuery();
			while(rs.next()) {
				tempVO = new NoteVO(rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),"");
				tempArr.add(tempVO);
				
			}
			
			pst.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tempArr;
	}

	public int updateNote(String noteNum, String noteName) {
		getConn();
		int result=0;	
		try {
			pst = conn.prepareStatement("update note set name =? where num = ?");
			pst.setString(1, noteName);
			pst.setString(2, noteNum);
			result = pst.executeUpdate();
			pst.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
}
