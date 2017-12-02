<%@page import="com.VO.groupSearchVO"%>
<%@page import="com.VO.classVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ClassDAO"%>
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
		<title>WikiClass</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="class_assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
div#main > div.inner >  section{
}
a.image{
width: 50%;
}
.posts article .image {
    display: inline;
}
h2{
  margin: 0.5em 0.7em 0.5em;
}
div > p {
    margin: 0.5em 0.7em 1em 1.3em;
}
ul {
   margin: 0 2em 0 1.3em;
}
ul.actions {
    cursor: default;
    list-style: none;
    /* padding-left: inherit; */
}

#selTep{
	box-sizing: border-box;
	display: flex;
    margin-top: 0;	
/*     -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px; */
    font-size: 14px;
    line-height: 1.42857143;
    border-bottom: 1px solid #ddd !important;
   /*  border-top: 1px solid #ddd !important; */
    margin-bottom: 10px;
    padding-left: 0;
    list-style: none;
}

#selTep li{
	float: left;
    margin-bottom: -1px;
    position: relative;
    display: block;
    box-sizing: border-box;
    text-align: -webkit-match-parent;
    font-size: 23px;
    line-height: 1.42857143;
    -webkit-margin-before: 1em;
    /* -webkit-margin-after: 1em; */
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    text-align: -webkit-match-parent;
}

#selTep li:active{
    display: list-item;
    text-align: -webkit-match-parent;
}

#selTep li a{
	color: #337ab7;
    text-decoration: none;
    position: relative;
    display: block;
    padding: 10px 15px;
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    background-color: transparent;
    float: left;
    margin-bottom: -1px;
    box-sizing: border-box;
}

#selTep li a:hover{
	color: #555;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
    text-decoration: none;
    outline: 0;
}
#selTep li a:active{
    outline: 0;
}
#selTep li a:focus {
	color: #23527c;
    text-decoration: underline;
}

}

</style>		
	</head>
	<body>
<%
	ClassDAO cdao = new ClassDAO();
	ArrayList<classVO> list = new ArrayList<classVO>(); 
	list = cdao.classSelectAll();
	
%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main" >
						<div class="inner">
							<!-- Header -->
							<%@include file="class_header.jsp" %> <!--  로그인/로그아웃 버튼 -->
							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
										<h1>Find your Class,<br/>Join your Group</h1>
										</header>
									</div>
									</span>
								</section>
		
								
								
									<ul type="disc" id="selTep" style="border-bottom: 1px solid #ddd;border-top: 1px solid #ddd;">
										<li class="sel1"><a onclick="classSel(1)">클래스</a></li>
										<li class="sel2"><a onclick="classSel(2)">그룹</a></li>
										<c:if test="${not empty sessionScope.email }">
											<li class="sel3"><a onclick="classSel(3)">생성하기</a></li>
										</c:if>
									</ul>
								
								<!-- 클래스 목록 Section -->
								<section style="padding:0px;border:0px;" id="sec1">
									<div class="posts">
									<%
									int count=1;
									if(request.getParameter("count")!=null){
										count = Integer.parseInt(request.getParameter("count"));
									}
									
									
									int pageCount6 = list.size()%54==0 ? list.size()/54-1 : list.size()/54;
									int pageCount6Temp = 0;
									if(request.getParameter("pageCo")!=null){
										pageCount6Temp = Integer.parseInt(request.getParameter("pageCo"));
									}
									
									int start=0;
									//int pageNum = 1;
									//값이 넘어오면 바뀌고 안넘어오면 start는 0
									int requestStrat = 0;
									if(request.getParameter("start")!=null){
										requestStrat = Integer.parseInt(request.getParameter("start"));
									}
									if(start < requestStrat){
										start = requestStrat;
									}
									int end=start+(pageCount6Temp*54)+8;
									
									if(list!=null){
										
										System.out.println(list.size());
										if(end >=list.size() ){
											end=list.size()-1;
										}
										
										System.out.println("클래스의 start / end / pageCount6Temp / list개수 : "+start+"/"+end+"/"+pageCount6Temp+"/"+list.size());
										
										for(int i=start+(pageCount6Temp*54) ; i<=end ; i++){ %>
											
											<article>
												<%
												System.out.println("출력되는 class i값 : "+i);
													/* request.setAttribute("className", list.get(0).getName()); */
												%>
												<div style="width: 50%;float: left;">
												<a href="NoteLoadingService?classNum=<%=list.get(i).getNum() %>" class="image"><img src="classImage/<%=list.get(i).getImgPath() %>" align="left" /></a>
												</div>
												<div style="width: 50%;float: left;">
												<br>
												<h2><%=list.get(i).getName() %></h2>
												<p>관리자 : <%=list.get(i).getMem_name() %><br><br>
												생성일:<%=list.get(i).getSenddate() %><br><br>
												그룹:<%=list.get(i).getGroup_name() %></p>
												<ul class="actions">
													<li><a href="NoteLoadingService?classNum=<%=list.get(i).getNum() %>" class="button"><p>More</p></a></li>
												</ul>
												</div>	
											</article>
										<%} 
									}%>
										
									</div>
									<div style="text-align: center">
									
									
									<ul class="pagination" style="margin-top: 40px; margin-bottom: 50px;">
										
										<li><input type="button" class="button disabled" id="bu1" value="Prev" onclick="cli(-1)"></li>
										<li><span id="sp1">&hellip;</span></li>
										<li id="p1"><input type="button" id="li1" onclick="acti(1)" value="<%=6*pageCount6Temp +1%>"></li>
										<li id="p2"><input type="button" id="li2" onclick="acti(2)" value="<%=6*pageCount6Temp +2%>"></li>
										<li id="p3"><input type="button" id="li3" onclick="acti(3)" value="<%=6*pageCount6Temp +3%>"></li>
										<li id="p4"><input type="button" id="li4" onclick="acti(4)" value="<%=6*pageCount6Temp +4%>"></li>
										<li id="p5"><input type="button" id="li5" onclick="acti(5)" value="<%=6*pageCount6Temp +5%>"></li>
										<li id="p6"><input type="button" id="li6" onclick="acti(6)" value="<%=6*pageCount6Temp +6%>"></li>
										<li><span id="sp2">&hellip;</span></li>
										<li><input type="button" class="button" id="bu2" value="Next" onclick="cli(1)"></li>
									</ul>
									</div>
								</section>

								
								<!-- 그룹 목록 Section -->
								<section style="padding:0px;border:0px;" id="sec2">
	<%
	//클래스를 가지고오는 리스트
	ArrayList<groupSearchVO> list2 = new ArrayList<groupSearchVO>(); 
	list2 = cdao.groupSelectAll();
%>
									<div class="posts">
									<%
									int count2=1;
									if(request.getParameter("count2")!=null){
										count2 = Integer.parseInt(request.getParameter("count2"));
									}
									
									
									int pageCount62 = list2.size()%54==0 ? list2.size()/54-1 : list2.size()/54;
									int pageCount62Temp = 0;
									if(request.getParameter("pageCo2")!=null){
										pageCount62Temp = Integer.parseInt(request.getParameter("pageCo2"));
									}
									
									
									int start2=0;
									//int pageNum = 1;
									//값이 넘어오면 바뀌고 안넘어오면 start는 0
									int requestStrat2 = 0;
									if(request.getParameter("start2")!=null){
										requestStrat2 = Integer.parseInt(request.getParameter("start2"));
									}
									if(start2 < requestStrat2){
										start2 = requestStrat2;
									}
									int end2=start2+(pageCount62Temp*54)+8;
									
									if(list2!=null){
										
										System.out.println("그룹 개수 : "+list2.size());
										if(end2 >=list2.size() ){
											end2=list2.size()-1;
										}
										
										System.out.println("그룸의 start2 / end2 / pageCount62Temp / list2개수 : "+start2+"/"+end2+"/"+pageCount62Temp+"/"+list2.size());
										
										for(int i=start2+(pageCount62Temp*54) ; i<=end2 ; i++){ %>
											<article>
												<%
												System.out.println("출력되는 class i값 : "+i);
													/* request.setAttribute("className", list.get(0).getName()); */
													
													//그룹에서 무엇을 보여줄지 추가
												%>
												<div style="width: 50%;float: left;">
													<h2><%=list2.get(i).getName() %></h2>
													<ul class="actions">
														<li><a href="group_print.jsp" class="button"><p>More</p></a></li>
													</ul>	
												</div>
												<div style="width: 50%;float: left;">
													<%
														
													%>
													<br><p><%=list2.get(i).getContent()%></p>
													<br><p>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십</p>
												</div>	
											</article>
										<%} 
									}%>
										
									</div>
									<div style="text-align: center">
									
									
									<ul class="pagination" style="margin-top: 40px; margin-bottom: 50px;">
										
										<li><input type="button" class="button disabled" id="bu3" value="Prev" onclick="cli2(-1)"></li>
										<li><span id="sp3">&hellip;</span></li>
										<li id="p7"><input type="button" id="li7" onclick="acti2(1)" value="<%=6*pageCount62Temp +1%>"></li>
										<li id="p8"><input type="button" id="li8" onclick="acti2(2)" value="<%=6*pageCount62Temp +2%>"></li>
										<li id="p9"><input type="button" id="li9" onclick="acti2(3)" value="<%=6*pageCount62Temp +3%>"></li>
										<li id="p10"><input type="button" id="li10" onclick="acti2(4)" value="<%=6*pageCount62Temp +4%>"></li>
										<li id="p11"><input type="button" id="li11" onclick="acti2(5)" value="<%=6*pageCount62Temp +5%>"></li>
										<li id="p12"><input type="button" id="li12" onclick="acti2(6)" value="<%=6*pageCount62Temp +6%>"></li>
										<li><span id="sp4">&hellip;</span></li>
										<li><input type="button" class="button" id="bu4" value="Next" onclick="cli2(1)"></li>
									</ul>
									</div>
								</section>

								
								<!-- 생성하기 Section -->
								<section style="padding:0px;border:0px;" id="sec3">
									<div class="posts">
										<article>
											<div style="width: 50%;float: left;">
											<a href="class_class_insert.jsp" class="image"><img src="images/classInsert.png" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											</div>	
										</article>
										<article>
											<div style="width: 50%;float: left;">
											<a href="class_group_insert.jsp" class="image"><img src="images/groupInsert.png" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											</div>	
										</article>
									</div>
								</section>
								
							
							
							
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
				
				//클래스 그룹 생성하기 버튼 누르면 동작
				var new_sec1 = document.getElementById("sec1");
				var new_sec2 = document.getElementById("sec2");
				var new_sec3 = document.getElementById("sec3");
				
				new_sec2.style.display = "none"
				new_sec3.style.display = "none"
				
				function classSel(number){
					if(number==1){
						new_sec1.style.display = "block"
						new_sec2.style.display = "none"
						new_sec3.style.display = "none"
					}else if(number==2){
						new_sec1.style.display = "none"
						new_sec2.style.display = "block"
						new_sec3.style.display = "none"
						
					}else if(number==3){
						new_sec1.style.display = "none"
						new_sec2.style.display = "none"
						new_sec3.style.display = "block"
					}
					
				}
				
			</script>
			
			<!-- 클래스 페이징 -->
			<script type="text/javascript">
				 
				 //count값으로 색 표시
				for(var i=1 ; i<=6 ; i++){
					var new_liNum = document.getElementById("li"+i)
					if(i==<%=count%>){
						new_liNum.className = "page active"
					}else{
						new_liNum.className = "page"
					}
				}
				
				//기준이 되는 번호 pageNum 찾는곳
				//page active를 찾아서 pageNum으로 설정\
				var pageNum = 1;
				for(var i=1 ; i<=6 ; i++){
					var new_li = document.getElementById("li"+i)
					if(new_li.className=="page active"){
						pageNum = i
					}
				}
					
				var pageCountTemp = <%=pageCount6Temp%>
				var countTemp = <%=count%>
				var startTemp = <%=start%>
				//alert("pageNum 기준이 되는 수 : "+pageNum)
				//클릭시 실행하는 함수 넘겨주는 값
				function acti(number){
					for(var i=1 ; i<=6 ; i++){
						var new_liNum = document.getElementById("li"+i)
						//alert(new_liNum.innerHTML)
						if(i==number){
							new_liNum.className = "page active"
						}else{
							new_liNum.className = "page"
						}
						//alert(pageNum+"/"+number)
						
					}
					countTemp = number
					startTemp = (<%=start/9%>+number-pageNum)*9
					//alert('countTemp/startTemp : '+countTemp+"/"+startTemp)
					location.href="class_index.jsp?start="+startTemp+"&count="+countTemp+"&pageCo="+pageCountTemp+"&sel=1";
				}
				
				
				//페이지 개수
				var listPage = <%=list.size()%9==0?list.size()/9 : list.size()/9+1 %>
				//pageCount6가 0이면 1~6페이지
				//보여주는 페이지 개수
				var printPage = listPage - <%=pageCount6Temp*6%>
				for(var i=1 ; i<=6 ; i++){
					var new_liP = document.getElementById("p"+i)
					if(i<=printPage){
						new_liP.style.display="inline"
					}else{
						new_liP.style.display="none"
					}
				}
				
				
				//pageCount6가 0이면 next를 보여주고 아니면 안보여줌
				//pageCount6가 0일때 (pageCount6+1)*54 > list.size() 이면 ...을 보여주고 Next활성화
				//pageCount6가 ?일때 (pageCount6>=1 이면 ...과 Prev활성화(button)
				//비활성화 button disabled
				var new_bu1 = document.getElementById("bu1")
				var new_bu2 = document.getElementById("bu2")
				var new_sp1 = document.getElementById("sp1")
				var new_sp2 = document.getElementById("sp2")
				
				new_sp1.style.display = "none";
				new_sp2.style.display = "none";
				
				
				if((pageCountTemp+1)*54 < <%=list.size()%> ){
					new_sp2.style.display = "inline";
					new_bu2.className = "button"
				}else{
					new_sp2.style.display = "none";
					new_bu2.className = "button disabled"
				}
				
				if(pageCountTemp>=1){
					new_sp1.style.display = "inline";
					new_bu1.className = "button"
				}else{
					new_sp1.style.display = "none";
					new_bu1.className = "button disabled"
				}
				
				//next나 prev누르면 페이지 넘기기
				function cli(number){
					pageCountTemp = pageCountTemp + number
					startTemp = 0
					countTemp = 1
					location.href="class_index.jsp?start="+startTemp+"&count="+countTemp+"&pageCo="+pageCountTemp+"&sel=1";
				}
			
			</script>
			
			<!-- 그룹 페이징 -->
			<script type="text/javascript">
				 
				 //count값으로 색 표시
				for(var i=7 ; i<=12 ; i++){
					var new_liNum = document.getElementById("li"+i)
					if((i-6)==<%=count2%>){
						new_liNum.className = "page active"
					}else{
						new_liNum.className = "page"
					}
				}
				
				//new_li1.className = "page active"
				
				//기준이 되는 번호 pageNum 찾는곳
				//page active를 찾아서 pageNum으로 설정\
				var pageNum2 = 7;
				for(var i=7 ; i<=12 ; i++){
					var new_li = document.getElementById("li"+i)
					if(new_li.className=="page active"){
						pageNum2 = (i-6)
					}
				}
					
				var pageCountTemp2 = <%=pageCount62Temp%>
				var countTemp2 = <%=count2%>
				var startTemp2 = <%=start2%>
				//alert("pageNum 기준이 되는 수 : "+pageNum)
				//클릭시 실행하는 함수 넘겨주는 값
				function acti2	(number){
					for(var i=7 ; i<=12 ; i++){
						var new_liNum = document.getElementById("li"+i)
						//alert(new_liNum.innerHTML)
						if(i==number){
							new_liNum.className = "page active"
						}else{
							new_liNum.className = "page"
						}
						//alert(pageNum+"/"+number)
						
					}
					//alert('pageNum2 : '+pageNum2)
					countTemp2 = number
					startTemp2 = (<%=start2/9%>+number-pageNum2)*9
					//alert('countTemp/startTemp : '+countTemp+"/"+startTemp)
					location.href="class_index.jsp?start2="+startTemp2+"&count2="+countTemp2+"&pageCo2="+pageCountTemp2+"&sel=2";
				}
				
				
				//페이지 개수
				var listPage2 = <%=list2.size()%9==0?list2.size()/9 : list2.size()/9+1 %>
				//pageCount6가 0이면 1~6페이지
				//보여주는 페이지 개수
				var printPage2 = listPage2 - <%=pageCount62Temp*6%>
				for(var i=7 ; i<=12 ; i++){
					var new_liP = document.getElementById("p"+i)
					if((i-6)<=printPage2){
						new_liP.style.display="inline"
					}else{
						new_liP.style.display="none"
					}
				}
				
				
				//pageCount6가 0이면 next를 보여주고 아니면 안보여줌
				//pageCount6가 0일때 (pageCount6+1)*54 > list.size() 이면 ...을 보여주고 Next활성화
				//pageCount6가 ?일때 (pageCount6>=1 이면 ...과 Prev활성화(button)
				//비활성화 button disabled
				var new_bu3 = document.getElementById("bu3")
				var new_bu4 = document.getElementById("bu4")
				var new_sp3 = document.getElementById("sp3")
				var new_sp4 = document.getElementById("sp4")
				
				new_sp3.style.display = "none";
				new_sp4.style.display = "none";
				
				
				if((pageCountTemp2+1)*54 < <%=list2.size()%> ){
					new_sp4.style.display = "inline";
					new_bu4.className = "button"
				}else{
					new_sp4.style.display = "none";
					new_bu4.className = "button disabled"
				}
				
				if(pageCountTemp2>=1){
					new_sp3.style.display = "inline";
					new_bu3.className = "button"
				}else{
					new_sp3.style.display = "none";
					new_bu3.className = "button disabled"
				}
				
				//next나 prev누르면 페이지 넘기기
				function cli2(number){
					pageCountTemp2 = pageCountTemp2 + number
					startTemp2 = 0
					countTemp2 = 1
					location.href="class_index.jsp?start2="+startTemp2+"&count2="+countTemp2+"&pageCo2="+pageCountTemp2+"&sel=2";
				}
				
			</script>
			
			<!-- url을 가지고와서 sel값을 확인 후에 클래스인지 그룹인지 확인후 띄어줌  -->
			<script type="text/javascript">
	
				var url = location.href;
			    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
			    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
			
			    //sel의 값이 받아와진다.
			    var varName = parameters[3].split('=')[1];
			   // alert("2 : "+varName)
		       
			    change(varName)
				function change(a) {
					var new_sec1 = document.getElementById("sec1");
					var new_sec2 = document.getElementById("sec2");
					var new_sec3 = document.getElementById("sec3");
					
					if(a==1){
						new_sec1.style.display = "block"
						new_sec2.style.display = "none"
						new_sec3.style.display = "none"
					}else if(a==2){
						new_sec1.style.display = "none"
						new_sec2.style.display = "block"
						new_sec3.style.display = "none"
					}
				}
			</script>
			
	</body>
</html>