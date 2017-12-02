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
			<section>
			<br /><br /><br />
			</section>
			
			
			<!-- Menu --><!-- 클래스 이름 표시 부분 -->
			<nav id="menu"> 
			<header class="major">
			
			
			
			<% String list_side = (String) request.getAttribute("list"); %>
			<% String classNum_side = (String) request.getAttribute("classID"); %>
		
			<% ClassDAO dao_side = new ClassDAO(); %>
			<% classVO vo_side = dao_side.getClass(classNum_side); %>
			<h2><i class="fa fa-book" ></i>&nbsp&nbsp <a style = "border-bottom:none;" href="NoteLoadingService?classNum=<%=classNum_side%>"><%= vo_side.getName()%></a> </h2>
			</header>
			
			<% if(list_side!=null){%>
				<%= list_side %>
			<%}%>
			
			</nav>
			
			
			
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