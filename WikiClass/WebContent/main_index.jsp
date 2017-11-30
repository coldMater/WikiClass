<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<style>

/* 폰트 */ 
/*나눔 고딕*/
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.inner{
 font-family:'NanumGothicExtraBold';
}
div > p{
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
}
footer > a{
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
}
footer > a > span{
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
font-size: 130%;
}
div#header{
background-image: url("images/main1.jpg");
}
div#footer{
padding-top:48px; 
padding-bottom:48px; 
}
li span{
color:black;
font-family: 'Nanum Gothic', sans-serif;
font-weight:bold;
}
ul.divided > li{
margin-top: 16px !important;
padding-top: 16px !important;
}
ul.icons{
background-color:  !important;
}

	
</style>
<title>WikiClass</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body class="homepage">
	<div id="page-wrapper">
		<%//방문자 카운트 세기
		  if(application.getAttribute("num")==null){
		      application.setAttribute("num", 1);
		      
		   }else{
		      int num = (Integer)application.getAttribute("num");
		      num+= 1;
		      application.setAttribute("num", num);
		   
		   }
		/////////////////////////////////////////////////////////////
			String uri = request.getRequestURI();
			String path = request.getContextPath();
			String req_uri = uri.substring(path.length() + 1);
			System.out.println("main_index에 들어온 uri = " + req_uri);
		%>
		<!-- Header -->
		<div id="header">
			<!-- Inner -->
			<div class="inner">
				<table style='background-color: rgba(0, 0, 0, 0.5);'>
					<tr>
						<td><header>
							<h1 style="font-size: 6em;">
								<a href="main_index.jsp" id="logo"><img src="images/logo2.png" alt="로고입니다" width="20%"/>WikiClass</a>
							</h1>
							<hr />
							<p>우리들의 가장 완벽한 노트, 위키 클래스</p>
							<footer> <a href="class_index.jsp" class="button circled scrolly"><span>GO</span></a></footer>
							</header></td>
					</tr>
				</table>
			</div>

			<!-- Nav -->
			<nav id="nav">
			<ul>

				<li><a href="main_index.jsp"><span>Home</span></a></li>
				<c:choose>
					<c:when test="${empty sessionScope.email }">
						<li><a href="memberLogin.jsp?uri=<%=req_uri%>"><span>로그인</span></a></li>
						<li><a href="memberJoin.jsp?uri=<%=req_uri%>"><span>회원가입</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="MyPage.jsp"><span>My page</span></a></li>
						<li><a href="logout?uri=<%=req_uri%>"><span>로그아웃</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</nav>


		
		<!-- Footer -->
      <div id="footer">
         <div class="container">
            <div class="row">

               <!-- Tweets -->
               <section class="4u 12u(mobile)"> <header>
               	  
                  <h3>만든 사람들: Webengers</h3>
                  <br>
               <ul class="divided" style="text-align: left;">
                  <li>팀장: 박찬울 <span class="timestamp">"하고 싶은 한마디"</span></li>
                  <li>기술 : 이명호 <span class="timestamp">"하고 싶은 한마디"</span> </li>
                  <li>서버: 강준희 <span class="timestamp">"하고 싶은 한마디"</span> </li>
                  <li>분석&디자인: 박희망  <span class="timestamp">"하고 싶은 한마디"</span> </li>
                  <li>기획&디자인: 박태주 <span class="timestamp">"하고 싶은 한마디"</span> </li>
                 
               </ul>
               </section>

               <!-- Posts -->
              <section class="4u 12u(mobile)"> <header>
                  <h3>사용한 기술</h3>
                  <br>
               <ul class="divided" style="text-align: left;">
                  <li>프로그래밍 <span class="timestamp">Java,CSS,JTEL,Ajax</span> </li>
                  <li>서버 <span class="timestamp">Tomcat,Linux,Oracle</span> </li>
                  <li>분석 <span class="timestamp">Python?</span> </li>
                  <li>디자인 <span class="timestamp">PhotoShop,Pencil</span> </li>
                  <li>기획 <span class="timestamp">Pencil,PPT,Evernote</span> </li>
                 
               </ul>
               </section>
               
                <!-- anyone -->
              <section class="4u 12u(mobile)"> <header>
                  <h3>적당히 넣을 무언가</h3>
                  <br>
               <ul class="divided" style="text-align: left;">
                  <li>프로그래밍 <span class="timestamp">Java,CSS,JTEL,Ajax</span> </li>
                  <li>서버 <span class="timestamp">Tomcat,Linux,Oracle</span> </li>
                  <li>분석 <span class="timestamp">Python?</span> </li>
                  <li>디자인 <span class="timestamp">PhotoShop,Pencil</span> </li>
                  <li>기획 <span class="timestamp">Pencil,PPT,Evernote</span> </li>
                 
               </ul>
               </section>
            </div>
            <hr />
            
            <div class="row">
               <div class="12u">

                  <!-- Contact -->
                  <section class="contact"> <header>
                  <h3>여러분들의 친구들을 Wiki Class에 초대하세요!</h3>
                  <br>
                  <ul class="icons">
                     <li><a href="http://facebook.com" class=""><span class="label"><img style="width:100%"; src="images/facebook.png"></span></a></li>
                  </ul>
                  <ul class="icons">
                   <li><a href="http://dropbox.com" class=""><span class="label"><img style="width:100%"; src="images/dropbox.png"></span></a></li>
                  </ul>
                  <ul class="icons">
 					<li><a href="http://youtube.com" class=""><span class="label"><img style="width:100%"; src="images/youtube.png"></span></a></li>                  
 				</ul>
                  <ul class="icons">
                    <li><a href="http://google.com" class=""><span class="label"><img style="width:100%"; src="images/google-plus.png"></span></a></li>
                  </ul>
                  </header>
                  </section>

                  <!-- Copyright -->
                  <div class="copyright">
                     <ul class="menu">
                        <li>&copy; WikiClass. All rights reserved.</li>
                        <li>Design by Webengers</li>
                     </ul>
                  </div>

               </div>

            </div>
         </div>
      </div>

   </div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.onvisible.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>

	

	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
			
			             
</body>
</html>