<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<style>


.class_list {
		background: #fff;

	}


/* Posts */
.posts {
	display: -moz-flex;
	display: -webkit-flex;
	display: -ms-flex;
	display: flex;
	-moz-flex-wrap: wrap;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin: 0 0 2em -6em;
	width: calc(100% + 6em);
}

.posts article {
	-moz-flex-grow: 0;
	-webkit-flex-grow: 0;
	-ms-flex-grow: 0;
	flex-grow: 0;
	-moz-flex-shrink: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-shrink: 1;
	flex-shrink: 1;
	margin: 0 0 6em 6em;
	position: relative;
	width: calc(33.33333% - 6em);
}

.posts article:before {
	background: rgba(210, 215, 217, 0.75);
	content: '';
	display: block;
	height: calc(100% + 6em);
	left: -3em;
	position: absolute;
	top: 0;
	width: 1px;
}

.posts article:after {
	background: rgba(210, 215, 217, 0.75);
	bottom: -3em;
	content: '';
	display: block;
	height: 1px;
	position: absolute;
	right: 0;
	width: calc(100% + 6em);
}

.posts article>:last-child {
	margin-bottom: 0;
}

.posts article .image {
	display: block;
	margin: 0 0 2em 0;
}

.posts article .image img {
	display: block;
	width: 100%;
}

@media screen and (min-width: 1681px) {
	.posts article:nth-child(3n + 1):before {
		display: none;
	}
	.posts article:nth-child(3n + 1):after {
		width: 100%;
	}
	.posts article:nth-last-child(1), .posts article:nth-last-child(2),
		.posts article:nth-last-child(3) {
		margin-bottom: 0;
	}
	.posts article:nth-last-child(1):before, .posts article:nth-last-child(2):before,
		.posts article:nth-last-child(3):before {
		height: 100%;
	}
	.posts article:nth-last-child(1):after, .posts article:nth-last-child(2):after,
		.posts article:nth-last-child(3):after {
		display: none;
	}
}

@media screen and (max-width: 1680px) {
	.posts article {
		width: calc(50% - 6em);
	}
	.posts article:nth-last-child(3) {
		margin-bottom: 6em;
	}
}

@media screen and (min-width: 481px) and (max-width: 1680px) {
	.posts article:nth-child(2n + 1):before {
		display: none;
	}
	.posts article:nth-child(2n + 1):after {
		width: 100%;
	}
	.posts article:nth-last-child(1), .posts article:nth-last-child(2) {
		margin-bottom: 0;
	}
	.posts article:nth-last-child(1):before, .posts article:nth-last-child(2):before
		{
		height: 100%;
	}
	.posts article:nth-last-child(1):after, .posts article:nth-last-child(2):after
		{
		display: none;
	}
}

@media screen and (max-width: 736px) {
	.posts {
		margin: 0 0 2em -4.5em;
		width: calc(100% + 4.5em);
	}
	.posts article {
		margin: 0 0 4.5em 4.5em;
		width: calc(50% - 4.5em);
	}
	.posts article:before {
		height: calc(100% + 4.5em);
		left: -2.25em;
	}
	.posts article:after {
		bottom: -2.25em;
		width: calc(100% + 4.5em);
	}
	.posts article:nth-last-child(3) {
		margin-bottom: 4.5em;
	}
}

@media screen and (max-width: 480px) {
	.posts {
		margin: 0 0 2em 0;
		width: 100%;
	}
	.posts article {
		margin: 0 0 4.5em 0;
		width: 100%;
	}
	.posts article:before {
		display: none;
	}
	.posts article:after {
		width: 100%;
	}
	.posts article:last-child {
		margin-bottom: 0;
	}
	.posts article:last-child:after {
		display: none;
	}
}
</style>
<title>WikiClass</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body class="homepage">
	<div id="page-wrapper">

<%
String uri = request.getRequestURI();
String path = request.getContextPath();
String req_uri = uri.substring(path.length()+1);
System.out.println("main_index�� ���� uri = "+req_uri);
%>
		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<table style='background-color: rgba(0, 0, 0, 0.5);'>
					<tr>
						<td><header>
							<h1 style="font-size: 6em;">
								<a href="main_index.jsp" id="logo"><img
									src="images/logo2.png" alt="" />WikiClass</a>
							</h1>
							<hr />
							<p>������ ���÷��� Start�� Ŭ�����ּ���</p>
							</header></td>
					</tr>
				</table>
				<footer> <a href="#banner" class="button circled scrolly">Start</a>
				</footer>
			</div>

			<!-- Nav -->
			<nav id="nav">
			<ul>
				
								<li><a href="main_index.jpg">Home</a></li>
								<li>
									<a href="#">Dropdown</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
										<li>
											<a href="#">And a submenu &hellip;</a>
											<ul>
												<li><a href="#">Lorem ipsum dolor</a></li>
												<li><a href="#">Phasellus consequat</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam dolore nisl</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="left-sidebar.html">Left Sidebar</a></li>
								<c:choose>
									<c:when test="${empty sessionScope.email }">
										<li><a href="memberLogin.jsp?uri=<%=req_uri %>">�α���</a></li>
										<li><a href="memberJoin.jsp?uri=<%=req_uri %>">ȸ������</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">����������</a></li>
										<li><a href="logout?uri=<%=req_uri%>">�α׾ƿ�</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
								

		</div>

		<!-- Banner -->
		<section id="banner"> <header>
		<h2>
			<strong>WikiClass</strong>�� ��ſ��� ��õ�ϴ� ��Ʈ�Դϴ�!
		</h2>
		<!-- 	<p>
							A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.
							Built on <strong>skel</strong> and released under the <a href="http://html5up.net/license">CCA</a> license.
						</p> --> </header> </section>

		<!-- Carousel -->
		<section class="carousel">
		<div class="reel">

			<article> <a href="#" class="image featured"><img
				src="images/java.png" alt="" /></a> <header>
			<h3>
				<a href="#">Java Class</a>
			</h3>
			</header>
			<p>����Ʈ�̵�����簳�߿��� ��ǥ �����Դϴ�. �̰��� �л���Ӹ� �ƴ϶� �ι��� �л� .....</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/python.png" alt="" /></a> <header>
			<h3>
				<a href="#">Analysis Class</a>
			</h3>
			</header>
			<p>���̽��� �߽����� �� ������ ���ʹ���, �ֿ� ���̺귯��, ��.......</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic03.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Sed quis rhoncus placerat</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic04.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Ultrices urna sit lobortis</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic05.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Varius magnis sollicitudin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic01.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Pulvinar sagittis congue</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic02.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Fermentum sagittis proin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic03.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Sed quis rhoncus placerat</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic04.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Ultrices urna sit lobortis</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic05.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Varius magnis sollicitudin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

		</div>
		</section>


		<!-- ��� Section Test -->
		<section> <header class="major">
		<h2>���</h2>
		</header>
		<div class="posts">
			<article> <a href="#" class="image"><img
				src="images/java.png" alt="" /></a>
			<h3>Java Class</h3>
			<p>����Ʈ�̵�� ���簳�߿��� ��ǥ���� �����Դϴ�. �̰��� �л���Ӹ� �ƴ϶� �ι��� �л��鵵 ���� ����⶧����,
				�ʽ����� �������� ���� �������� �����Ǿ��ְ�, �������� ���� ���� ����� �� �ֽ��ϴ�.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</article>
			<article> <a href="#" class="image"><img
				src="images/python.png" alt="" /></a>
			<h3>Analysis Class</h3>
			���̽��� �߽����� �� ������ ���ʹ���, �ֿ� ���̺귯��, �׸��� �м����� �� Ŭ������ ���� ��� ��� �� �ֽ��ϴ�! ������
			�������� �Ǳ� ���Ѵٸ� �ݵ�� ���ľ��ϴ� �����Դϴ� ���� ���������!
			</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</article>
			<article> <a href="#" class="image"><img
				src="images/pic03.jpg" alt="" /></a>
			<h3>Tempus ullamcorper</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem
				feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</article>
			<article> <a href="#" class="image"><img
				src="images/pic04.jpg" alt="" /></a>
			<h3>Sed etiam facilis</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem
				feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</article>
			<article> <a href="#" class="image"><img
				src="images/pic05.jpg" alt="" /></a>
			<h3>Feugiat lorem aenean</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem
				feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</article>
			<article> <a href="#" class="image"><img
				src="images/pic06.jpg" alt="" /></a>
			<h3>Amet varius aliquam</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem
				feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</article>
		</div>
		</section>







		<!-- Main -->
		<div class="wrapper style2">

			<article id="main" class="container special"> <a href="#"
				class="image featured"><img src="images/pic06.jpg" alt="" /></a> <header>
			<img alt="" src="images/logo1.png"
				style="height: 339px; width: 240px" />
			<h2>
				<a href="#">����� WikiClass</a>
			</h2>
			<br>

			<h3>Class ������ �Բ� ����� �� �����ΰ� �����ϴ� �н���Ʈ</h3>


			<p style="line-height: 5em">
			<h4>
				<!--  -->
				WikiClass is PlatformService which helps users create note consist
				of contents organized by every member in Your Class.<br>
				WikiClass�� �н������� Class ������ �Բ� ����� �ٸ� ����ڵ�� ������ �� �ִ� �÷��� �����Դϴ�.����
				�̿��غ�����!


			</h4>

			</p>
			</header> <footer> <a href="class_index.jsp" class="button">-->
				�����մϴ�.</a> </footer> </article>

		</div>

		<!-- Features -->
		<div class="wrapper style1">

			<section id="features" class="container special"> <header>
			<h2>Morbi ullamcorper et varius leo lacus</h2>
			<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis
				integer semper magna.</p>
			</header>
			<div class="row">
				<article class="4u 12u(mobile) special"> <a href="#"
					class="image featured"><img src="images/pic07.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Gravida aliquam penatibus</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
				<article class="4u 12u(mobile) special"> <a href="#"
					class="image featured"><img src="images/pic08.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Sed quis rhoncus placerat</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
				<article class="4u 12u(mobile) special"> <a href="#"
					class="image featured"><img src="images/pic09.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Magna laoreet et aliquam</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
			</div>
			</section>

		</div>

		<!-- Footer -->
		<div id="footer">
			<div class="container">
				<div class="row">

					<!-- Tweets -->
					<section class="4u 12u(mobile)"> <header>
					<h2 class="icon fa-twitter circled">
						<span class="label">Tweets</span>
					</h2>
					</header>
					<ul class="divided">
						<li><article class="tweet"> Amet nullam fringilla
							nibh nulla convallis tique ante sociis accumsan. <span
								class="timestamp">5 minutes ago</span> </article></li>
						<li><article class="tweet"> Hendrerit rutrum
							quisque. <span class="timestamp">30 minutes ago</span> </article></li>
						<li><article class="tweet"> Curabitur donec nulla
							massa laoreet nibh. Lorem praesent montes. <span
								class="timestamp">3 hours ago</span> </article></li>
						<li><article class="tweet"> Lacus natoque cras
							rhoncus curae dignissim ultricies. Convallis orci aliquet. <span
								class="timestamp">5 hours ago</span> </article></li>
					</ul>
					</section>

					<!-- Posts -->
					<section class="4u 12u(mobile)"> <header>
					<h2 class="icon fa-file circled">
						<span class="label">Posts</span>
					</h2>
					</header>
					<ul class="divided">
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Nisl fermentum integer</a>
							</h3>
							</header> <span class="timestamp">3 hours ago</span> </article></li>
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Phasellus portitor lorem</a>
							</h3>
							</header> <span class="timestamp">6 hours ago</span> </article></li>
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Magna tempus consequat</a>
							</h3>
							</header> <span class="timestamp">Yesterday</span> </article></li>
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Feugiat lorem ipsum</a>
							</h3>
							</header> <span class="timestamp">2 days ago</span> </article></li>
					</ul>
					</section>

					<!-- Photos -->
					<section class="4u 12u(mobile)"> <header>
					<h2 class="icon fa-camera circled">
						<span class="label">Photos</span>
					</h2>
					</header>
					<div class="row 25%">
						<div class="6u">
							<a href="#" class="image fit"><img src="images/pic10.jpg"
								alt="" /></a>
						</div>
						<div class="6u$">
							<a href="#" class="image fit"><img src="images/pic11.jpg"
								alt="" /></a>
						</div>
						<div class="6u">
							<a href="#" class="image fit"><img src="images/pic12.jpg"
								alt="" /></a>
						</div>
						<div class="6u$">
							<a href="#" class="image fit"><img src="images/pic13.jpg"
								alt="" /></a>
						</div>
						<div class="6u">
							<a href="#" class="image fit"><img src="images/pic14.jpg"
								alt="" /></a>
						</div>
						<div class="6u$">
							<a href="#" class="image fit"><img src="images/pic15.jpg"
								alt="" /></a>
						</div>
					</div>
					</section>

				</div>
				<hr />
				<div class="row">
					<div class="12u">

						<!-- Contact -->
						<section class="contact"> <header>
						<h3>Nisl turpis nascetur interdum?</h3>
						</header>
						<p>Urna nisl non quis interdum mus ornare ridiculus egestas
							ridiculus lobortis vivamus tempor aliquet.</p>
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span
									class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span
									class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span
									class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-pinterest"><span
									class="label">Pinterest</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span
									class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span
									class="label">Linkedin</span></a></li>
						</ul>
						</section>

						<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved.</li>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.onvisible.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>