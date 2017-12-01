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
	height: 800px !important;
}
img{
	outline: 0px !important;
}
td{
	background-color: white;
}
table tbody tr{
	border:0px !important;
}
</style>
		<title>class 만들기</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>
<%
request.setCharacterEncoding("EUC-KR");
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
										<h1>그룹 만들기</h1>
									</header>
									<form action="groupInsert.do" method="post"><!-- groupInsert -->
										<table style="border:0px; background-color: white;" id="grouptable">
											<tr>
												<td>
													<input type="text" name="groupName" id="groupName" placeholder="그룹 이름" /><br>
													<p id="groupText"></p>
												</td>
												<td>
													<input type="button" onclick="groupSelectOne()" id="selectGroup" value="중복확인">
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<h3>그룹에 대한 간략히 설명해주세요</h3>
													<textarea name="groupContent" id="groupContent" rows="10" cols="80"></textarea>
												</td>
											</tr>
											<tr>
												<td id="pe">
												<%
													memberDAO mdao = new memberDAO();
													MemberVO mvo = mdao.emailselect((String)session.getAttribute("email"));
													if(mvo==null){
														response.sendRedirect("main_index.jsp");
													}
												%>
													<input type="hidden" name="person" value="<%=mvo.getNickname()%>">
													<input type="text" name="person" id="person0" value="" placeholder="사람 추가(닉네임)" onfocusout="personCheck(0)"/>
													<p id="personText0" style="height: 4px;"></p>
												</td>
												<td id="pe2">
													<input type="button"  id="personInsert" value="추가">
												</td>
											</tr>
										</table>
										<input type="submit" value="그룹만들기" id="groupInput">
										<input type="button" value="그룹만들기" id="groupInputB" onclick="alert('추가할 사용자를 다시 한번더 확인해 주세요')">
									</form>
								</section>

						</div>
					</div>

				<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>그룹이란?</h2>
			</header>
			- 그룹 페이지에 오신 걸 환영합니다!<br>
			- 그룹 기능을 통해 여러분과 친구들을<br>&nbsp; &nbsp;하나로 묶어주세요!<br>
			<hr>
			<h3>그룹 만들기</h3>
			- 그룹의 이름과 설명을 쓰신 후<br>&nbsp; &nbsp;그룹 만들기 버튼을  클릭하면 &nbsp; &nbsp;<br>&nbsp; &nbsp;그룹이 생성됩니다.
			<hr style="border:1;">
			<h3>그룹원 초대하기</h3>
			- 초대하고자 하는 사람의 닉네임를 입력하면<br>&nbsp;&nbsp;그 사람이 구성원에 추가됩니다.
			<hr>
			<h3>유의사항</h3>
			- 모든 클래스는 구성원들과 공유됩니다.<br>
			- 본인의 그룹을 확인하고 싶다면 <br>&nbsp;&nbsp;My page에서 확인하세요.<br>
			- 무분별한 목차,노트 수정은 그룹원들에게<br>&nbsp; 혼란을 가중시킬 수 있습니다.<br>
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
				var tableTag = document.getElementById("grouptable")
				
				//input submit 타입 안보이게
				var buttonTag = document.getElementById("personInsert")
				
				var new_p = document.getElementById("personText")
				var new_input = document.getElementById("person")
				var num = 1;
				
				var new_groupInput = document.getElementById("groupInput")
				new_groupInput.style.display="none"
				var new_groupInputB = document.getElementById("groupInputB");
				
				
				/* function insertPerson(){
					var new_td1 = document.getElementById("pe2")
					var new_td2 = document.createElement("td")
					var new_tr = document.createElement("tr")
					new_input = document.createElement("input")
					new_p = document.createElement("p")
					
					new_p.id = "personText"
					new_input.type = "text"
					new_input.placeholder = "사람추가(닉네임)"
					new_input.name="person"
					new_input.id="person"
					new_input.onfocusout="personCheck()";
					new_input.addEventListener("focusout",personCheck())
			
					new_td1.appendChild(new_input)
					new_td1.appendChild(new_p)
					new_td1.appendChild(buttonTag)
					new_tr.appendChild(new_td1)
					new_tr.appendChild(new_td1)
					tableTag.appendChild(new_tr)
				} */
				
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
					
					//사람추가 부분 전부다 확인
  					var boo = true;
					$.ajax({
	          			url:"SerachPerson",
	          			data : "nickname="+new_input.value,
	          			success : function(result){
	          					new_p.innerHTML = result
	               				if(result=="비어있습니다."){
	               					new_p.innerHTML = ""
	               				}else if(result=="존재하지 않는 사용자입니다."){
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
	          						new_groupInput.style.display="none"
	              					new_groupInputB.style.display="inline-block"
          						}else{
          							new_groupInput.style.display="inline-block"
    	              				new_groupInputB.style.display="none"
          						}
	          					
	               			}	
	         		 });
				}
				
				function groupSelectOne(){
					var new_groupInput = document.getElementById("groupName");
					var new_groupp = document.getElementById("groupText");
					
					$.ajax({
	          			url:"SerachGroup",
	          			data : "name="+new_groupInput.value,
	          			success : function(result){
	          					new_groupp.innerHTML = result
	               				if(result=="그룹이 존재합니다."){
	               					new_groupp.style.color = "red"
	    
	               				}else{
	               					new_groupp.style.color = "blue"
	               				} 
	               			}
	         			 });
					
				}
				
			</script>
	</body>
</html>