<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String uri = request.getRequestURI();
String path = request.getContextPath();
String req_uri = uri.substring(path.length()+1);
System.out.println("class_index에 들어온 uri = "+req_uri);
%>
	<!-- Header -->
	<header id="header"> 
		<a href="class_index.jsp" class="logo">
			<img src="images/logo3.png" alt="" style="float:left;"/>
		</a>
	<ul class="icons">
		<c:choose>
			<c:when test="${empty sessionScope.email }">
				<li><a href="memberLogin.jsp?uri=<%=req_uri %>" class="icon">로그인</a></li>
				<li><a href="memberJoin.jsp?uri=<%=req_uri %>" class="icon">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="#" class="icon">마이페이지</a></li>
				<li><a href="logout?uri=<%=req_uri%>" class="icon">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	</header>
</body>
</html>