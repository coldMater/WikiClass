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

import com.VO.NodeVO;

public class NodeDAO {
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

	public ArrayList<NodeVO> select(String class_id) {
		getConn();
		ArrayList<NodeVO> nodeList = new ArrayList<NodeVO>();
		NodeVO node = null;
		try {
			pst = conn.prepareStatement("SELECT * FROM CLASS_TREE_INFO WHERE CLASS_ID=?");
			pst.setString(1, class_id);
			rs = pst.executeQuery();

			while (rs.next()) {
				nodeList.add(new NodeVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nodeList;
	}

	public ArrayList<NodeVO> getElders(String classID) {
		getConn();
		ArrayList<NodeVO> nodeList = new ArrayList<NodeVO>();
		NodeVO node = null;
		try {
			pst = conn.prepareStatement("SELECT * FROM CLASS_TREE_INFO WHERE CLASS_ID=? AND PARENT_ID='0'");
			pst.setString(1, classID);
			rs = pst.executeQuery();

			while (rs.next()) {
				nodeList.add(new NodeVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return nodeList;

	}

	public int updateNode(String nodeID, String tempPID, String tempSID) {
		int result = 0;
		getConn();

		try {

			pst = conn.prepareStatement("update class_tree_info set parent_id = ?, sibling_id = ? where note_id = ?");
			pst.setString(1, tempPID);
			pst.setString(2, tempSID);
			pst.setString(3, nodeID);
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
