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
		
			<div id="sidebar" class="inactive">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>클래스란?</h2>
			</header>
			- 클래스 페이지에 오신 걸 환영합니다!<br>
			- 이 페이지에서는 당신의 그룹 구성원들과<br>&nbsp; &nbsp;공유할 수 있는 클래스를 만들 수 있습니다.<br>
			- 클래스는 특정한 범주가 있는 카테고리입<br>&nbsp; &nbsp;니다. 만약 당신의 그룹이 하나의 반이라면,<br>&nbsp; &nbsp;클래스는 당신이 배우는 과목을 뜻합니다.<br>
			<hr>
			<h3>클래스 수정</h3>
			- 분야, 클래스에 대한 설명, 권한 추가를<br>&nbsp;&nbsp;할 수 있습니다.
			<hr style="border:1;">
			<h3>주의사항</h3>
			- 클래스의 첫 페이지는 해당 클래스에 대한<br>&nbsp; &nbsp;소개로 작성해주시길 바랍니다.<br>
			- 세부적인 수정이 아닌, 큰 규모의 수정이거나 <br>&nbsp; &nbsp;목차 수정은 해당 클래스 관리자와 이야기 후<br>&nbsp; &nbsp;수정하시길 바랍니다.<br>
			- 무분별한 목차,노트 수정은 그룹원들에게<br>&nbsp; &nbsp;혼란을 가중시킬 수 있습니다.<br>
			</nav>

		</div>
	<a href="#sidebar" class="toggle">Toggle</a></div>

		<!-- Scripts -->
			<script src="class_assets/js/jquery.min.js"></script>
			<script src="class_assets/js/skel.min.js"></script>
			<script src="class_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="class_assets/js/main.js"></script>
	</body>
</html>