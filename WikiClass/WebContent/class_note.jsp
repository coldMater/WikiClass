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
		<title>��Ʈ �����</title>
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
	System.out.println("��Ʈ���� : Ŭ���� ��ȣ = "+classNum);
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
										<h1>��Ʈ �߰�</h1>
									</header>
								<form action="noteInsert.do" method = "post">
									<input type="text" name="noteName" placeholder="��Ʈ ����">
									<br><br><h2>��Ʈ�� ������ �����ּ���</h2>
									<input type="text" name="classNum" value="<%=classNum %>" style="display: none;">
									<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="submit" value="��Ʈ �߰�" id="createNote"/>
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
			<h2>Ŭ������?</h2>
			</header>
			- Ŭ���� �������� ���� �� ȯ���մϴ�!<br>
			- �� ������������ ����� �׷� ���������<br>&nbsp; &nbsp;������ �� �ִ� Ŭ������ ���� �� �ֽ��ϴ�.<br>
			- Ŭ������ Ư���� ���ְ� �ִ� ī�װ���<br>&nbsp; &nbsp;�ϴ�. ���� ����� �׷��� �ϳ��� ���̶��,<br>&nbsp; &nbsp;Ŭ������ ����� ���� ������ ���մϴ�.<br>
			<hr>
			<h3>Ŭ���� ����</h3>
			- �о�, Ŭ������ ���� ����, ���� �߰���<br>&nbsp;&nbsp;�� �� �ֽ��ϴ�.
			<hr style="border:1;">
			<h3>���ǻ���</h3>
			- Ŭ������ ù �������� �ش� Ŭ������ ����<br>&nbsp; &nbsp;�Ұ��� �ۼ����ֽñ� �ٶ��ϴ�.<br>
			- �������� ������ �ƴ�, ū �Ը��� �����̰ų� <br>&nbsp; &nbsp;���� ������ �ش� Ŭ���� �����ڿ� �̾߱� ��<br>&nbsp; &nbsp;�����Ͻñ� �ٶ��ϴ�.<br>
			- ���к��� ����,��Ʈ ������ �׷���鿡��<br>&nbsp; &nbsp;ȥ���� ���߽�ų �� �ֽ��ϴ�.<br>
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