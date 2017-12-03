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
}s
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

header#header{

padding-top: 2em !important;
}
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
					<br><br>
						<div class="inner">
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
								
							<!-- 게시판 부분만 복사 -->
							<%-- 	<div style="text-align: center">
									
									
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
									</div>	 --%>
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
					location.href="class_class_index.jsp?start="+startTemp+"&count="+countTemp+"&pageCo="+pageCountTemp;
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
					location.href="class_class_index.jsp?start="+startTemp+"&count="+countTemp+"&pageCo="+pageCountTemp;
				}
			
			</script>
	</body>
</html>