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
import com.VO.GraphFieldClassVO;
import com.VO.GraphJoinMonthVO;
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

	public int login(String id, String password) { //adminlogin
		getConn();
		String sql = "select * from admin where id=? and password=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, password);
			rs = pst.executeQuery();

			if (rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.out.println("adminDAO login error");
			e.printStackTrace();
		}
		close();
		return 0;
	}

	public String getMemberNum() {// DB에서 총회원숫자 가져오기
		getConn();
		String sql = "select count(*) from member";
		String num = "";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getMemberNum() error");
			e.printStackTrace();
		}
		close();
		return num;
	}

	public String getGroupNum() {// DB에서 그룹개수 가져오기
		getConn();
		String sql = "select count(*) from wikigroup";
		String num = "";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getGroupNum() error");
			e.printStackTrace();
		}
		close();
		return num;
	}

	public String getDocumentNum() {// DB에서 문서개수 가져오기
		getConn();
		String sql = "select count(*) from note";
		String num = "";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("adminDAO getDocumentNum() error");
			e.printStackTrace();
		}
		close();
		return num;
	}

	public int getTimeChart() {// 시간대별 누적 로그인 수 차트

		getConn();
		String sql = "select  from visit_info where(";
		String strNum = "";
		int num = 0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
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

	public int getDayChart() {// 요일별 누적 로그인 수 차트
		getConn();
		String sql = "select count(*) from note";
		String strNum = "";
		int num = 0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
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

	public int getMonthChart() {// 월별 가입자 수 차트
		getConn();
		String sql = "select count(*) from note";
		String strNum = "";
		int num = 0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
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

	public ArrayList<memberInfoVO> getMemberInfo() {// 회원관리: DB에서 회원정보 가져오기
		ArrayList<memberInfoVO> infoList = new ArrayList<>();
		getConn();
		String sql = "select member.*, member_info.* from member inner join MEMBER_INFO on member.num=member_info.num";

		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				infoList.add(new memberInfoVO(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5),
						rs.getString(7), rs.getInt(8), rs.getInt(9) ));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getMemberInfo() error");
			e.printStackTrace();
		}
		close();
		return infoList;
	}

	public ArrayList<noteInfoVO> getNoteInfo() {// 문서분석: DB에서 노트(클래스)정보 가져오기

		ArrayList<noteInfoVO> infoList = new ArrayList<>();
		getConn();
		String sql = "select * from note";

		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				infoList.add(new noteInfoVO(rs.getInt(1), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getNoteInfo() error");
			e.printStackTrace();
		}
		close();
		return infoList;
	}

	public ArrayList<noteSearchVO> getNoteSearch(String search) {// 노트검색: DB에서 검색된 노트정보 가져오기

		ArrayList<noteSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from note where name = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search);
			rs = pst.executeQuery();

			while (rs.next()) {
				SearchList.add(new noteSearchVO(rs.getInt(1), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getNoteSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}

	public ArrayList<groupInfoVO> getGroupInfo() {// 그룹관리: DB에서 노트(클래스)정보 가져오기

		ArrayList<groupInfoVO> infoList = new ArrayList<>();
		getConn();
		String sql = "select * from wikigroup";

		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				infoList.add(new groupInfoVO(rs.getInt(1), rs.getString(2), rs.getString(3)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getGroupInfo() error");
			e.printStackTrace();
		}
		close();
		return infoList;
	}

	public ArrayList<groupSearchVO> getGroupSearch(String search) {// 그룹검색: DB에서 검색된 그룹정보 가져오기

		ArrayList<groupSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from wikigroup where name = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search);
			rs = pst.executeQuery();

			while (rs.next()) {
				SearchList.add(new groupSearchVO(rs.getInt(1), rs.getString(2), rs.getString(3)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getGroupSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}

	public ArrayList<ClassSearchVO> getClassSearch(String classSearch) {// 클래스보기: 선택된 그룹에서 클래스 정보 가져오기


		ArrayList<ClassSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from wikiclass where group_num=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, classSearch);
			rs = pst.executeQuery();

			while (rs.next()) {
				SearchList.add(new ClassSearchVO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getClassSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}

	public int memberDelete(String num) {//회원삭제하기
		getConn();
		int cnt=0;
		try {
			pst = conn.prepareStatement("delete member where num = ?");
			pst.setString(1, num);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int groupDelete(String num) {//그룹삭제하기(완성안됨)
		getConn();
		int cnt=0;
		try {
			pst = conn.prepareStatement("delete wikigroup where name = ?");
			pst.setString(1, num);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int classDelete(int num) {//클래스삭제하기(삭제는 되지만 cascade적용안됨.)
		getConn();
		int cnt=0;
		try {
			pst = conn.prepareStatement("delete wikiclass where group_num = ?");
			pst.setInt(1, num);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<ClassSearchVO> GraphLoginTime(String classSearch) {// 시간별 로그인 수 그래프 (완성안됨)


		ArrayList<ClassSearchVO> SearchList = new ArrayList<>();
		getConn();
		String sql = "select * from wikiclass where group_num=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, classSearch);
			rs = pst.executeQuery();

			while (rs.next()) {
				SearchList.add(new ClassSearchVO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO getClassSearch() error");
			e.printStackTrace();
		}
		close();
		return SearchList;
	}

	public ArrayList<GraphJoinMonthVO> GraphJoinMonth() {// 월별 가입자 수 그래프(완성안됨)

		ArrayList<GraphJoinMonthVO> infoList = new ArrayList<>();
		
		
		String month1 = "2017-01-01";
		String month1_ = "2017-01-31";
		
		String month2 = "2017-02-01";
		String month2_ = "2017-02-28";
		
		String month3 = "2017-03-01";
		String month3_ = "2017-03-31";
		
		String month4 = "2017-04-01";
		String month4_ = "2017-04-30";
		
		String month5 = "2017-05-01";
		String month5_ = "2017-05-31";
		
		String month6 = "2017-06-01";
		String month6_ = "2017-06-31";
		
		String month7 = "2017-07-01";
		String month7_ = "2017-07-31";
		
		String month8 = "2017-08-01";
		String month8_ = "2017-08-31";
		
		String month9 = "2017-09-01";
		String month9_ = "2017-09-31";
		
		String month10 = "2017-10-01";
		String month10_ = "2017-10-31";
		
		String month11 = "2017-11-01";
		String month11_ = "2017-11-31";
		
		String month12 = "2017-12-01";
		String month12_ = "2017-12-31";
		
		
		getConn();
		String sql1 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql2 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql3 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql4 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql5 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql6 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql7 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql8 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql9 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql10 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql11 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		String sql12 = "select count(*) from member where senddate between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
		
		try {
			pst = conn.prepareStatement(sql1);
			pst.setString(1, month1);
			pst.setString(2, month1_);
			pst = conn.prepareStatement(sql2);
			pst.setString(1, month2);
			pst.setString(2, month2_);
			pst = conn.prepareStatement(sql3);
			pst.setString(1, month3);
			pst.setString(2, month3_);
			pst = conn.prepareStatement(sql4);
			pst.setString(1, month4);
			pst.setString(2, month4_);
			pst = conn.prepareStatement(sql5);
			pst.setString(1, month5);
			pst.setString(2, month5_);
			pst = conn.prepareStatement(sql6);
			pst.setString(1, month6);
			pst.setString(2, month6_);
			pst = conn.prepareStatement(sql7);
			pst.setString(1, month7);
			pst.setString(2, month7_);
			pst = conn.prepareStatement(sql8);
			pst.setString(1, month8);
			pst.setString(2, month8_);
			pst = conn.prepareStatement(sql9);
			pst.setString(1, month9);
			pst.setString(2, month9_);
			pst = conn.prepareStatement(sql10);
			pst.setString(1, month10);
			pst.setString(2, month10_);
			pst = conn.prepareStatement(sql11);
			pst.setString(1, month11);
			pst.setString(2, month11_);
			pst = conn.prepareStatement(sql12);
			pst.setString(1, month12);
			pst.setString(2, month12_);
			
			rs = pst.executeQuery();

			while (rs.next()) {
			//	infoList.add(new GraphJoinMonthVO(rs.getInt(1), rs.getString(3), rs.getString(4), rs.getString(5),
			//			rs.getString(6)));

			}
		} catch (SQLException e) {
			System.out.println("adminDAO GraphJoinMonth() error");
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		close();
		return infoList;
	}

	public ArrayList<GraphFieldClassVO> GraphFieldClass() {// 분야별 클래스 수 그래프(완성안됨)
		
		ArrayList<GraphFieldClassVO> SearchList = new ArrayList<>();
		String[] field={"게임","그래픽/디자인/멀티/미디어","네트워크/해킹/보안","모바일 프로그래밍","모바일/태블릿/SNS","오피스 활용",
				"웹사이트","인터넷 비즈니스","컴퓨터 공학","OS/데이터베이스","컴퓨터 입문/활용","프로그래밍 언어","기타"};
		getConn();
		String sql = "select count(*) from wikiclass where favroite = ?";
		try {
			for (int i = 0; i < field.length; i++) {
				pst = conn.prepareStatement(sql);
				pst.setString(1,field[i]);
				rs = pst.executeQuery();
				while (rs.next()) {
					
					SearchList.add(new GraphFieldClassVO(rs.getInt(1)));
				}
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
