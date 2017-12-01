<%@page import="com.VO.classVO"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.NoteVO"%>
<%@page import="com.DAO.NoteDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
			<nav id="menu"> 
			<header class="major">
			<% String list = (String) request.getAttribute("list"); %>
			<% String classNum = (String) request.getAttribute("classID"); %>
<%-- 			<% ClassDAO dao = new ClassDAO(); %> --%>
<%-- 			<% classVO vo = dao.getClass(classNum); %> --%>
<%-- 			<h2><%= vo.getName()%></h2> --%>
			</header>

			<%= list %>
			</nav>
			
			<section>
			<header class="major">
			<h2>노트 생성하기</h2>
			</header>
			<p style="text-align: right;float: right;">
			<a href="class_note.jsp?classNum=41&amp;groupName=smhrd&amp;className=github&amp;nickname=coldamter" class="button">노트 추가</a>
			</p>
			</section>
			
			<section>
			<header class="major">
			<h2>노트 이동(부모를 지정하세요)</h2>
			</header>
			<form action="NoteMovingService">
			<div></div>
			<input type="text" name = "noteID" style="width:30%;display:inline;"/><b> →</b>
			<input type="text" name = "parentID" style="width:30%;display:inline;"/>
			<input type="hidden" name = "classID" value="<%=classNum%>"/>
			<input type="submit" value = "이동" style="text-align: right;float: right;"/>
			</form>
			</section>
			
			<section>
			<header class="major">
			<h2>노트 삭제하기</h2>
			</header>
			
			<form action="NoteDeletingService">
			<input type="text" name = "noteID" style="width:30%;display:inline;"/>
			<input type="hidden" name = "classID" value="<%=classNum%>"/>
			<input type="submit" value = "삭제" style="text-align: right;float: right;"/>
			</form>
			</section>
						
			<!-- Section -->
			<section> <header class="major">
			
			<h2>Ante interdum</h2>
			
			</header>
			<div class="mini-posts">
				<article> <a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
				<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
					dolore aliquam.</p>
				</article>
				<article> <a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
				<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
					dolore aliquam.</p>
				</article>
				<article> <a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
				<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
					dolore aliquam.</p>
				</article>
			</div>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</section>

			<!-- Section -->
			<section> <header class="major">
			<h2>Get in touch</h2>
			</header>
			<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare
				velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed
				aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus
				aliquam.</p>
			<ul class="contact">
				<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
				<li class="fa-phone">(000) 000-0000</li>
				<li class="fa-home">1234 Somewhere Road #8254<br /> Nashville,
					TN 00000-0000
				</li>
			</ul>
			</section>

			<!-- Footer -->
			<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
			</footer>

		</div>
	</div>

</body>
</html>