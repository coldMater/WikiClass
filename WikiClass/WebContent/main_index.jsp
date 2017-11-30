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

/* ��Ʈ */ 
/*���� ���*/
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
		<%//�湮�� ī��Ʈ ����
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
			System.out.println("main_index�� ���� uri = " + req_uri);
		%>
		<!-- Header -->
		<div id="header">
			<!-- Inner -->
			<div class="inner">
				<table style='background-color: rgba(0, 0, 0, 0.5);'>
					<tr>
						<td><header>
							<h1 style="font-size: 6em;">
								<a href="main_index.jsp" id="logo"><img src="images/logo2.png" alt="�ΰ��Դϴ�" width="20%"/>WikiClass</a>
							</h1>
							<hr />
							<p>�츮���� ���� �Ϻ��� ��Ʈ, ��Ű Ŭ����</p>
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
						<li><a href="memberLogin.jsp?uri=<%=req_uri%>"><span>�α���</span></a></li>
						<li><a href="memberJoin.jsp?uri=<%=req_uri%>"><span>ȸ������</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="MyPage.jsp"><span>My page</span></a></li>
						<li><a href="logout?uri=<%=req_uri%>"><span>�α׾ƿ�</span></a></li>
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
               	  
                  <h3>���� �����: Webengers</h3>
                  <br>
               <ul class="divided" style="text-align: left;">
                  <li>����: ������ <span class="timestamp">"�ϰ� ���� �Ѹ���"</span></li>
                  <li>��� : �̸�ȣ <span class="timestamp">"�ϰ� ���� �Ѹ���"</span> </li>
                  <li>����: ������ <span class="timestamp">"�ϰ� ���� �Ѹ���"</span> </li>
                  <li>�м�&������: �����  <span class="timestamp">"�ϰ� ���� �Ѹ���"</span> </li>
                  <li>��ȹ&������: ������ <span class="timestamp">"�ϰ� ���� �Ѹ���"</span> </li>
                 
               </ul>
               </section>

               <!-- Posts -->
              <section class="4u 12u(mobile)"> <header>
                  <h3>����� ���</h3>
                  <br>
               <ul class="divided" style="text-align: left;">
                  <li>���α׷��� <span class="timestamp">Java,CSS,JTEL,Ajax</span> </li>
                  <li>���� <span class="timestamp">Tomcat,Linux,Oracle</span> </li>
                  <li>�м� <span class="timestamp">Python?</span> </li>
                  <li>������ <span class="timestamp">PhotoShop,Pencil</span> </li>
                  <li>��ȹ <span class="timestamp">Pencil,PPT,Evernote</span> </li>
                 
               </ul>
               </section>
               
                <!-- anyone -->
              <section class="4u 12u(mobile)"> <header>
                  <h3>������ ���� ����</h3>
                  <br>
               <ul class="divided" style="text-align: left;">
                  <li>���α׷��� <span class="timestamp">Java,CSS,JTEL,Ajax</span> </li>
                  <li>���� <span class="timestamp">Tomcat,Linux,Oracle</span> </li>
                  <li>�м� <span class="timestamp">Python?</span> </li>
                  <li>������ <span class="timestamp">PhotoShop,Pencil</span> </li>
                  <li>��ȹ <span class="timestamp">Pencil,PPT,Evernote</span> </li>
                 
               </ul>
               </section>
            </div>
            <hr />
            
            <div class="row">
               <div class="12u">

                  <!-- Contact -->
                  <section class="contact"> <header>
                  <h3>�����е��� ģ������ Wiki Class�� �ʴ��ϼ���!</h3>
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