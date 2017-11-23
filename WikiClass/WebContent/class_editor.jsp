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

#cke_1_contents{

	height: 1000px !important;

}
</style>
		<title>Generic - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
							<%@include file="class_header.jsp" %>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>노트 편집</h1>
									</header>
									<%@include file="editor.jsp" %>

								</section>

						</div>
					</div>

				<%@ include file="class_sidebar.jsp" %>

			</div>

		<!-- Scripts -->
			<script src="class_assets/js/jquery.min.js"></script>
			<script src="class_assets/js/skel.min.js"></script>
			<script src="class_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="class_assets/js/main.js"></script>

	</body>
</html>