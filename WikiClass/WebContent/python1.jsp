<%@page import="Analysis.PythonAnalysis"%>
<%@page import="Analysis.FolderToWrite"%>
<%@page import="com.DAO.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
									ClassDAO classdao = new ClassDAO();
									String classNum = (String)request.getAttribute("classID");
									String noteNum = (String)request.getAttribute("noteID");
									String groupNum = classdao.getGroupNum(classNum);
									ServletContext context =  request.getSession().getServletContext();//어플리케이션에 대한 정보를 가진다.  
									String saveDir = context.getRealPath("NoteText");
									System.out.println("@@@@@@@@@@@@@@"+saveDir);

									String folderPath = saveDir+"/"+groupNum+"/"+classNum;
									String writeTxtPath = saveDir+"/out.txt";
									FolderToWrite ftw = new FolderToWrite();
									ftw.readFolderAndWrite(folderPath, writeTxtPath);									
									
									PythonAnalysis pa = new PythonAnalysis();
									String result = pa.sortByWordsNum(saveDir+"/py/words2.py");													
									
									%>
									<%=result%> 
									
</body>
</html>