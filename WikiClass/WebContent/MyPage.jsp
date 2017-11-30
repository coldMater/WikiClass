<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="com.DAO.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="class_assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
<%
	String email = (String)session.getAttribute("email");
	memberDAO mdao = new memberDAO();
	MemberVO mvo = mdao.emailselect(email);
	request.setAttribute("mvo", mvo);
	
	//그룹테이블에서 멤버 번호가 있는 그룹 가지고오기
	ClassDAO cdao = new ClassDAO();
	ArrayList<String> list = new ArrayList<String>();
	list = cdao.selectNameGroup(email);
	request.setAttribute("list", list);
	
	//관심 분야 가져오기
	String selectFavorite = mdao.selectFavoriteOnt(email);
	String[] favorite = selectFavorite.split("_");
	for(int i=0 ; i<favorite.length ; i++){
		System.out.println("내가 선택한 분야 : "+favorite[i]);
	}
%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<%@include file="class_header.jsp"%>

				<!-- Banner -->

				<section id="banner"> <!-- Section --> <section>

				<h1 style="display: block; margin-bottom: 1.5em">My page</h1>
				</span> <section>
				<div class="features">
					<article style="display : inline;"> <header class="major">
					<h3>나의 정보</h3>
					</header>
					<table style="width: 80%;">
						<thead>
							<tr>
								<th>Name</th>
								<th>Description</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>닉네임</td>
								<td>${mvo.nickname }</td>
								<td><button>수정</button></td>
							</tr>
							<tr>
								<td>나이</td>
								<td>선택하게 만듬</td>
								<td><button>수정</button></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>선택하게 만든</td>
								<td><button>수정</button></td>
							</tr>

						</tbody>
					</table>
					</article>

					<article style="display : inline;"> <header class="major">
					<h3>내가 속한 그룹</h3>
					</header>
					<h3>Lists</h3>
					<div class="row">
						<div class="6u 12u$(small)">
							<ul>
								<c:forEach items="${list }" var="i">								
									<h4><li>${i }</li></h4>
								</c:forEach>
							</ul>
						</div>
					</div>
					</article>
				</div>
				</section> 
				<table>
					<tr style="background-color: white;border:0px;">
						<td width="140px">
							<header class="major">
								<h3>관심 분야 </h3>
							</header>
						</td>
						<td>
							<a href="Interest.jsp" style="color:red;">설정하기</a>
						</td>
					</tr>
				</table>
				
				
				
				
				<div class="features" >
				
					<article id="fa0"> <span class="icon fa-magic"></span>
					<div class="content">
						<h3 id="co0">등록된 관심 분야가 없습니다.</h3>

						<p>설정하기로 관심분야를 등록해 주세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</div>
					
					</article> 
					
					<article id="fa1"> <span class="icon fa-magic"></span>
					<div class="content">
						<h3 id="co1">그래픽/디자인/멀티/미디어</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>



					<article id="fa2"> <span class="icon fa-file-code-o"></span>
					<div class="content">
						<h3 id="co2">프로그래밍 언어</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa3"> <span class="icon fa-share-alt"></span>
					<div class="content">
						<h3 id="co3">웹사이트</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa4"> <span class="icon fa-sun-o"></span>
					<div class="content">
						<h3 id="co4">컴퓨터 공학</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa5"> <span class="icon fa-book"></span>
					<div class="content">
						<h3 id="co5">컴퓨터 수험서</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa6"> <span class="icon fa-tablet"></span>
					<div class="content">
						<h3 id="co6">모바일/테블릿/SNS</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa7"> <span class="icon fa-child"></span>
					<div class="content">
						<h3 id="co7">컴퓨터 입문/활용</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>



					<article id="fa8"> <span class="icon fa-gamepad"></span>
					<div class="content">
						<h3 id="co8">게임</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa9"> <span class="icon fa-briefcase"></span>
					<div class="content">
						<h3 id="co9">인터넷 비즈니스</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa10"> <span class="icon fa-database"></span>
					<div class="content">
						<h3 id="co10">OS/데이터베이스</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa11"> <span class="icon fa-folder-open"></span>
					<div class="content">
						<h3 id="co11">오피스 활용</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa12"> <span class="icon fa-shield"></span>
					<div class="content">
						<h3 id="co12">네트워크/해킹/보안</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa13"> <span class="icon fa-android"></span>
					<div class="content">
						<h3 id="co13">모바일 프로그래밍</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>
				</div>
				</section> <!-- my페이지 구성을위한 Sample Section 추가 --> </section>
				
				<!-- Scripts -->
				<script src="class_assets/js/jquery.min.js"></script>
				<script src="class_assets/js/skel.min.js"></script>
				<script src="class_assets/js/util.js"></script>
				<script src="class_assets/js/main.js"></script>
				<script type="text/javascript">
				
				
					for(var i=1 ; i<=13 ; i++){
						var new_article = document.getElementById("fa"+i)
						new_article.style.display="none"
					}
				
					for(var i=1 ; i<=13 ; i++){
						var new_h3 = document.getElementById("co"+(i));
						<% for(int k=0 ; k < favorite.length ; k++){ %> 
							if(new_h3.innerHTML == "<%=favorite[k] %>"){ 
								var new_article = document.getElementById("fa"+i);
								new_article.style.display="flex";
								var new_fa0 = document.getElementById("fa0")
								new_fa0.style.display ="none"
							}
						<%}%>
					}	
				
					
				
				
				</script>
				
</body>
</html>