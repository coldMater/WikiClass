<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.classVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>class view</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="class_assets/css/main.css?var=1" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
header#header{
padding-top: 2em !important;
}
.td1{
	background-color: white;
}
.table1, .tr1, .td1{
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
	int num = Integer.parseInt(request.getParameter("classNum"));
	System.out.println("class_print�� �Ѿ�� Ŭ���� ��ȣ : "+num);
	ClassDAO cdao = new ClassDAO();
	classVO cvo = cdao.selectNameOne(num);
	System.out.println("cvo : "+cvo);
	System.out.println("cvo Ŭ���� �̸� : "+cvo.getName());
	System.out.println("cvo Ŭ���� ��ȣ : "+cvo.getNum());
	
%>
		<!-- ���� ���� -->
		<c:if test="${requestScope.classUpdate==2 }">
			<script type="text/javascript">
				show()
				function show(){
					alert("Class���� ����")
				}
			</script>
		</c:if>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
							<%@include file="class_header.jsp" %>

							<!-- Content -->
								<section style="padding-top:20px">
									<header class="main">
									<!-- �׷쿡 ������ �ִ� ����� ���� ���� ������ ��Ʈ �߰� ���� -->
									<%
										//class_grant���̺� Ŭ������ȣ�� �α����� �����ȣ�� �ְ� ������ ��ư ����
										if(session.getAttribute("email")!=null){
										String userEmail = (String)session.getAttribute("email");
									 	 int cnt = cdao.selectClassOne(userEmail,cvo.getNum());
										if(cnt>0){ 
									%>
										<p style="text-align: right;float: right;"> <a href="class_class_edit.jsp?classNum=<%=cvo.getNum() %>" class="button">Class���� </a>&nbsp;<a href="class_note.jsp?classNum=<%=cvo.getNum() %>&groupName=<%=cvo.getGroup_name() %>&className=<%=cvo.getName() %>&nickname=<%=cvo.getMem_name() %>" class="button">��Ʈ �߰�</a></p>
									<% 	}}	%> 
										<h1><%=cvo.getName() %></h1>
									</header>
									
									<table class="table1">
										<tr class="tr1">
											<td class="td1" rowspan="4" width="300px" style="text-align:right;">
													<c:choose>
														<c:when test="<%=cvo.getImgPath()==null %>">
															<img src="classImage/Webvengers.jpg" alt="" style="width: 80%; height: 300px; vertical-align:top; border:1px solid black;"/>
														</c:when>
														<c:otherwise>
															<img src="classImage/<%=cvo.getImgPath() %>" alt="" style="width: 80%; height: 300px; vertical-align:top; border:1px solid black;"/>
														</c:otherwise>
													</c:choose>
												
											</td>
											<td class="td1">
											</td>
										</tr>
										<tr class="tr1">
											<td class="td1">
											
												<h4>�׷� : </h4><%=cvo.getGroup_name() %><br>
												<h4>�ۼ��� : </h4><%=cvo.getMem_name() %><br>
												<h4>�о� : </h4><%=cvo.getFavorite() %><br>
												<h4>�ۼ���¥ : </h4><%=cvo.getSenddate() %><br>
											
											</td>
										</tr>
										<tr class="tr1">
											<td class="td1">
											</td>
										</tr>
										<tr class="tr1">
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