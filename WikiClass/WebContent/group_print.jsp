<%@page import="java.util.ArrayList"%>
<%@page import="com.VO.groupSearchVO"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.classVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>노트 view</title>
		<link rel="stylesheet" href="font_adjust.css" />
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="class_assets/css/main.css?var=1" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<style type="text/css">
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
	//name : 클래스명
	/* String name = (String)request.getAttribute("className"); */
	int num = Integer.parseInt(request.getParameter("groupNum"));
	System.out.println("group_print에 넘어온 그룹 번호 : "+num);
	ClassDAO cdao = new ClassDAO();
	//그룹의 모든 정보를 받아온다.
	groupSearchVO gvo = cdao.selectGroupNameOne(num);
	System.out.println("gvo : "+gvo);
	System.out.println("gvo 클래스 이름 : "+gvo.getName());
	System.out.println("gvo 클래스 번호 : "+gvo.getNum());
	
%>

		<c:if test="${requestScope.groupUpdate==1 }">
			<script type="text/javascript">
				show()
				function show(){
					alert("Group편집을 완료 하였습니다.")
				}
			</script>
		</c:if>
		<c:if test="${requestScope.groupUpdate==2 }">
			<script type="text/javascript">
				show()
				function show(){
					alert("Group편집을 실패 하였습니다.")
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
										//그룹 작성자가 아니면 편집과 수정 불가
										//멤버 이메일로 닉네임 조회후 그룹에 속한 사람이면 누구나 편집과 추가 가능
										if(session.getAttribute("email")!=null){
											
											int cnt =  cdao.selectMemberGroupGrant((String)session.getAttribute("email"),gvo.getNum());
											System.out.println("group_print에서 나온 email/cnt 값 : "+(String)session.getAttribute("email")+"/"+cnt);
											if(cnt==1){
											%>
												<p style="text-align: right;float: right;"> <a href="class_group_edit.jsp?groupNum=<%=gvo.getNum() %>" class="button">편집 </a>&nbsp;<a href="class_class_insert.jsp?groupName=<%=gvo.getName() %>" class="button">클래스 추가</a></p>	
											<%} 	
										}%>
										<h1><i class="fa fa-users" aria-hidden="true" style="color:#20C0FF"></i><%=gvo.getName() %></h1>
									</header>
									<!-- 그룹 설명 출력 -->
									<h2>그룹 설명</h2>
									<p><%=gvo.getContent() %></p>
								</section>
								
								<!-- 관리자가 그룹 들어올 시 그룹에 속한 사람 출력 summary태그 이용 -->
								
								<!-- 그룹에 대한 클래스 보여주기 -->
								<%
									ArrayList<classVO> list = new ArrayList<classVO>(); 
									list = cdao.classSelectGroup(gvo.getNum());
									System.out.println("그룹에 대한 클래스 개수 : "+list.size());
								%>

								<!-- 클래스 목록 Section -->
								<h2 style="border-bottom: solid 3px #20C0FF;display:inline;">클래스 목록</h2>
								<section style="padding:0px;border:0px;margin-top:20px" id="sec1">
									<div class="posts">
									<% 	for(int i=0 ; i<list.size() ; i++){ %>
											<article>
												<%
												System.out.println("출력되는 class i값 : "+i);
													/* request.setAttribute("className", list.get(0).getName()); */
												%>
												<div style="width: 50%;float: left;">
												<a href="NoteLoadingService?classNum=<%=list.get(i).getNum() %>" class="image">
													<c:choose>
														<c:when test="<%=list.get(i).getImgPath()==null %>">
															<img src="classImage/Webvengers.jpg" align="left" />														
														</c:when>
														<c:otherwise>
															<img src="classImage/<%=list.get(i).getImgPath() %>" align="left" />
														</c:otherwise>
													</c:choose>
													
												</a>
												</div>
												<div style="width: 50%;float: left;">
												<br>
												<h2><%=list.get(i).getName() %></h2>
												<p>
													<b>관리자</b> : <%=list.get(i).getMem_name() %><br>
													<b>생성일</b>:<%=list.get(i).getSenddate() %><br>
												</p>
												<ul class="actions">
													<li><a href="NoteLoadingService?classNum=<%=list.get(i).getNum() %>" class="button"><p>More</p></a></li>
												</ul>
												</div>	
											</article>
										<%}%>
										
									</div>
								</section>


						</div>
					</div>

				<%-- <%@ include file="class_sidebar.jsp" %> --%>

			</div>

		<!-- Scripts -->
			<script src="class_assets/js/jquery.min.js"></script>
			<script src="class_assets/js/skel.min.js"></script>
			<script src="class_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="class_assets/js/main.js"></script>

	</body>
</html>