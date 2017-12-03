<%@page import="com.VO.classVO"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="com.DAO.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
<style type="text/css">
body h1, h2, h3, h4, h5, h6, #createNote{
 font-family:'NanumGothicExtraBold' !important;
}

.fileName {display:inline-block;width:190px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
.btn_file {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		background-color: transparent;
		border-radius: 0.375em;
		border: 0;
		/* box-shadow: inset 0 0 0 2px #f56a6a;
		color: #f56a6a !important; */
		box-shadow: inset 0 0 0 2px #20C0FF;
		color: #20C0FF !important;
		
		cursor: pointer;
		display: inline-block;
		font-family: "Roboto Slab", serif;
		font-size: 0.8em;
		font-weight: 700;
		height: 3.5em;
		letter-spacing: 0.075em;
		line-height: 3.5em;
		padding: 0 2.25em;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
		font-family:'NanumGothicExtraBold' !important;
		foint-size : 1.5rem;
}
input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}

header#header{

padding-top: 2em !important;
}
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
		<title>class 수정</title>
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
		<!-- 클래스 번호를 받고 클래스에대한 정보를 가지고 온다. -->
		<%
		int classNum = Integer.parseInt(request.getParameter("classNum"));
		ClassDAO cdao = new ClassDAO();
		classVO cvo = cdao.selectNameOne(classNum);
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
										<span style="font-size: 3rem"><%=cvo.getName() %><b>Class 수정</b></span>
									</header>
								<!-- 클래스번호를 넘겨서 이미지 정보, 분야, 내용 업데이트 후 사람추가  -->	
								<form action="classUpdate.do" method="post" enctype="multipart/form-data">
									<span class="image main" >
										<img src="images/classInsert.png" alt="" style="width: 23%; height: 300px"/>
										
										
										<table>
											<tr>
												<td width="470px">
												
												<input type="text" class="fileName" readonly="readonly" style="width:400;">
											
												
												</td>
												<td><label for="uploadBtn" class="btn_file"><span class="icon fa-folder-open fa-2x">
											<input type="file" name="img" id="uploadBtn" class="uploadBtn"></td>
											</tr>
										</table>
											
										
										
										

										
										
										</table>
										
									</span>
<!-- 										
										
										<ul class="actions">
											<li><input type="file"  name="img"  style="margin-left:31px;"></li>
										</ul> -->
										
										
									<table id="classtable">
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
											<input type="hidden" name="classNum" value="<%=cvo.getNum() %>">
											<input type="hidden" name="className" value="<%=cvo.getName() %>">
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
									<textarea name="editor1" id="editor1" rows="10" cols="80"><%=cvo.getClassPath() %></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="submit" value="클래스수정" id="createClass"/>
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
			<h3>클래스 수정</h3>
			- 분야, 클래스에 대한 설명, 권한 추가를<br>&nbsp;&nbsp;할 수 있습니다.
			<hr style="border:1;">
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
			var boo = false;
			var createClass = document.getElementById("createClass");
			var createClass2 = document.getElementById("createClass2");
			createClass.style.display="none"
			
			function createC(){
				if(boo){
				}else{
					if(!(boo)){
						alert("사용자를 확인해주세요")	
					}
				}
			}
			
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
	          			data : "nickname="+new_input.value+"&groupname=<%=cvo.getGroup_name()%>",
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
			var uploadFile = $('.fileBox .uploadBtn');
			uploadFile.on('change', function(){
				if(window.FileReader){
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				$(this).siblings('.fileName').val(filename);
			});
			</script>

	</body>
</html>