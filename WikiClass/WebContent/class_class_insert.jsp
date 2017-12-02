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
h2{
margin: 0 0 1em 0 !important;
padding:  0 0.75em 0.2em 0 ;
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
									<span class="image main" >
										<img src="images/classInsert.png" alt="" style="width: 23%; height: 300px"/><input type="file" name="img"  style="margin-left:31px;"></span>
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
												<input type="button" onclick="groupclassSelectOne();personCheck(0)"  id="selectGroup" value="중복확인">
											</td>
										</tr>
										<tr>
											<td width="600px" >
												<select name="favortie" >
												<option>-분야-</option>
       											<option>게임</option>
       											<option>그래픽/디자인</option>
       											<option>네트워크/해킹/보안</option>
       											<option>모바일 프로그래밍</option>
       											<option>모바일/태블릿/SNS</option>
       											<option>오피스 활용</option>
       											<option>웹사이트</option>
       											<option>인터넷 비즈니스</option>
       											<option>OS/데이터베이스</option>
       											<option>컴퓨터 수험서</option>
       											<option>컴퓨터 입문/활용</option>
       											<option>프로그래밍 언어</option>
       											<option>기타</option>
       											</select>
											</td>
											<td></td>
										</tr>
										<tr>
											<td id="pe">
											<h3>권한 주기</h3>
											<%
												memberDAO mdao = new memberDAO();
												MemberVO mvo = mdao.emailselect((String)session.getAttribute("email"));
											%>
											<input type="hidden" name="person" value="<%=mvo.getNickname()%>">
											<!-- ajax로 클래스가 속한 그룹의 일원중에 1명인지 파악 안되면 경고창띄우고 안넘어가게 만든다. -->
											<input type="text" name="person" id="person0" placeholder="사람 추가(닉네임)" onfocusout="personCheck(0)" >
											<p id="personText0" style="height: 4px;"></p>
											</td>
											<td>
												<h3>&nbsp;</h3>
												<input type="button" id="personInsert" value="추가">
											</td>
										</tr>
									</table>
									<h2>Class의 간략한 내용을 적어주세요</h2>
									<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="submit" value="클래스생성" id="createClass"/>
									<input type="button" onclick="createC()" id="createClass2" value="클래스생성">
								</form>	
								</section>

						</div>
					</div>

			<!-- Search -->
	<div id="sidebar">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>클래스란?</h2>
			</header>
			- 클래스 페이지에 오신 걸 환영합니다!<br>
			- 이 페이지에서는 당신의 그룹 구성원들과<br>&nbsp; &nbsp;공유할 수 있는 클래스를 만들 수 있습니다.<br>
			- 클래스는 특정한 범주가 있는 카테고리입<br>&nbsp; &nbsp;니다. 만약 당신의 그룹이 하나의 반이라면,<br>&nbsp; &nbsp;클래스는 당신이 배우는 과목을 뜻합니다.<br>
			<hr>
			<h3>클래스 만들기</h3>
			- 클래스 이름, 설명, 그룹을 설정해주면 <br>&nbsp; &nbsp;클래스가 생성됩니다.
			<hr style="border:1;">
			<h3>목차 기능</h3>
			- 클래스에서는 목차 기능을 지원합니다.<br>&nbsp;목차에서는 노트  추가 및 목차 설정이<br>&nbsp;가능합니다
			<hr>
			<h3>주의사항</h3>
			- 클래스의 첫 페이지는 해당 클래스에 대한<br>&nbsp; &nbsp;소개로 작성해주시길 바랍니다.<br>
			- 세부적인 수정이 아닌, 큰 규모의 수정이거나 <br>&nbsp; &nbsp;목차 수정은 해당 클래스 관리자와 이야기 후<br>&nbsp; &nbsp;수정하시길 바랍니다.<br>
			- 무분별한 목차,노트 수정은 그룹원들에게<br>&nbsp; &nbsp;혼란을 가중시킬 수 있습니다.<br>
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
			var boo = false;
			var createClass = document.getElementById("createClass");
			var createClass2 = document.getElementById("createClass2");
			createClass.style.display="none"
			
			function createC(){
				if(groupbool && classbool && boo){
				}else{
					if(!(groupbool)){
						alert("그룹을 확인해주세요")	
					}else if(!(classbool)){
						alert("클래스를 확인해주세요")	
					}else if(!(boo)){
						alert("사용자를 확인해주세요")	
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
          				if(groupbool && classbool && boo){
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
          				if(groupbool && classbool && boo){
        					createClass.style.display="inline"	
        					createClass2.style.display="none"
        				}else{
        					createClass.style.display="none"	
        					createClass2.style.display="inline"
        				}
               			}
         			 });
			}
			
			
/* 			
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
			} */
			var num = 1;
			
			$(document).ready(function(){
				$("#personInsert").click(function(){
					$("#pe").append("<input type='text' placeholder='사람추가(닉네임)' name='person' id='person"+num+"' onfocusout='personCheck("+num+")'>");
					$("#pe").append("<p id='personText"+num+"' style='height: 4px;'></p>");
					num+=1
				})
			})
			
			function personCheck(number){
					var new_p = document.getElementById("personText"+number)
					var new_input = document.getElementById("person"+number)
					var new_groupInput = document.getElementById("groupInput");
					
					//그룹이름를 알 수 있다.
					var new_groupInput = document.getElementById("groupName");
					
					//사람추가 부분 전부다 확인
  					boo = true;
					$.ajax({
	          			url:"SerachClassPerson",
	          			data : "nickname="+new_input.value+"&groupname="+new_groupInput.value,
	          			success : function(result){
	          					new_p.innerHTML = result
	               				if(result=="비어있습니다."){
	               					new_p.innerHTML = ""
	               				}else if(result=="그룹에 존재하지 않는 사용자입니다."){
	               					new_p.style.color = "red"
	               				}else{
	               					new_p.style.color = "blue"
	               				} 
	          					
	          					
	          					for(var i=0 ; i<num ; i++){
	          						//input태그에 값이 있는지 확인
	          						var new_chickInput = document.getElementById("person"+i)
	          						var new_chickP = document.getElementById("personText"+i)
	          						//값이 있는것 중에서만 확인 후에 전부다 가능한 사람일 경우만 버튼 체인지
	          						if(new_chickInput.value!=""){
	          							if(new_chickP.style.color=="red"){
	          								boo = false;
	          							}
	          						}
	          					}
	          					
	          					
	          					
	          					if(!(boo)){
	          						createClass.style.display="none"
	          						createClass2.style.display="inline-block"
          						}else{
          							createClass.style.display="inline-block"
          							createClass2.style.display="none"
          						}
	          					
	               			}	
	         		 });
				}
			
			</script>

	</body>
</html>