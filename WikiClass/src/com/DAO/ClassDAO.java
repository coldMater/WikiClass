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
import com.VO.groupSearchVO;

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
			System.out.println("ClassDAO personInsert error");
			e.printStackTrace();
		}
		close();
		return cnt;
	}
	
	public classVO selectNameOne(int num) {
		getConn();
		classVO cvo = null;
		//클래스 번호로, 그룹이름, 닉네임, 클래스 번호, 클래스이름, 클래스 분야, 클래스 이미지, 클래스 내용, 클래스 데이트
		String sql = "select wikigroup.name, member.nickname, wikiclass.num,wikiclass.name,wikiclass.favorite, wikiclass.imgPath, wikiclass.classPath, wikiclass.senddate from wikigroup,member,wikiclass where wikigroup.num=(select group_num from wikiclass where num=?) and member.num=(select mem_num from wikiclass where num=?)  and wikiclass.num=?"; 
			
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setInt(2, num);
			pst.setInt(3, num);
			rs = pst.executeQuery();
			System.out.println("rs.next 안들어옴");
			if(rs.next()) {
				System.out.println("rs.next 들어옴");
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
		//그룹 이름으로 그룹 번호를 가지고오고, 그룹번호랑 클래스 이름으로 값이 있는지 확인
		getConn();
		String sql = "select * from wikiclass where name=? and group_num=(select num from wikigroup where name=?)"; 
			
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, className);
			pst.setString(2, groupName);
			rs = pst.executeQuery();

			if(rs.next()) {//값이 있으면 클래스 등록 못하게
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
		String sql = "select * from wikiclass ORDER BY num desc"; 
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
//			private String group_name; //그룹 번호
//			private String mem_name; //회원 번호
//			private int num; //클래스 번호
//			private String name; //클래스 명
//			private String favorite; //분야
//			private String imgPath; //이미지 경로
//			private String classPath; //클래스 내용-->경로로 수정
//			private String senddate; //작성 날짜
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
	
	//회원이메일로 가입된 그룹 가져오기
	public ArrayList<String> selectNameGroup(String email){
		getConn();
		ArrayList<String> list = new ArrayList<String>();
		String sql ="";
		System.out.println("selectNameGroup에 넘어온 email : "+email);
		try {
			int group_num=0;
			//이메일로 그룹 번호를 받아온다.
			sql = "select group_num from group_person where nickname=(select nickname from member where email=?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				group_num = rs.getInt(1);
				//받아온 그룹번호로 그룹이름 가지고와서 ArrayList에 담는다.
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
		//회원 이메일과 클래스 번호로 class_grant테이블에서 조회 있으면 1
		
	}*/
	
	//전체그룹 가져오기
	public ArrayList<groupSearchVO> groupSelectAll() {
		getConn();
		String sql = "select * from wikigroup ORDER BY num desc"; 
		ArrayList<groupSearchVO> list = new ArrayList<groupSearchVO>();	
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int group_num = rs.getInt(1);
				String group_name =rs.getString(2);
				String content = rs.getString(3);
				groupSearchVO gvo = new groupSearchVO(group_num, group_name, content);
				list.add(gvo);
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO groupSelectAll error");
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public groupSearchVO selectGroupNameOne(int groupNum) {
		//그룹 번호로 그룹의 정보 가져오기
		getConn();
		groupSearchVO gvo = null;
		String sql = "select * from wikigroup where num=?"; 
			
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, groupNum);
			rs = pst.executeQuery();
			if(rs.next()) {
				int group_num = rs.getInt(1); 
				String group_name = rs.getString(2);
				String content = rs.getString(3);
				gvo = new groupSearchVO(group_num, group_name, content);
			}
			
		} catch (SQLException e) {
			System.out.println("ClassDAO selectGroupNameOne error");
			e.printStackTrace();
		}
		close();
		return gvo;
	}
	
	
	public ArrayList<classVO> classSelectGroup(int groupNum) {
		getConn();
		ArrayList<classVO> list = new ArrayList<classVO>();	
		try {
			String sql = "select * from wikiclass where group_num=?"; 
			pst = conn.prepareStatement(sql);
			pst.setInt(1, groupNum);
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
			System.out.println("ClassDAO classSelectGroup error");
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public int selectMemberGroupGrant(String email, int groupNum) {
		getConn();
		try {
			String sql = "select * from group_person where nickname=(select nickname from member where email=?) and group_num=?" ; 
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setInt(2, groupNum);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.out.println("ClassDAO selectMemberGroupGrant error");
			e.printStackTrace();
		}
		
		close();
		return 0;
	}

	public int groupUpdate(int num, String content) {
		getConn();
		try {
			String sql = "update wikigroup set content=? where num = ?"; 
			pst = conn.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, num);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.out.println("ClassDAO groupUpdate error");
			e.printStackTrace();
		}
		
		close();
		return 0;
	}
	
	public String getGroupNum(String classNum) {
		getConn();
		String groupNum="";
		try {
			pst = conn.prepareStatement("select group_num from wikiclass where num=?");
			pst.setString(1, classNum);
			rs=pst.executeQuery();
			if(rs.next()) {
				groupNum = rs.getString(1);
				System.out.println("반환되는 그룹 넘버는 "+ rs.getString(1));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return groupNum;
	}
	
	public int selectClassOne(String memEmail, int classNum) {
		getConn();
		try {
			pst = conn.prepareStatement("select * from class_grant where class_num=? and mem_num=(select num from member where email=?)");
			pst.setInt(1, classNum);
			pst.setString(2, memEmail);
			rs=pst.executeQuery();
			System.out.print("클래스번호 / 회원아이디 : "+classNum+"/"+memEmail);
			if(rs.next()) {
				System.out.println("권한이 있습니다.");
				return 1;
			}
			System.out.println("권한이 없습니다.");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return 0;
	}
	
}
