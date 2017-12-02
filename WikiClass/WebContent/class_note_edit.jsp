<%@page import="com.DAO.TextReadWriteDAO"%>
<%@page import="com.VO.NoteVO"%>
<%@page import="com.DAO.NoteDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
<style type="text/css">
#cke_1_contents{
	height: 800px !important;
}
img{
	outline: 0px !important;
}
td{
	background-color: white;
}
table tbody tr{
	border:0px solid black !important;
}
h3,h2{
	display: inline;
}
</style>
		<title>노트 편집</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="./ckeditor/ckeditor.js"></script>
		<link rel="stylesheet" href="./ckeditor/contents.css" />
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>
<%
	String classNum = (String)request.getParameter("classID");
	String noteNum = (String)request.getParameter("noteID");
	String className = request.getParameter("className");
	String groupName = request.getParameter("groupName");
	
	//NoteDAO 를 통해 noteID를 통해 가져오기	
	NoteDAO noteDAO = new NoteDAO();
	NoteVO noteVO = noteDAO.getNote(noteNum);
	String title = "제목을 정상적으로 불러오지 못하였습니다.";
	String content ="내용을 정상적으로 불러오지 못하였습니다.";
	if(noteVO!=null){
		title = noteVO.getTitle();
		content = noteVO.getContent();
		String path = noteVO.getPath();
		TextReadWriteDAO trwDAO = new TextReadWriteDAO();
		System.out.println("여기서 경로는?");
		System.out.println(path);
		content = trwDAO.readNote(path, noteNum);
		
	}
	
%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
							<%@include file="class_header.jsp" %>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>노트 편집</h1>
									</header>
								<form action="NoteUpdatingService" method = "post">
									<input type="text" name="noteName" placeholder="노트 제목" value = "<%=title%>">
									<br><br><h2>노트의 내용을 적어주세요</h2>
									<input type="text" name="classNum" value="<%=classNum %>" style="display: none;">
									<textarea name="editor1" id="editor1" rows="10" cols="80"><%=content %></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="hidden" name = "noteNum" value = "<%=noteNum%>"/>
									<input type="submit" value="노트 편집" id="createNote"/>
								</form>	
								</section>
						</div>
					</div>

			<!-- Search -->
	<div id="sidebar">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>노트 설명</h2>
			</header>
			노트에 대한 설명이 간략하게 필요합니다.<br>
			어떤 태그가 어떻게 이루어지는지 설명
			</nav>

		</div>
	</div>
			</div>

		<!-- Scripts -->
			<script src="class_assets/js/jquery.min.js"></script>
			<script src="class_assets/js/skel.min.js"></script>
			<script src="class_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="class_assets/js/main.js"></script>
	</body>
</html>