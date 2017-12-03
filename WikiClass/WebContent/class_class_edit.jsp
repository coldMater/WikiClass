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
		<title>class ����</title>
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
		<!-- Ŭ���� ��ȣ�� �ް� Ŭ���������� ������ ������ �´�. -->
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
										<span style="font-size: 3rem"><%=cvo.getName() %><b>Class ����</b></span>
									</header>
								<!-- Ŭ������ȣ�� �Ѱܼ� �̹��� ����, �о�, ���� ������Ʈ �� ����߰�  -->	
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
												<option>-�о�-</option>
       											<option>����</option>
       											<option>�׷���/������</option>
       											<option>��Ʈ��ũ/��ŷ/����</option>
       											<option>����� ���α׷���</option>
       											<option>�����/�º�/SNS</option>
       											<option>���ǽ� Ȱ��</option>
       											<option>������Ʈ</option>
       											<option>���ͳ� ����Ͻ�</option>
       											<option>OS/�����ͺ��̽�</option>
       											<option>��ǻ�� ���輭</option>
       											<option>��ǻ�� �Թ�/Ȱ��</option>
       											<option>���α׷��� ���</option>
       											<option>��Ÿ</option>
       											</select>
											</td>
											<td></td>
										</tr>
										<tr>
											<td id="pe">
											<h3>���� �ֱ�</h3>
											<%
												memberDAO mdao = new memberDAO();
												MemberVO mvo = mdao.emailselect((String)session.getAttribute("email"));
											%>
											<input type="hidden" name="classNum" value="<%=cvo.getNum() %>">
											<input type="hidden" name="className" value="<%=cvo.getName() %>">
											<input type="hidden" name="person" value="<%=mvo.getNickname()%>">
											<!-- ajax�� Ŭ������ ���� �׷��� �Ͽ��߿� 1������ �ľ� �ȵǸ� ���â���� �ȳѾ�� �����. -->
											<input type="text" name="person" id="person0" placeholder="��� �߰�(�г���)" onfocusout="personCheck(0)" >
											<p id="personText0" style="height: 4px;"></p>
											</td>
											<td>
												<h3>&nbsp;</h3>
												<input type="button" id="personInsert" value="�߰�">
											</td>
										</tr>
									</table>
									<h2>Class�� ������ ������ �����ּ���</h2>
									<textarea name="editor1" id="editor1" rows="10" cols="80"><%=cvo.getClassPath() %></textarea>
									<script>
										CKEDITOR.replace('editor1');
									</script>
									<input type="submit" value="Ŭ��������" id="createClass"/>
									<input type="button" onclick="createC()" id="createClass2" value="Ŭ��������">
								</form>	
								</section>

						</div>
					</div>

			<!-- Search -->
	<div id="sidebar">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>Ŭ������?</h2>
			</header>
			- Ŭ���� �������� ���� �� ȯ���մϴ�!<br>
			- �� ������������ ����� �׷� ���������<br>&nbsp; &nbsp;������ �� �ִ� Ŭ������ ���� �� �ֽ��ϴ�.<br>
			- Ŭ������ Ư���� ���ְ� �ִ� ī�װ���<br>&nbsp; &nbsp;�ϴ�. ���� ����� �׷��� �ϳ��� ���̶��,<br>&nbsp; &nbsp;Ŭ������ ����� ���� ������ ���մϴ�.<br>
			<hr>
			<h3>Ŭ���� ����</h3>
			- �о�, Ŭ������ ���� ����, ���� �߰���<br>&nbsp;&nbsp;�� �� �ֽ��ϴ�.
			<hr style="border:1;">
			<h3>���ǻ���</h3>
			- Ŭ������ ù �������� �ش� Ŭ������ ����<br>&nbsp; &nbsp;�Ұ��� �ۼ����ֽñ� �ٶ��ϴ�.<br>
			- �������� ������ �ƴ�, ū �Ը��� �����̰ų� <br>&nbsp; &nbsp;���� ������ �ش� Ŭ���� �����ڿ� �̾߱� ��<br>&nbsp; &nbsp;�����Ͻñ� �ٶ��ϴ�.<br>
			- ���к��� ����,��Ʈ ������ �׷���鿡��<br>&nbsp; &nbsp;ȥ���� ���߽�ų �� �ֽ��ϴ�.<br>
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
						alert("����ڸ� Ȯ�����ּ���")	
					}
				}
			}
			
			var num = 1;
			
			$(document).ready(function(){
				$("#personInsert").click(function(){
					$("#pe").append("<input type='text' placeholder='����߰�(�г���)' name='person' id='person"+num+"' onfocusout='personCheck("+num+")'>");
					$("#pe").append("<p id='personText"+num+"' style='height: 4px;'></p>");
					num+=1
				})
			})
			
			function personCheck(number){
					var new_p = document.getElementById("personText"+number)
					var new_input = document.getElementById("person"+number)
					var new_groupInput = document.getElementById("groupInput");
					
					//�׷��̸��� �� �� �ִ�.
					var new_groupInput = document.getElementById("groupName");
					
					//����߰� �κ� ���δ� Ȯ��
  					boo = true;
					$.ajax({
	          			url:"SerachClassPerson",
	          			data : "nickname="+new_input.value+"&groupname=<%=cvo.getGroup_name()%>",
	          			success : function(result){
	          					new_p.innerHTML = result
	               				if(result=="����ֽ��ϴ�."){
	               					new_p.innerHTML = ""
	               				}else if(result=="�׷쿡 �������� �ʴ� ������Դϴ�."){
	               					new_p.style.color = "red"
	               				}else{
	               					new_p.style.color = "blue"
	               				} 
	          					
	          					
	          					for(var i=0 ; i<num ; i++){
	          						//input�±׿� ���� �ִ��� Ȯ��
	          						var new_chickInput = document.getElementById("person"+i)
	          						var new_chickP = document.getElementById("personText"+i)
	          						//���� �ִ°� �߿����� Ȯ�� �Ŀ� ���δ� ������ ����� ��츸 ��ư ü����
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