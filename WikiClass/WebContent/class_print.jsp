<%@page import="Analysis.PythonAnalysis"%>
<%@page import="Analysis.FolderToWrite"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.classVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>class view</title>
		<link rel="stylesheet" href="font_adjust.css" />
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="class_assets/css/main.css?var=1" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
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

header#header{
padding-top: 2rem !important;
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
	//name : 클래스명
	/* String name = (String)request.getAttribute("className"); */
	int num = Integer.parseInt(request.getParameter("classNum"));
	if(request.getParameter("classNum")==null){
		num =Integer.parseInt((String)request.getAttribute("classNum"));
	}
	System.out.println("class_print에 넘어온 클래스 번호 : "+num);
	ClassDAO cdao = new ClassDAO();
	classVO cvo = cdao.selectNameOne(num);
	System.out.println("cvo : "+cvo);
	System.out.println("cvo 클래스 이름 : "+cvo.getName());
	System.out.println("cvo 클래스 번호 : "+cvo.getNum());
	
	
	ClassDAO classdao = new ClassDAO();
	
	String classNum = (String)request.getAttribute("classID");
	String noteNum = (String)request.getAttribute("noteID");
	String groupNum = classdao.getGroupNum(classNum);
	
	System.out.println(classNum+"//"+noteNum+"//"+groupNum);
	
	session.setAttribute("pyClassID", classNum);
	session.setAttribute("pyNoteID", noteNum);
	session.setAttribute("pyGroupID", groupNum);

%>
		<!-- 수정 실패 -->
		<c:if test="${requestScope.classUpdate==2 }">
			<script type="text/javascript">
				show()
				function show(){
					alert("Class수정 실패")
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
									<!-- 그룹에 권한이 있는 사람이 들어올 때만 편집과 노트 추가 가능 -->
									<%
										//class_grant테이블에 클래스번호와 로그인한 멤버번호를 넣고 있으면 버튼 생성
										if(session.getAttribute("email")!=null){
										String userEmail = (String)session.getAttribute("email");
									 	 int cnt = cdao.selectClassOne(userEmail,cvo.getNum());
										if(cnt>0){ 
									%>
										<p style="text-align: right;float: right;"> <a href="class_class_edit.jsp?classNum=<%=cvo.getNum() %>" class="button">Class수정 </a>&nbsp;<a href="class_note.jsp?classNum=<%=cvo.getNum() %>&groupName=<%=cvo.getGroup_name() %>&className=<%=cvo.getName() %>&nickname=<%=cvo.getMem_name() %>" class="button">노트 추가</a></p>
									<% 	}}	%> 
										<h1><%=cvo.getName() %></h1>
									</header>
									
									<div class="row"> 
									<div class="6u 12u$(small)"><table class="table1" style="float: left; width:100% !important">

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
												<h4>그룹 : </h4><%=cvo.getGroup_name() %><br>
												<h4>작성자 : </h4><%=cvo.getMem_name() %><br>
												<h4>분야 : </h4><%=cvo.getFavorite() %><br>
												<h4>작성날짜 : </h4><%=cvo.getSenddate() %><br>
											</td>
										</tr>
										<tr class="tr1">
											<td colspan = "2" class="td1">
											</td>
										</tr>
									</table></div>
									<div class="6u 12u$(small)"><i class="fa fa-search fa-2x" style="width:45px; height:45px"></i><h2 style="display:inline !important">Class의 단어</h2> 
									 <iframe src="python1.jsp" style="width: 100%; height: 470px;display:inline;"></iframe></div>
									</div>
									
								
									
									
									<p style="text-align: left;"><%=cvo.getClassPath() %></p>

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