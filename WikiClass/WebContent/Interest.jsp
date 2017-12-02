<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<style type="text/css">
header#header{

padding-top: 2em !important;
}
td{
	background-color: white;
}
table tbody tr{
	border:0px !important;
}
</style>
<title>Mypage 분야 추가</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
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
				<%@include file="class_header.jsp"%>

				<!-- Banner -->
				<br><h1>관심 분야 추가</h1>
	<form action="mypageInsert.do">
		<table id="favortieTable">
			<tr>
				<td style="width: 300px;">
					<select name="favortie" id="favortie" style="width: 300px;">
						<option>-분야-</option>
						<option>게임</option>
						<option>그래픽/디자인/멀티/미디어</option>
						<option>네트워크/해킹/보안</option>
						<option>모바일 프로그래밍</option>
						<option>모바일/태블릿/SNS</option>
						<option>오피스 활용</option>
						<option>웹사이트</option>
						<option>인터넷 비즈니스</option>
						<option>컴퓨터 공학</option>
						<option>OS/데이터베이스</option>
						<option>컴퓨터 입문/활용</option>
						<option>프로그래밍 언어</option>
						<option>기타</option>
					</select>
				</td>
				<td>
					<input type="button" onclick="insertFavortie()" id="insertfavortie" value="항목추가">
				</td>
			</tr>
		</table>	
		<input type="hidden" value="${sessionScope.email }" name="email" id="email">
		<input type="submit" value="저장">
	</form>
				<p>관심 분야 설정 가능하며, 이를 토대로 실시간 추천을 위한 favortie그룹이 지정됩니다.</p>

				<!-- my페이지 구성을위한 Sample Section 추가 -->
				<section> </section>


			</div>
		</div>

		<%-- <%@ include file="class_sidebar.jsp" %> --%>
	</div>

	<!-- Scripts -->
	<script src="class_assets/js/jquery.min.js"></script>
	<script src="class_assets/js/skel.min.js"></script>
	<script src="class_assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="class_assets/js/main.js"></script>
	<script type="text/javascript">
		var tableTag = document.getElementById("favortieTable")
		var buttonTag = document.getElementById("insertfavortie")
		var selectTag = document.getElementById("favortie")
		
		function insertFavortie(){
			var new_td1 = document.createElement("td")
			var new_td2 = document.createElement("td")
			var new_tr = document.createElement("tr")
			new_select = document.createElement("select")
			
			
			new_select.id="favortie";
			new_select.name = "favortie";
			
			new_option = document.createElement("option")
			new_option.text="-분야-"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="게임"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="그래픽/디자인/멀티/미디어"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="네트워크/해킹/보안"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="모바일 프로그래밍"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="모바일/태블릿/SNS"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="오피스 활용"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="웹사이트"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="인터넷 비즈니스"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="컴퓨터 공학"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="OS/데이터베이스"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="컴퓨터 입문/활용"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="프로그래밍 언어"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="기타"
			new_select.appendChild(new_option)
						
			new_td1.appendChild(new_select)
			new_td2.appendChild(buttonTag)
			new_tr.appendChild(new_td1)
			new_tr.appendChild(new_td2)
			tableTag.appendChild(new_tr)
			
		}
	
	
	
	</script>

</body>
</html>