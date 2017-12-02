<%@page import="com.DAO.NoteHistoryDAO"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.classVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>��Ʈ view</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<style type="text/css">
		header#header{

padding-top: 2em !important;
}
		td{
	background-color: white;
}
table tbody tr{
	border:0px solid black !important;
}
img{
/* 	margin-left: 1em;
	background-position: 260 left;
	background-attachment: fixed;
	background-repeat: no-repeat;
*/	
}		
h4{
	display: inline;
}
	</style>
	</head>
	<body>
	
<%
	//name : Ŭ������
	/* String name = (String)request.getAttribute("className"); */
	String classNum_print = (String)request.getParameter("classNum");
	if(classNum_print == null){
		classNum_print = (String)request.getParameter("classID");
	}
	System.out.println("class_print�� �Ѿ�� Ŭ���� ��ȣ : "+classNum_print);
	ClassDAO cdao = new ClassDAO();
	classVO cvo = cdao.selectNameOne(Integer.parseInt(classNum_print));
	System.out.println("cvo : "+cvo);
	System.out.println("cvo Ŭ���� �̸� : "+cvo.getName());
	System.out.println("cvo Ŭ���� ��ȣ : "+cvo.getNum());
	
%>
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
									<!-- �׷쿡 ������ �ִ� ����� ���� ���� ������ ��Ʈ �߰� ���� -->
									<%
										//class_grant���̺� Ŭ������ȣ�� �α����� �����ȣ�� �ְ� ������ ��ư ����
										/* int cnt = cdao.selectGrantOne((String)session.getAttribute("email"),cvo.getNum()); */
									%>
										<p style="text-align: right;float: right;"> <a href="#" class="button">���� </a>&nbsp;<a href="class_note.jsp?classNum=<%=cvo.getNum() %>&groupName=<%=cvo.getGroup_name() %>&className=<%=cvo.getName() %>&nickname=<%=cvo.getMem_name() %>" class="button">��Ʈ �߰�</a></p>
										<h1><%=cvo.getName() %></h1>
									</header>
									
									<table class="table1">
										<tr class="tr1">
											<td class="td1" rowspan="4" width="300px" style="text-align:right;">
												<img src="classImage/<%=cvo.getImgPath() %>" alt="" style="width: 80%; height: 300px; vertical-align:top; border:1px solid black;"/>
											</td>
											<td class="td1">
											</td>
										</tr>
										<tr  class="tr1">
											<td class="td1">
											
												<h4>�׷� : </h4><%=cvo.getGroup_name() %><br>
												<h4>�ۼ��� : </h4><%=cvo.getMem_name() %><br>
												<h4>�о� : </h4><%=cvo.getFavorite() %><br>
												<h4>�ۼ���¥ : </h4><%=cvo.getSenddate() %><br>
											
											</td>
										</tr>
										<tr  class="tr1">
											<td class="td1">
												
											</td>
										</tr>
										<tr  class="tr1">
											<td class="td1">
											</td>
										</tr>
									</table>
									<p><%=cvo.getClassPath() %></p>
									
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