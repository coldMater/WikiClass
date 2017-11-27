<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Identity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>WikiClass Join</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="adm_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<noscript><link rel="stylesheet" href="adm_assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">
<%
String uri = request.getParameter("uri");
System.out.println("회원가입에 접근한 uri = "+uri);
%>
		<!--회원가입 실패-->
		<c:if test="${requestScope.check == 3}">
			<script type="text/javascript">
				show()
				function show(){
					alert("회원가입에 실패하셨습니다.")
				}
			</script>
		</c:if>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
				1	<section id="main">
						<header>
							<span class="avatar"><img src="images/logo.png" alt="" /></span>
							<h1>WikiClass</h1>
						</header>
						
						<form method="post" action="memberJoin.do">
							<div class="field">
								<input type="text" name="email" id="email" placeholder="email" required/>
								<!-- 여기에 중복 확인 -->
							</div>
							<div class="field">
								<input type="password" name="Password1" id="Password1" placeholder="Password" required/>
							</div>
							<div class="field">
								<input type="password" name="Password2" id="Password2" placeholder="Confirm Password " required/>
								<!-- 여기에 패스워드 일치 확인 -->
							</div>
							<div class="field">
								<input type="text" name="nickname" id="nickname" placeholder="nickname" required/>
							</div>
							<input type="text" name="uri" value="<%=uri %>" style="display: none">
							<ul class="actions">
								<li><input type="submit" value="회원가입"></li>
							</ul>
						</form>
						<hr />
					</section>

			</div>

		<!-- Scripts -->
			<!--[if lte IE 8]><script src="assets/js/respond.min.js"></script><![endif]-->
			<script>
				if ('addEventListener' in window) {
					window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
					document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
				}
			</script>

	</body>
</html>