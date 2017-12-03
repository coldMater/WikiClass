<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MyPage</title>
<meta charset="euc-kr" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="class_assets/css/main.css?var=1" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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
			<table style="width: 100%">
				<c:forEach items="${list }" var="i" >
				<tr>	
					<td>
						<i class="fa fa-users" aria-hidden="true" style="color:#20C0FF;font-size:1.2rem"></i><b style="font-size:1.2rem;">${i }</b>
					</td>
				</tr>	
				</c:forEach>
			</table>
		</div>
	</div>
				<script src="class_assets/js/jquery.min.js"></script>
				<script src="class_assets/js/skel.min.js"></script>
				<script src="class_assets/js/util.js"></script>
				<script src="class_assets/js/main.js"></script>
</body>
</html>