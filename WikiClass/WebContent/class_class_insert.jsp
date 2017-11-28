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
</style>
		<script src="./ckeditor/ckeditor.js"></script>
		<title>class 만들기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="./ckeditor/contents.css" />
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

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
										<h1>Class 만들기</h1>
									</header>
									
									<table>
										<tr>
											<td>
												<span class="image main"><img src="images/pic11.jpg" alt="" style="width: 17%; height: 300px"/><input type="file"></span>
											</td>
											<td>
												<!-- 권한 부여된 사람들 출력 -->
												<!-- 권한 부여할 닉네임 입력 -->
												
											</td>
										</tr>
									</table>
									<h2>Class의 간략한 내용을 적어주세요</h2>
									
									<form action="class_input_editorSave" method="get">
										<textarea name="editor1" id="editor1" rows="10" cols="80">
	    		        		    		
	    		        				</textarea>
										<input type="submit" value="저장" />
										<script>
											CKEDITOR.replace('editor1');
										</script>
									</form>
								</section>

						</div>
					</div>

				<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">

			<!-- Search -->
			<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
			</section>

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>목차</h2>
			</header>
			<ul>
				<li><a href="main_index.jsp">메인홈페이지</a></li>
				<li><a href="class_index.jsp">class메인홈페이지</a></li>
				<li><a href="class_generic.jsp">노트 첫페이지</a></li>
				<li><a href="class_editor.jsp">에디터 편집페이지</a></li>
				<li><a href="class_elements.jsp">Elements</a></li>
				<li><a href="#">대단원입니다.</a></li>
				<li><span class="opener">중단원열기</span>
					<ul>
						<li><a href="#">중단원입니다.</a></li>
						<li><a href="#">Ipsum Adipiscing</a></li>
						<li><a href="#">Tempus Magna</a></li>
						<li><a href="#">Feugiat Veroeros</a></li>
					</ul></li>
				<li><a href="#">Etiam Dolore</a></li>
				<li><a href="#">Adipiscing</a></li>
				<li><span class="opener">Another Submenu</span>
					<ul>
						<li><a href="#">Lorem Dolor</a></li>
						<li><a href="#">Ipsum Adipiscing</a></li>
						<li><a href="#">Tempus Magna</a></li>
						<li><a href="#">Feugiat Veroeros</a></li>
					</ul></li>
				<li><a href="#">Maximus Erat</a></li>
				<li><a href="#">Sapien Mauris</a></li>
				<li><a href="#">Amet Lacinia</a></li>
			</ul>
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