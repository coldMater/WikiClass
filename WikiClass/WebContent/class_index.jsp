<%@page import="com.VO.classVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
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
		<title>WikiClass</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
div#main > div.inner >  section{
}
a.image{
width: 50%;
}
.posts article .image {
    display: inline;
}
h2{
  margin: 0.5em 0.7em 0.5em;
}
div > p {
    margin: 0.5em 0.7em 1em 1.3em;
}
ul {
   margin: 0 2em 0 1.3em;
}
ul.actions {
    cursor: default;
    list-style: none;
    /* padding-left: inherit; */
}
</style>		
	</head>
	<body>
<%
	ClassDAO cdao = new ClassDAO();
	ArrayList<classVO> list = cdao.classSelectAll();
%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main" >
						<div class="inner">
							<!-- Header -->
							<%@include file="class_header.jsp" %> <!--  로그인/로그아웃 버튼 -->
							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
										<h1>Find your Class,<br/>Join your Group</h1>
										</header>
									</div>
									</span>
								</section>

<<<<<<< HEAD

		
							<!-- my페이지 구성을위한 Sample Section 추가 -->
							<section>
							<h3>Table</h3>

													<h4>Default</h4>
													<div class="table-wrapper">
														<table style = "width: 50%;">
															<thead>
																<tr>
																	<th>Name</th>
																	<th>Description</th>
																	<th>Price</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Item1</td>
																	<td>Ante turpis integer aliquet porttitor.</td>
																	<td>29.99</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>Vis ac commodo adipiscing arcu aliquet.</td>
																	<td>19.99</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td> Morbi faucibus arcu accumsan lorem.</td>
																	<td>29.99</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>Vitae integer tempus condimentum.</td>
																	<td>19.99</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>Ante turpis integer aliquet porttitor.</td>
																	<td>29.99</td>
																</tr>
															</tbody>
															<tfoot>
																<tr>
																	<td colspan="2"></td>
																	<td>100.00</td>
																</tr>
															</tfoot>
														</table>
														
														</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Erat lacinia</h2>
									</header>
									<div class="features">
										<article>
											<span class="icon fa-diamond"></span>
											<div class="content">
												<h3>관심 분야</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-paper-plane"></span>
											<div class="content">
												<h3></h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-rocket"></span>
											<div class="content">
												<h3>Quam lorem ipsum</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-signal"></span>
											<div class="content">
												<h3>Sed magna finibus</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
									</div>
								</section>
=======
>>>>>>> branch 'master' of https://github.com/coldMater/WikiClass.git

		
								<!-- 목록 Section -->
								<section>
									<div class="posts">
									<c:if test="${not empty sessionScope.email }">
										<article>
											<div style="width: 50%;float: left;">
											<a href="class_class_insert.jsp" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>클래스만들기</h2>
											</div>	
										</article>
									</c:if>
									<%
									System.out.println(list.size());
									for(int i=0 ; i<list.size() ; i++){ %>
										<article>
											<%
												/* request.setAttribute("className", list.get(0).getName()); */
											%>
											<div style="width: 50%;float: left;">
											<a href="class_print.jsp?className=<%=list.get(i).getName() %>" class="image"><img src="classImage/<%=list.get(i).getImgPath() %>" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2><%=list.get(i).getName() %></h2>
											<p>관리자 : <%=list.get(i).getMem_name() %><br><br>
											생성일:<%=list.get(i).getSenddate() %><br><br>
											그룹:<%=list.get(i).getGroup_name() %></p>
											<ul class="actions">
												<li><a href="class_print.jsp?className=<%=list.get(i).getName() %>" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
										<%} %>
											<!-- <article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
																				<article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
																				<article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
																				<article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
																				<article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
																				<article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article>
																				<article>
											<div style="width: 50%;float: left;">
											<a href="#" class="image"><img src="images/class_example.jpg" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											<h2>Java</h2>
											<p>관리자 : 이명호<br><br>
											생성일:17.11.27<br><br>
											그룹:빅데이터 분석반</p>
											<ul class="actions">
												<li><a href="#" class="button"><p>More</p></a></li>
											</ul>
											</div>	
										</article> -->
									</div>
								</section>

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

	</body>
</html>