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
<style>
.table4_3 table {
	width:100%;
	margin:15px 0;
	border:0;
}
.table4_3 th {
	background-color:#87CEFA;
	color:#000000
}
.table4_3,.table4_3 th,.table4_3 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_3 th,.table4_3 td {
	border: 1px solid #bae3fc;
	border-width:1px 0 1px 0
}
.table4_3 tr {
	border: 1px solid #bae3fc;
}
.table4_3 tr:nth-child(odd){
	background-color:#d7eefd;
}
.table4_3 tr:nth-child(even){
	background-color:#fdfdfd;
}
</style>

<body>

<%
									ClassDAO classdao = new ClassDAO();
									String classNum = (String)session.getAttribute("pyClassID");
									String noteNum = (String)session.getAttribute("pyNoteID");
									String groupNum = (String)session.getAttribute("pyGroupID");
									ServletContext context =  request.getSession().getServletContext();//어플리케이션에 대한 정보를 가진다.  
									String saveDir = context.getRealPath("NoteText");
									System.out.println("@@@@@@@@@@@@@@"+saveDir);

									String folderPath = saveDir+"/"+groupNum+"/"+classNum;
									String writeTxtPath = saveDir+"/out.txt";
									FolderToWrite ftw = new FolderToWrite();
									ftw.readFolderAndWrite(folderPath, writeTxtPath);									
									
									PythonAnalysis pa = new PythonAnalysis();
									String result = pa.sortByWordsNum(saveDir+"/py/words2.py");
								
									/* System.out.println("Dir : "+saveDir);
									System.out.println("classNum : "+classNum);
									System.out.println("noteNum : "+noteNum);
									System.out.println("groupNum : "+groupNum);
									System.out.println("result: "+result); */
									
									%>
									<%=result%> 
									
</body>
</html>