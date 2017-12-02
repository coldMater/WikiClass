<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<style type="text/css">
header#header{

padding-top: 2em !important;
}
td{
	background-color: white;
}
table tbody tr{
	border:0px !important;
}
</style>
<title>Mypage �о� �߰�</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="class_assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<%@include file="class_header.jsp"%>

				<!-- Banner -->
				<br><h1>���� �о� �߰�</h1>
	<form action="mypageInsert.do">
		<table id="favortieTable">
			<tr>
				<td style="width: 300px;">
					<select name="favortie" id="favortie" style="width: 300px;">
						<option>-�о�-</option>
						<option>����</option>
						<option>�׷���/������/��Ƽ/�̵��</option>
						<option>��Ʈ��ũ/��ŷ/����</option>
						<option>����� ���α׷���</option>
						<option>�����/�º�/SNS</option>
						<option>���ǽ� Ȱ��</option>
						<option>������Ʈ</option>
						<option>���ͳ� ����Ͻ�</option>
						<option>��ǻ�� ����</option>
						<option>OS/�����ͺ��̽�</option>
						<option>��ǻ�� �Թ�/Ȱ��</option>
						<option>���α׷��� ���</option>
						<option>��Ÿ</option>
					</select>
				</td>
				<td>
					<input type="button" onclick="insertFavortie()" id="insertfavortie" value="�׸��߰�">
				</td>
			</tr>
		</table>	
		<input type="hidden" value="${sessionScope.email }" name="email" id="email">
		<input type="submit" value="����">
	</form>
				<p>���� �о� ���� �����ϸ�, �̸� ���� �ǽð� ��õ�� ���� favortie�׷��� �����˴ϴ�.</p>

				<!-- my������ ���������� Sample Section �߰� -->
				<section> </section>


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
	<script type="text/javascript">
		var tableTag = document.getElementById("favortieTable")
		var buttonTag = document.getElementById("insertfavortie")
		var selectTag = document.getElementById("favortie")
		
		function insertFavortie(){
			var new_td1 = document.createElement("td")
			var new_td2 = document.createElement("td")
			var new_tr = document.createElement("tr")
			new_select = document.createElement("select")
			
			
			new_select.id="favortie";
			new_select.name = "favortie";
			
			new_option = document.createElement("option")
			new_option.text="-�о�-"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="����"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="�׷���/������/��Ƽ/�̵��"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="��Ʈ��ũ/��ŷ/����"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="����� ���α׷���"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="�����/�º�/SNS"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="���ǽ� Ȱ��"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="������Ʈ"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="���ͳ� ����Ͻ�"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="��ǻ�� ����"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="OS/�����ͺ��̽�"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="��ǻ�� �Թ�/Ȱ��"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="���α׷��� ���"
			new_select.appendChild(new_option)
			new_option = document.createElement("option")
			new_option.text="��Ÿ"
			new_select.appendChild(new_option)
						
			new_td1.appendChild(new_select)
			new_td2.appendChild(buttonTag)
			new_tr.appendChild(new_td1)
			new_tr.appendChild(new_td2)
			tableTag.appendChild(new_tr)
			
		}
	
	
	
	</script>

</body>
</html>