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
	
			
	//관심 분야 가져오기
	String selectFavorite = mdao.selectFavoriteOnt(email);
	String[] favorite = null;
	if(mvo == null){
		System.out.println("MyPage.jsp에서  mvo가 null 입니다.");
		response.sendRedirect("main_index.jsp");
	}else if(selectFavorite != null){
		favorite = selectFavorite.split("_");
		for(int i=0 ; i<favorite.length ; i++){
			System.out.println("내가 선택한 분야 : "+favorite[i]);
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
					<h3>나의 정보</h3>
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
								<td>닉네임</td>
								<td>
									<span id="nicknamespan">${mvo.nickname }</span>
									<input type="text" id="nicknameinput" name="nicknameinput" value="${mvo.nickname }">
								</td>
								<td>
									<button onclick="nicknameUpdate1()" id="nicknamebt1">수정</button>
									<button onclick="nicknameUpdate2()" id="nicknamebt2">저장</button>
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>선택하게 만듬</td>
								<td><button>수정</button></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>선택하게 만든</td>
								<td><button>수정</button></td>
							</tr>

						</tbody>
					</table>
					</article>

					<article style="display : inline;"> 
						<header class="major">
							<h3>내가 속한 그룹</h3>
						</header>
						<iframe scrolling="auto" src="MyPage_groupList.jsp" style="height: 300px; width: 100%"></iframe>
					</article>
				</div>
				</section> 
				<table>
					<tr style="background-color: white;border:0px;">
						<td width="140px">
							<header class="major">
								<h3>관심 분야 </h3>
							</header>
						</td>
						<td>
							<a href="Interest.jsp" style="color:red;">설정하기</a>
						</td>
					</tr>
				</table>
				
				
				
				
				<div class="features" >
				
					<article id="fa0"> <span class="icon fa-magic"></span>
					<div class="content">
						<h3 id="co0">등록된 관심 분야가 없습니다.</h3>
						<p>설정하기로 관심분야를 등록해 주세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</div>
					
					</article> 
					
					<article id="fa1"> <span class="icon fa-magic"></span>
					<div class="content">
						<h3 id="co1">그래픽/디자인/멀티/미디어</h3>
						<p>그래픽  관련 프로그램을 이용, 시각적인 요소를 디자인 하는 분야입니다.<br>
               			해당 클래스 : 포토샵, 일러스트레이터 등 </p>
					</div>
					</article>



					<article id="fa2"> <span class="icon fa-file-code-o"></span>
					<div class="content">
						<h3 id="co2">프로그래밍 언어</h3>
						<p>객체 지향적인 프로그래밍 언어들이 다수 포함되어 있으며,<br>프로그램을 구동시키기 위한 알고리즘을 만드는 언어들을 다루는 분야입니다.<br>
                  		해당 클래스 : Java, Python 등 </p>
					</div>
					</article>


					<article id="fa3"> <span class="icon fa-share-alt"></span>
					<div class="content">
						<h3 id="co3">웹사이트</h3>
						<p>Web 페이지를 구현하기 위한 웹 언어들을 다루는 분야입니다.<br>
                 		해당 클래스 : HTML, Java script,CSS 등 </p>
					</div>
					</article>

					<article id="fa4"> <span class="icon fa-sun-o"></span>
					<div class="content">
						<h3 id="co4">컴퓨터 공학</h3>
						<p>컴퓨팅 학문, 즉 코딩, 아키텍쳐, 이론 전산학, 수학,인공지능 , 네트워크 등을 다루는 분야입니다.
                  		<br>단, 코딩에 대해서는 분야가 자세하고 접근성이 높은 분야이므로 별도 분야가 개설되어 있습니다.<br>
                 		해당 클래스 : 아키덱쳐, 네트워크, 전산학 등 </p>
					</div>
					</article>

					<article id="fa5"> <span class="icon fa-book"></span>
					<div class="content">
						<h3 id="co5">기타</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa6"> <span class="icon fa-tablet"></span>
					<div class="content">
						<h3 id="co6">모바일/태블릿/SNS</h3>
						 <p>안드로이드 프로그래밍을 이용하여 모바일, 즉 스마트폰에서 구동되는 것과 관련된 분야입니다.
                 		 <br>해당 클래스 : 아키덱쳐, 네트워크, 전산학 등 </p>
					</div>
					</article>

					<article id="fa7"> <span class="icon fa-child"></span>
					<div class="content">
						<h3 id="co7">컴퓨터 입문/활용</h3>
						<p>IT 분야에 갓 입문한 분들에 대한 실전 위주 팁, 익숙해진 분들을 위한 응용 분야입니다.
                  		<br>해당 클래스 : 파일 설정, 라이브러리 소개, 함수 지향형 언어  등 </p>
					</div>
					</article>



					<article id="fa8"> <span class="icon fa-gamepad"></span>
					<div class="content">
						<h3 id="co8">게임</h3>
						<p>컴퓨터를 이용한 게임과 관련된 것을 다루는 분야입니다.
                  		<br>해당 클래스 : 게임 엔진 , 개발 직군, 게임 장르 등 </p>
					</div>
					</article>


					<article id="fa9"> <span class="icon fa-briefcase"></span>
					<div class="content">
						<h3 id="co9">인터넷 비즈니스</h3>
						<p>데이터베이스의 개념과 구동하는 법 등 데이터의 특성에 대한 분야입니다.
                  		<br>해당 클래스 : SQL, Oracle, DB 설계 등 </p>
					</div>
					</article>


					<article id="fa10"> <span class="icon fa-database"></span>
					<div class="content">
						<h3 id="co10">OS/데이터베이스</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>


					<article id="fa11"> <span class="icon fa-folder-open"></span>
					<div class="content">
						<h3 id="co11">오피스 활용</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>

					<article id="fa12"> <span class="icon fa-shield"></span>
					<div class="content">
						<h3 id="co12">네트워크/해킹/보안</h3>
						<p>컴퓨터 간 통신을 통해 정보를 접근하는 법과 그것을 방어하는 법에 대한 분야입니다..
                 		<br>해당 클래스 : 해킹의 개념, 디버깅, 방어적 코딩 등 </p>
					</div>
					</article>


					<article id="fa13"> <span class="icon fa-android"></span>
					<div class="content">
						<h3 id="co13">모바일 프로그래밍</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
							dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
							lorem feugiat tempus aliquam.</p>
					</div>
					</article>
					
				</div>
				</section> <!-- my페이지 구성을위한 Sample Section 추가 --> </section>
				
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