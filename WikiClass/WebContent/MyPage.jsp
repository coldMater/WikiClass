<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="com.DAO.memberDAO"%>
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
								<td>Vis ac commodo adipiscing arcu aliquet.</td>
								<td><button>수정</button></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>Morbi faucibus arcu accumsan lorem.</td>
								<td><button>수정</button></td>
							</tr>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"></td>
								<td>100.00</td>
							</tr>
						</tfoot>
					</table>

					</article>

					<article style="display : inline;"> <header class="major">
					<h3>나의 그룹</h3>
					</header>
					<h3>Lists</h3>
					<div class="row">
						<div class="6u 12u$(small)">
							<ul>
								<li><a href style="color: black;">스마트미디어인재개발원</a></li>
								<li><a href style="color: black;">군산대학교 경영학부</a></li>
								<li><a href style="color: black;">이은식어학원</a></li>
							</ul>
						</div>
					</div>
					</article>
				</div>
				</section> <header class="major">
				<h3>관심 분야</h3>
				</header>

				<div class="features">
					<article> <span class="icon fa-magic"></span>

					<div class="content">
						<h3>그래픽/디자인/멀티/미디어</h3>
						<a href="Interest.jsp">설정하기</a>

						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>



					<article> <span class="icon fa-file-code-o"></span>
					<div class="content">
						<h3>프로그래밍 언어</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article> <span class="icon fa-share-alt"></span>
					<div class="content">
						<h3>웹사이트</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article> <span class="icon fa-sun-o"></span>
					<div class="content">
						<h3>컴퓨터 공학</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article> <span class="icon fa-book"></span>
					<div class="content">
						<h3>컴퓨터 수험서</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article> <span class="icon fa-tablet"></span>
					<div class="content">
						<h3>모바일/테블릿/SNS</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article> <span class="icon fa-child"></span>
					<div class="content">
						<h3>컴퓨터 입문/활용</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>



					<article> <span class="icon fa-gamepad"></span>
					<div class="content">
						<h3>게임</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article> <span class="icon fa-briefcase"></span>
					<div class="content">
						<h3>인터넷 비즈니스</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article> <span class="icon fa-database"></span>
					<div class="content">
						<h3>OS/데이터베이스</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article> <span class="icon fa-folder-open"></span>
					<div class="content">
						<h3>오피스 활용</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article> <span class="icon fa-shield"></span>
					<div class="content">
						<h3>네트워크/해킹/보안</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article> <span class="icon fa-android"></span>
					<div class="content">
						<h3>모바일 프로그래밍</h3>
						<a href="Interest.jsp">설정하기</a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>
				</div>
				</section> <!-- my페이지 구성을위한 Sample Section 추가 --> </section>
</body>
</html>