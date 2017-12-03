<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="com.DAO.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>MyPage</title>
<meta charset="euc-kr" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="class_assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
header#header{

padding-top: 2em !important;
}
	article{
		width: 45% !important;
	}
	#wsection{
		width: 100% !important;
	}
</style>
</head>
<body>
<%
	String email = (String)session.getAttribute("email");
	memberDAO mdao = new memberDAO();
	MemberVO mvo = mdao.emailselect(email);
	request.setAttribute("mvo", mvo);
	
			
	//���� �о� ��������
	String selectFavorite = mdao.selectFavoriteOnt(email);
	String[] favorite = null;
	if(mvo == null){
		System.out.println("MyPage.jsp����  mvo�� null �Դϴ�.");
		response.sendRedirect("main_index.jsp");
	}else if(selectFavorite != null){
		favorite = selectFavorite.split("_");
		for(int i=0 ; i<favorite.length ; i++){
			System.out.println("���� ������ �о� : "+favorite[i]);
		}
	}
%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<%@include file="class_header.jsp"%>

				<!-- Banner -->

				<section id="banner"> <!-- Section --> <section id="wsection">

				<h1 style="display: block; margin-bottom: 1.5em">My page</h1>
				</span> <section>
				<div class="features">
					<article style="display : inline;"> <header class="major">
					<h3>���� ����</h3>
					</header>
					<table style="width: 80%;">
						<thead>
							<tr>
								<th>Name</th>
								<th>impormation</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>�г���</td>
								<td>
									<span id="nicknamespan">${mvo.nickname }</span>
									<input type="text" id="nicknameinput" name="nicknameinput" value="${mvo.nickname }">
								</td>
								<td>
									<button onclick="nicknameUpdate1()" id="nicknamebt1">����</button>
									<button onclick="nicknameUpdate2()" id="nicknamebt2">����</button>
								</td>
							</tr>
							<tr>
								<td>����</td>
								<td>�����ϰ� ����</td>
								<td><button>����</button></td>
							</tr>
							<tr>
								<td>����</td>
								<td>�����ϰ� ����</td>
								<td><button>����</button></td>
							</tr>

						</tbody>
					</table>
					</article>

					<article style="display : inline;"> 
						<header class="major">
							<h3>���� ���� �׷�</h3>
						</header>
						<iframe scrolling="auto" src="MyPage_groupList.jsp" style="height: 300px; width: 100%"></iframe>
					</article>
				</div>
				</section> 
				<table>
					<tr style="background-color: white;border:0px;">
						<td width="140px">
							<header class="major">
								<h3>���� �о� </h3>
							</header>
						</td>
						<td>
							<a href="Interest.jsp" style="color:red;">�����ϱ�</a>
						</td>
					</tr>
				</table>
				
				
				
				
				<div class="features" >
				
					<article id="fa0"> <span class="icon fa-magic"></span>
					<div class="content">
						<h3 id="co0">��ϵ� ���� �о߰� �����ϴ�.</h3>
						<p>�����ϱ�� ���ɺо߸� ����� �ּ���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</div>
					
					</article> 
					
					<article id="fa1"> <span class="icon fa-magic"></span>
					<div class="content">
						<h3 id="co1">�׷���/������/��Ƽ/�̵��</h3>
						<p>�׷���  ���� ���α׷��� �̿�, �ð����� ��Ҹ� ������ �ϴ� �о��Դϴ�.<br>
               			�ش� Ŭ���� : ���伥, �Ϸ���Ʈ������ �� </p>
					</div>
					</article>



					<article id="fa2"> <span class="icon fa-file-code-o"></span>
					<div class="content">
						<h3 id="co2">���α׷��� ���</h3>
						<p>��ü �������� ���α׷��� ������ �ټ� ���ԵǾ� ������,<br>���α׷��� ������Ű�� ���� �˰����� ����� ������ �ٷ�� �о��Դϴ�.<br>
                  		�ش� Ŭ���� : Java, Python �� </p>
					</div>
					</article>


					<article id="fa3"> <span class="icon fa-share-alt"></span>
					<div class="content">
						<h3 id="co3">������Ʈ</h3>
						<p>Web �������� �����ϱ� ���� �� ������ �ٷ�� �о��Դϴ�.<br>
                 		�ش� Ŭ���� : HTML, Java script,CSS �� </p>
					</div>
					</article>

					<article id="fa4"> <span class="icon fa-sun-o"></span>
					<div class="content">
						<h3 id="co4">��ǻ�� ����</h3>
						<p>��ǻ�� �й�, �� �ڵ�, ��Ű����, �̷� ������, ����,�ΰ����� , ��Ʈ��ũ ���� �ٷ�� �о��Դϴ�.
                  		<br>��, �ڵ��� ���ؼ��� �о߰� �ڼ��ϰ� ���ټ��� ���� �о��̹Ƿ� ���� �о߰� �����Ǿ� �ֽ��ϴ�.<br>
                 		�ش� Ŭ���� : ��Ű����, ��Ʈ��ũ, ������ �� </p>
					</div>
					</article>

					<article id="fa5"> <span class="icon fa-book"></span>
					<div class="content">
						<h3 id="co5">��Ÿ</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa6"> <span class="icon fa-tablet"></span>
					<div class="content">
						<h3 id="co6">�����/�º�/SNS</h3>
						 <p>�ȵ���̵� ���α׷����� �̿��Ͽ� �����, �� ����Ʈ������ �����Ǵ� �Ͱ� ���õ� �о��Դϴ�.
                 		 <br>�ش� Ŭ���� : ��Ű����, ��Ʈ��ũ, ������ �� </p>
					</div>
					</article>

					<article id="fa7"> <span class="icon fa-child"></span>
					<div class="content">
						<h3 id="co7">��ǻ�� �Թ�/Ȱ��</h3>
						<p>IT �о߿� �� �Թ��� �е鿡 ���� ���� ���� ��, �ͼ����� �е��� ���� ���� �о��Դϴ�.
                  		<br>�ش� Ŭ���� : ���� ����, ���̺귯�� �Ұ�, �Լ� ������ ���  �� </p>
					</div>
					</article>



					<article id="fa8"> <span class="icon fa-gamepad"></span>
					<div class="content">
						<h3 id="co8">����</h3>
						<p>��ǻ�͸� �̿��� ���Ӱ� ���õ� ���� �ٷ�� �о��Դϴ�.
                  		<br>�ش� Ŭ���� : ���� ���� , ���� ����, ���� �帣 �� </p>
					</div>
					</article>


					<article id="fa9"> <span class="icon fa-briefcase"></span>
					<div class="content">
						<h3 id="co9">���ͳ� ����Ͻ�</h3>
						<p>�����ͺ��̽��� ����� �����ϴ� �� �� �������� Ư���� ���� �о��Դϴ�.
                  		<br>�ش� Ŭ���� : SQL, Oracle, DB ���� �� </p>
					</div>
					</article>


					<article id="fa10"> <span class="icon fa-database"></span>
					<div class="content">
						<h3 id="co10">OS/�����ͺ��̽�</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa11"> <span class="icon fa-folder-open"></span>
					<div class="content">
						<h3 id="co11">���ǽ� Ȱ��</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa12"> <span class="icon fa-shield"></span>
					<div class="content">
						<h3 id="co12">��Ʈ��ũ/��ŷ/����</h3>
						<p>��ǻ�� �� ����� ���� ������ �����ϴ� ���� �װ��� ����ϴ� ���� ���� �о��Դϴ�..
                 		<br>�ش� Ŭ���� : ��ŷ�� ����, �����, ����� �ڵ� �� </p>
					</div>
					</article>


					<article id="fa13"> <span class="icon fa-android"></span>
					<div class="content">
						<h3 id="co13">����� ���α׷���</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>
					
				</div>
				</section> <!-- my������ ���������� Sample Section �߰� --> </section>
				
				<!-- Scripts -->
				<script src="class_assets/js/jquery.min.js"></script>
				<script src="class_assets/js/skel.min.js"></script>
				<script src="class_assets/js/util.js"></script>
				<script src="class_assets/js/main.js"></script>
				<script type="text/javascript">
				
					for(var i=1 ; i<=13 ; i++){
						var new_article = document.getElementById("fa"+i)
						new_article.style.display="none"
					}
				
					for(var i=1 ; i<=13 ; i++){
						var new_h3 = document.getElementById("co"+(i));
						<%
						if(favorite!=null){	
							for(int k=0 ; k < favorite.length ; k++){ %> 
							if(new_h3.innerHTML == "<%=favorite[k] %>"){ 
								var new_article = document.getElementById("fa"+i);
								new_article.style.display="flex";
								var new_fa0 = document.getElementById("fa0")
								new_fa0.style.display ="none"
							}
						<%	}
						}%>
					}	
				</script>
				<script type="text/javascript">
					var nicknameInput = document.getElementById("nicknameinput")	
					var nicknameSpan = document.getElementById("nicknamespan")	
					var nicknamebt1 = document.getElementById("nicknamebt1")
					var nicknamebt2 = document.getElementById("nicknamebt2")
					nicknameinput.style.display="none"
					nicknamebt2.style.display="none"
					
					function nicknameUpdate1(){
							nicknameinput.style.display="block"
							nicknameSpan.style.display="none"
							nicknamebt1.style.display="none"
							nicknamebt2.style.display="block"
						
							
						}
					
					function nicknameUpdate2(){
						nicknameinput.style.display="none"
						nicknameSpan.style.display="block"
						nicknamebt1.style.display="block"
						nicknamebt2.style.display="none"	
						
					}
					
				
				</script>
				
				
</body>
</html>