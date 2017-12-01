<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Identity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
	<style type="text/css">
	input{
	text-transform:lowercase;
	
	}
	
	</style>
		<title>WikiClass Login</title>
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
System.out.println("�α��ο� ������ uri = "+uri);
%>
		<!--�α��� ����-->
		<c:if test="${requestScope.check == 1}">
			<script type="text/javascript">
				show()
				function show(){
					if(confirm("���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���.\nWikiClass�� ȸ���� �ƴϽø� ȸ�������� �Ͻðڽ��ϱ�?")){
						location.href="memberJoin.jsp?uri=<%=uri%>"
					}	 
				}
			</script>
		</c:if>
		<!--ȸ������ ����-->
		<c:if test="${requestScope.check == 2}">
			<script type="text/javascript">
				show()
				function show(){
					alert("ȸ������ �����ϼ̽��ϴ�.")
				}
			</script>
		</c:if>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main">
						<header>
							<span class="avatar"><a href="<%=uri%>"><img src="images/logo.png" alt="" /></a></span>
							<h1>WikiClass</h1>
						</header>
						
						<form method="post" action="memberLogin.do">
							<div class="field">
								<input type="text" name="email" id="email" placeholder="email" maxlength="25" required style="text-transform:none; "/>
							</div>
							<div class="field">
								<input type="password" name="Password" id="Password" placeholder="Password" maxlength="12" required style="text-transform:none;">
							</div>
							<input type="text" name="uri" value="<%=uri %>" style="display: none">
							<ul class="actions">
								<li><input type="submit" value="�α���"></li>
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