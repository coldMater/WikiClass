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
		<title>class �����</title>
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
										<h1>Class �߰�</h1>
									</header>
								<form action="classInsert.do" method="post" enctype="multipart/form-data">
									<span class="image main" >
										<img src="images/classInsert.png" alt="" style="width: 23%; height: 300px"/><input type="file" name="img"  style="margin-left:31px;"></span>
									<table id="classtable">
										<tr>
											<!-- ���� �ο��� ����� ��� -->
											<!-- ���� �ο��� �г��� �Է� -->
											<td width="600px" >
												<input type="text" name="groupName" id="groupName" placeholder="�׷� �̸�">
												<p id="groupText" style="display: none"></p>
											</td>
											<td>
												<input type="button" onclick="groupSelectOne()" id="selectGroup" value="�׷�Ȯ��">
											</td>
										</tr>
										<tr>
											<td width="600px" >
												<input type="text" name="className" id="className" placeholder="Ŭ���� �̸�">
												<p id="classText" style="display: none"></p>
											</td>
											<td><!-- �׷�� Ŭ�������� ���� �ߺ����� ������ �ȴ�. -->
												<input type="button" onclick="groupclassSelectOne();personCheck(0)"  id="selectGroup" value="�ߺ�Ȯ��">
											</td>
										</tr>
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
									<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
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
			<h3>Ŭ���� �����</h3>
			- Ŭ���� �̸�, ����, �׷��� �������ָ� <br>&nbsp; &nbsp;Ŭ������ �����˴ϴ�.
			<hr style="border:1;">
			<h3>���� ���</h3>
			- Ŭ���������� ���� ����� �����մϴ�.<br>&nbsp;���������� ��Ʈ  �߰� �� ���� ������<br>&nbsp;�����մϴ�
			<hr>
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
						alert("�׷��� Ȯ�����ּ���")	
					}else if(!(classbool)){
						alert("Ŭ������ Ȯ�����ּ���")	
					}else if(!(boo)){
						alert("����ڸ� Ȯ�����ּ���")	
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
               				if(result=="��� ������ �׷� �Դϴ�."){
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
				//�׷��̸��� Ŭ���� �̸��� �ѱ� �Ŀ� Ŭ���� ���̺��� �ߺ��� ���� �ִ��� Ȯ��
				$.ajax({
          			url:"SerachClass",
          			data : "groupName="+new_groupInput.value+"&className="+new_classInput.value,
          			success : function(result){
          				new_classp.style.display="inline"
          				new_classp.innerHTML = result
               				if(result=="��� ���� �� class�Դϴ�."){
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
				new_input.placeholder = "����߰�(�г���)"
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
	          			data : "nickname="+new_input.value+"&groupname="+new_groupInput.value,
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
			
			</script>

	</body>
</html>