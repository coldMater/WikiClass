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
		<title>class �����</title>
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
										<h1>�׷� �����</h1>
									</header>
									<form action="groupInsert.do" method="post"><!-- groupInsert -->
										<table style="border:0px; background-color: white;" id="grouptable">
											<tr>
												<td>
													<input type="text" name="groupName" id="groupName" placeholder="�׷� �̸�" /><br>
													<p id="groupText"></p>
												</td>
												<td>
													<input type="button" onclick="groupSelectOne()" id="selectGroup" value="�ߺ�Ȯ��">
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<h3>�׷쿡 ���� ������ �������ּ���</h3>
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
													<input type="text" name="person" id="person0" value="" placeholder="��� �߰�(�г���)" onfocusout="personCheck(0)"/>
													<p id="personText0" style="height: 4px;"></p>
												</td>
												<td id="pe2">
													<input type="button"  id="personInsert" value="�߰�">
												</td>
											</tr>
										</table>
										<input type="submit" value="�׷츸���" id="groupInput">
										<input type="button" value="�׷츸���" id="groupInputB" onclick="alert('�߰��� ����ڸ� �ٽ� �ѹ��� Ȯ���� �ּ���')">
									</form>
								</section>

						</div>
					</div>

				<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">

			<!-- Menu -->
			<nav id="menu"> <header class="major">
			<h2>�׷��̶�?</h2>
			</header>
			- �׷� �������� ���� �� ȯ���մϴ�!<br>
			- �׷� ����� ���� �����а� ģ������<br>&nbsp; &nbsp;�ϳ��� �����ּ���!<br>
			<hr>
			<h3>�׷� �����</h3>
			- �׷��� �̸��� ������ ���� ��<br>&nbsp; &nbsp;�׷� ����� ��ư��  Ŭ���ϸ� &nbsp; &nbsp;<br>&nbsp; &nbsp;�׷��� �����˴ϴ�.
			<hr style="border:1;">
			<h3>�׷�� �ʴ��ϱ�</h3>
			- �ʴ��ϰ��� �ϴ� ����� �г��Ӹ� �Է��ϸ�<br>&nbsp;&nbsp;�� ����� �������� �߰��˴ϴ�.
			<hr>
			<h3>���ǻ���</h3>
			- ��� Ŭ������ ��������� �����˴ϴ�.<br>
			- ������ �׷��� Ȯ���ϰ� �ʹٸ� <br>&nbsp;&nbsp;My page���� Ȯ���ϼ���.<br>
			- ���к��� ����,��Ʈ ������ �׷���鿡��<br>&nbsp; ȥ���� ���߽�ų �� �ֽ��ϴ�.<br>
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
				
				//input submit Ÿ�� �Ⱥ��̰�
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
					new_input.placeholder = "����߰�(�г���)"
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
						$("#pe").append("<input type='text' placeholder='����߰�(�г���)' name='person' id='person"+num+"' onfocusout='personCheck("+num+")'>");
						$("#pe").append("<p id='personText"+num+"' style='height: 4px;'></p>");
						num+=1
					})
				})
				
				function personCheck(number){
					var new_p = document.getElementById("personText"+number)
					var new_input = document.getElementById("person"+number)
					var new_groupInput = document.getElementById("groupInput");
					
					//����߰� �κ� ���δ� Ȯ��
  					var boo = true;
					$.ajax({
	          			url:"SerachPerson",
	          			data : "nickname="+new_input.value,
	          			success : function(result){
	          					new_p.innerHTML = result
	               				if(result=="����ֽ��ϴ�."){
	               					new_p.innerHTML = ""
	               				}else if(result=="�������� �ʴ� ������Դϴ�."){
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
	               				if(result=="�׷��� �����մϴ�."){
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