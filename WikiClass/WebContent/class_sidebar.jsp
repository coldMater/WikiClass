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
<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.inner{
 font-family:'NanumGothicExtraBold';
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

a[data-depth="0"]{
font-size:2.0rem;
}

</style>
</head>
<body>
	<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">
	
			
			<!-- Menu --><!-- 클래스 이름 표시 부분 -->
			<nav id="menu"> 
			<header class = "major" style="font-size:1.2em;height:5.5em;" >
			
			
			
			<% String list_side = (String) request.getAttribute("list"); %>

			<% String classNum_side = (String) request.getAttribute("classID"); %>

			<% if(classNum_side ==null){
				classNum_side = request.getParameter("classNum");	
			}%>

			<% ClassDAO dao_side = new ClassDAO(); %>

			
			<% if(dao_side.getClass(classNum_side)!=null){
				classVO vo_side = dao_side.getClass(classNum_side); %>
			
			<h1 style="display:inline;"><a style = "border-bottom:none;" href="#"><i class="fa fa-book" ></i></a></h1><h2 style="font-size:1.5em">&nbsp&nbsp <a style = "border-bottom:none;" href="NoteLoadingService?classNum=<%=classNum_side%>"><%= vo_side.getName()%></a> </h2>
			<%} %>

			</header>
			<header class = "icon" style="text-align:right;">
			<h2 style="font-size:2.0em;">
			
				<a style = "border-bottom:none;" href="class_note.jsp?classNum=<%=classNum_side%>&amp;groupName=smhrd&amp;className=github&amp;nickname=coldamter"><i class="fa fa-plus" title="노트 생성(Create)"></i>
				&nbsp <!--  style = "color:#337ab7;" --> 
				<a style = "border-bottom:none;" href="#"><i class="fa fa-plane" title="노트 이동(Move)"></i> <!-- fa-arrows : 화살표 -->
				&nbsp 
				<a style = "border-bottom:none;" href="#"><i class="fa fa-pencil" title="노트 편집(Edit)"></i>
				&nbsp 
				<a style = "border-bottom:none;" href="#"><i class="fa fa-minus"  title="노트 삭제(Delete)"></i></h2>
			 	<!-- style = "color:#d9534f;" --> 
			
			</header>
			
			<% if(list_side!=null){%>
				<%= list_side %>
			<%}%>
			
			</nav>
			
			<div style="position:fixed;left:407px;bottom:0px;width:150px;height:150px;background-color: rgba(9,70,77,0.5)"></div>
			
			<section>
			<header class="major">
			<h2>노트 편집하기</h2>
			</header>
			
			<form action="class_note_edit.jsp">
			<input type="text" name = "noteID" style="width:30%;display:inline;"/>
			<input type="hidden" name = "classID" value="<%=classNum_side%>"/>
			<input type="submit" value = "편집" style="text-align: right;float: right;"/>
			</form>
			</section>
			
			<section>
			<header class="major">
			<h2>노트 생성하기</h2>
			</header>
			<p style="text-align: right;float: right;">
			<a href="class_note.jsp?classNum=<%=classNum_side%>&amp;groupName=smhrd&amp;className=github&amp;nickname=coldamter" class="button">노트 추가</a>
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
			<input type="hidden" name = "classID" value="<%=classNum_side%>"/>
			<input type="submit" value = "이동" style="text-align: right;float: right;"/>
			</form>
			</section>
			
			<section>
			<header class="major">
			<h2>노트 삭제하기</h2>
			</header>
			
			<form action="NoteDeletingService">
			<input type="text" name = "noteID" style="width:30%;display:inline;"/>
			<input type="hidden" name = "classID" value="<%=classNum_side%>"/>
			<input type="submit" value = "삭제" style="text-align: right;float: right;"/>
			</form>
			</section>
			
			<!-- Search -->
			<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
			</section>
			
			<!-- Footer -->
			<footer id="footer">
			<p class="copyright" style="margin-bottom:0px;">
				&copy; WikiClass </p>
			<p class="copyright" style="text-align :right;">Design your idea, spread together.</p>
			</footer>

		</div>
	</div>

</body>
</html>