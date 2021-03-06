<%@page import="com.DAO.NoteHistoryDAO"%>
<%@page import="com.VO.NoteVO"%>
<%@page import="com.DAO.NoteDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>노트 view</title>
<link rel="stylesheet" href="font_adjust.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="class_assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style>
i{
display:inline;
}

div > p{
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
}
footer > a{
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
}s
footer > a > span{
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
font-size: 130%;
}
div#header{
background-image: url("images/main1.jpg");
}
div#footer{
padding-top:48px; 
padding-bottom:48px; 
}
li span{
color:black;
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
}
ul.divided > li{
margin-top: 16px !important;
padding-top: 16px !important;
}
ul.icons{
background-color:  !important;
}

header#header {
	padding-top: 2rem !important;
}

a[data-depth]{
font-family:'NanumGothicExtraBold';
font-size:0.93rem !important;
}

a[data-depth="2"]{

font-size:1.0rem !important;
}

a[data-depth="1"]{
font-size:1.05rem !important;
font-weight:bold;
border-bottom:solid 1.0px rgba(210, 215, 217, 0.75);
}

a[data-depth="0"]{
font-size:1.3rem !important;
font-weight:bold;
border-bottom:solid 1.5px rgba(210, 215, 217, 0.75);
}

</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<%@include file="class_header.jsp"%>

				<!-- Content -->
				<section> <%
 	String noteNum = request.getParameter("noteID");
 %>
				<%
					if (noteNum == null) {
						noteNum = (String) request.getAttribute("noteID");
					}
				%>
				<%
					NoteDAO dao_generic = new NoteDAO();
				%> <%
				
 	NoteVO vo = dao_generic.getNote(noteNum);
				
 %>
				<%=vo.getContent()%> <%-- history 내역 추가하기 --%> <%
 	String userNum = (String) session.getAttribute("userNum");
 %>
				<%
					NoteHistoryDAO noteHisDAO = new NoteHistoryDAO();
				%> <%
 	String classIDnow = (String) request.getAttribute("classID");
 %>
				<%
					noteHisDAO.insertHistory(userNum, noteNum, (String) request.getAttribute("classIDnow"), "1", vo.getTitle(),
							vo.getContent());
				%>
				<input type="hidden" id="content_note" value="<%=vo.getPath()%>" />

				</section>
				<iframe src="<%=vo.getPath()%>" frameborder="0"
					style="display: block;"></iframe>
				<section id="content_area"> </section>
				<script>
					var contentHTML = document.getElementById("");

					document.write(fileName.value);
				</script>

			</div>
		</div>

		<%@ include file="class_sidebar.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="class_assets/js/jquery.min.js"></script>
	<script src="class_assets/js/skel.min.js"></script>
	<script src="class_assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="class_assets/js/main.js"></script>

	<script type="text/javascript">
	var nid=3;
	var pid=3;
	var text_nid = document.getElementById("nid");
	var text_pid = document.getElementById("pic");
	
	function drag(ev) {
	    var target = ev.target
	    alert(target.id);
	}
	
	function drop(ev) {
		
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    nid = data;
	    var pid = ev.target.id
	    
	    text_nid.Attribute("value",3);
	    text_nid.setattribute("value",5);
	}
	
	</script>

</body>
</html>