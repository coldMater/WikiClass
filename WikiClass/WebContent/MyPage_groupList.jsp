<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String email = (String) session.getAttribute("email");
		//그룹테이블에서 멤버 번호가 있는 그룹 가지고오기
		ClassDAO cdao = new ClassDAO();
		ArrayList<String> list = new ArrayList<String>();
		list = cdao.selectNameGroup(email);
		request.setAttribute("list", list);

		if (list == null) {
			System.out.println("MyPage.jsp에서  list가 null 입니다.");
			response.sendRedirect("main_index.jsp");
		}
	%>

	<div class="row">
		<div class="6u 12u$(small)">
			<ul style="padding-left: 20px">
				<c:forEach items="${list }" var="i">
					<h3>
						<li>${i }</li>
					</h3>
				</c:forEach>
			</ul>
		</div>
	</div>

</body>
</html>