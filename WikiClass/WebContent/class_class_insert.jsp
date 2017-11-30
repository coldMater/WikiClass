<%@page import="com.VO.MemberVO"%>
<%@page import="com.DAO.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
<style type="text/css">
#cke_1_contents{
	height: 400px !important;
}
img{
	outline: 0px !important;
}
td{
	background-color: white;
}
table tbody tr{
	border:0px solid black !important;
}
</style>
		<title>class 만들기</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="./ckeditor/ckeditor.js"></script>
		<link rel="stylesheet" href="./ckeditor/contents.css" />
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>

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
										<h1>Class 추가</h1>
									</header>
								<form action="classInsert.do" method="post" enctype="multipart/form-data">
									<span class="image main" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그룹 이미지 선택
										<br><img src="images/pic11.jpg" alt="" style="width: 17%; height: 300px" /><input type="file" name="img"></span>
									<table id="classtable">
										<tr>
											<!-- 권한 부여된 사람들 출력 -->
											<!-- 권한 부여할 닉네임 입력 -->
											<td width="600px" >
												<input type="text" name="groupName" id="groupName" placeholder="그룹 이름">
												<p id="groupText" style="display: none"></p>
											</td>
											<td>
												<input type="button" onclick="groupSelectOne()" id="selectGroup" value="그룹확인">
											</td>
										</tr>
										<tr>
											<td width="600px" >
												<input type="text" name="className" id="className" placeholder="클래스 이름">
												<p id="classText" style="display: none"></p>
											</td>
											<td><!-- 그룹과 클래스명이 같이 중복되지 않으면 된다. -->
												<input type="button" onclick="groupclassSelectOne()"  id="selectGroup" value="중복확인">
											</td>
										</tr>
										<tr>
											<td width="600px" >
												<select name="favortie" >
												<option>-분야-</option>
       											<option>게임</option>
       											<option>그래픽/디자인/멀티/미디어</option>
       											<option>네트워크/해킹/보안</option>
       											<option>모바일 프로그래밍</option>
       											<option>모바일/태블릿/SNS</option>
       											<option>오피스 활용</option>
       											<option>웹사이트</option>
       											<option>인터넷 비즈니스</option>
       											<option>컴퓨터 공학</option>
       											<option>컴퓨터 수험서</option>
       											<option>컴퓨터 입문/활용</option>
       											<option>프로그래밍 언어</option>
       											<option>OS/데이터베이스</option>
       											</select>
											</td>
											<td></td>
										</tr>
										<tr>
											<td>
											<h3>권한 주기</h3>
											<%
												memberDAO mdao = new memberDAO();
												MemberVO mvo = mdao.emailselect((String)session.getAttribute("email"));
											%>
											<input type="hidden" name="person" value="<%=mvo.getNickname()%>">
											<input type="text" name="person" id="person" value="" placeholder="사람 추가(닉네임)" onfocusout="personCheck()"/>
												<p id="personText" style="display: none"></p>
											</td>
											<td>
												<h3>&nbsp;</h3>
												<input type="button" onclick="insertPerson()" id="personInsert" value="추가">
											</td>
										</tr>
									</table>
									<h2>Class의 간략한 내용을 적어주세요</h2>
									<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="submit" value="클래스만들기" id="createClass"/>
									<input type="button" onclick="createC()" id="createClass2" value="클래스추가">
								</form>	
								</section>

						</div>
					</div>

			<!-- Search -->
	<div id="sidebar">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>클래스 설명</h2>
			</header>
			그룹에 대한 설명이 간략하게 필요합니다.<br>
			어떤 태그가 어떻게 이루어지는지 설명
			
			<br><br>
			모든 조건이 만족했을 때 클래스를 만들 수 있는 버튼이 활성화 됩니다.
			</nav>

		</div>
	</div>
			</div>

		<!-- Scripts -->
			<script src="class_assets/js/jquery.min.js"></script>
			<script src="class_assets/js/skel.min.js"></script>
			<script src="class_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="class_assets/js/main.js"></script>
			
			<script type="text/javascript">
			var groupbool = false;
			var classbool = false;
			var createClass = document.getElementById("createClass");
			var createClass2 = document.getElementById("createClass2");
			createClass.style.display="none"
			
			function createC(){
				if(groupbool && classbool){
				}else{
					if(!(groupbool)){
						alert("그룹을 확인해주세요")	
					}else if(!(classbool)){
						alert("클래스를 확인해주세요")	
					}
				}
			}
			
			function groupSelectOne(){
				var new_groupInput = document.getElementById("groupName");
				var new_groupp = document.getElementById("groupText");
				
				
				$.ajax({
          			url:"SerachGroup2",
          			data : "name="+new_groupInput.value,
          			success : function(result){
          				new_groupp.style.display="inline"
               				if(result=="사용 가능한 그룹 입니다."){
               					new_groupp.innerHTML = result
               					new_groupp.style.color = "blue"
               					groupbool = true;
               				}else{
               					var r = result
               					var new_a = document.createElement("a")
               					var new_txt = document.createTextNode(r);
               					new_groupp.innerHTML = ""
               					new_a.appendChild(new_txt)
               					new_a.href = "class_group_insert.jsp"
               					new_a.style.color = "red"
               					new_groupp.appendChild(new_a)
               					groupbool = false;
               				}
          				if(groupbool && classbool){
        					createClass.style.display="inline"	
        					createClass2.style.display="none"
        				}else{
        					createClass.style.display="none"	
        					createClass2.style.display="inline"
        				}
               			}
         			 });
				
			}
			
			function groupclassSelectOne(){
				var new_groupInput = document.getElementById("groupName");
				var new_classInput = document.getElementById("className");
				var new_classp = document.getElementById("classText");
				//그룹이름과 클래스 이름을 넘긴 후에 클래스 테이블에서 중복된 값이 있는지 확인
				$.ajax({
          			url:"SerachClass",
          			data : "groupName="+new_groupInput.value+"&className="+new_classInput.value,
          			success : function(result){
          				new_classp.style.display="inline"
          				new_classp.innerHTML = result
               				if(result=="사용 가능 한 class입니다."){
               					new_classp.style.color = "blue"
               					classbool = true;
               				}else{
               					new_classp.style.color = "red"
               					classbool = false;
               				}
          				if(groupbool && classbool){
        					createClass.style.display="inline"	
        					createClass2.style.display="none"
        				}else{
        					createClass.style.display="none"	
        					createClass2.style.display="inline"
        				}
               			}
         			 });
			}
			
			var tableTag = document.getElementById("classtable")
			var new_p = document.getElementById("personText")
			var new_input = document.getElementById("person")
			var buttonTag = document.getElementById("personInsert")
			
			function insertPerson(){
				var new_td1 = document.createElement("td")
				var new_td2 = document.createElement("td")
				var new_tr = document.createElement("tr")
				new_input = document.createElement("input")
				new_p = document.createElement("p")
				
				new_p.id = "personText"
				new_input.type = "text"
				new_input.placeholder = "사람추가(닉네임)"
				new_input.name="person"
				new_input.id="person"
		
				new_td1.appendChild(new_input)
				new_td1.appendChild(new_p)
				new_td2.appendChild(buttonTag)
				new_tr.appendChild(new_td1)
				new_tr.appendChild(new_td2)
				tableTag.appendChild(new_tr)
			}
			</script>

	</body>
</html>