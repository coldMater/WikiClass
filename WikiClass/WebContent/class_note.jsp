<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<link rel="stylesheet" href="font_adjust.css" />
<style type="text/css">
header#header{

padding-top: 2em !important;
}
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
		<title>노트 만들기</title>
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
	int classNum = Integer.parseInt(request.getParameter("classNum"));
	System.out.println("노트편집 : 클래스 번호 = "+classNum);
	String className = request.getParameter("className");
	String groupName = request.getParameter("groupName");
	

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
										<h3><%=groupName %></h3><h2>Group</h2>&nbsp;<h3><%=className %></h3><h2>Class</h2>
										<h1>노트 추가</h1>
									</header>
								<form action="noteInsert.do" method = "post">
									<input type="text" name="noteName" placeholder="노트 제목">
									<br><br><h2>노트의 내용을 적어주세요</h2>
									<input type="text" name="classNum" value="<%=classNum %>" style="display: none;">
									<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="submit" value="노트 추가" id="createNote"/>
								</form>	
								</section>
						</div>
					</div>

			<!-- Search -->

			</div>
		
					<!-- Scripts -->
			<script src="class_assets/js/jquery.min.js"></script>
			<script src="class_assets/js/skel.min.js"></script>
			<script src="class_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="class_assets/js/main.js"></script>
	</body>
</html>