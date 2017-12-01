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
							<%@include file="class_header.jsp" %> <!--  �α���/�α׾ƿ� ��ư -->
							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
										<h1>Find your Class,<br/>Join your Group</h1>
										</header>
									</div>
									</span>
								</section>
		
								<!-- ��� Section -->
								<section>
									<div class="posts">
									<%-- <c:if test="${not empty sessionScope.email }">
										<article>
											<div style="width: 50%;float: left;">
											<a href="class_class_insert.jsp" class="image"><img src="images/classInsert.png" align="left" /></a>
											</div>
											<div style="width: 50%;float: left;">
											<br>
											</div>	
										</article>
									</c:if> --%>
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
									//���� �Ѿ���� �ٲ�� �ȳѾ���� start�� 0
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
										if(end+(pageCount6Temp*54) >=list.size() ){
											end=list.size()-1;
										}
										
										System.out.println("start / end / pageCount6Temp / list���� : "+start+"/"+end+"/"+pageCount6Temp+"/"+list.size());
										
										for(int i=start+(pageCount6Temp*54) ; i<=end ; i++){ %>
											<article>
												<%
												System.out.println("��µǴ� class i�� : "+i);
													/* request.setAttribute("className", list.get(0).getName()); */
												%>
												<div style="width: 50%;float: left;">
												<a href="NoteLoadingService?classNum=<%=list.get(i).getNum() %>" class="image"><img src="classImage/<%=list.get(i).getImgPath() %>" align="left" /></a>
												</div>
												<div style="width: 50%;float: left;">
												<br>
												<h2><%=list.get(i).getName() %></h2>
												<p>������ : <%=list.get(i).getMem_name() %><br><br>
												������:<%=list.get(i).getSenddate() %><br><br>
												�׷�:<%=list.get(i).getGroup_name() %></p>
												<ul class="actions">
													<li><a href="NoteLoadingService?classNum=<%=list.get(i).getNum() %>" class="button"><p>More</p></a></li>
												</ul>
												</div>	
											</article>
										<%} 
									}%>
										
									</div>
									<div style="text-align: center">
									
									
									<ul class="pagination">
									<%
										
										//list/9���� �������� �ִٴ� ǥ��
										
										
										//System.out.println("������ �Ǵ¹�ȣ pageNum : "+ pageNum);
										//int pageStart = (start-pageCount6*54)/9+1;
									%>
										<%-- <li><span id="sp1" class="button disabled">Prev</span></li>
										<li><span>&hellip;</span></li>
										<li><a href="class_index.jsp?start=<%=(start/9+1-pageNum)*9 %>" id="li1" class="page active" onclick="acti(1)"><%=6*pageCount6 +1%></a></li>
										<li><a href="class_index.jsp?start=<%=(start/9+2-pageNum)*9 %>" id="li2" class="page" onclick="acti(2)"><%=6*pageCount6 +2 %></a></li>
										<li><a href="class_index.jsp?start=<%=(start/9+3-pageNum)*9 %>" id="li3" class="page"><%=6*pageCount6 +3 %></a></li>
										<li><a href="class_index.jsp?start=<%=(start/9+4-pageNum)*9 %>" id="li4" class="page"><%=6*pageCount6 +4 %></a></li>
										<li><a href="class_index.jsp?start=<%=(start/9+5-pageNum)*9 %>" id="li5" class="page"><%=6*pageCount6 +5 %></a></li>
										<li><a href="class_index.jsp?start=<%=(start/9+6-pageNum)*9 %>" id="li6" class="page"><%=6*pageCount6 +6 %></a></li>
										<li><span id="sp2">&hellip;</span></li>
										<li><a href="#" class="button">Next</a></li> --%>
										
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
				/* var new_li1 = document.getElementById("li1")
				var new_li2 = document.getElementById("li2")
				var new_li3 = document.getElementById("li3")
				var new_li4 = document.getElementById("li4")
				var new_li5 = document.getElementById("li5")
				var new_li6 = document.getElementById("li6")
				 */
				 
				 //count������ �� ǥ��
				for(var i=1 ; i<=6 ; i++){
					var new_liNum = document.getElementById("li"+i)
					if(i==<%=count%>){
						new_liNum.className = "page active"
					}else{
						new_liNum.className = "page"
					}
				}
				
				//new_li1.className = "page active"
				
				//������ �Ǵ� ��ȣ pageNum ã�°�
				//page active�� ã�Ƽ� pageNum���� ����\
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
				//alert("pageNum ������ �Ǵ� �� : "+pageNum)
				//Ŭ���� �����ϴ� �Լ� �Ѱ��ִ� ��
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
					location.href="class_index.jsp?start="+startTemp+"&count="+countTemp+"&pageCo="+pageCountTemp;
				}
				
				
				//������ ����
				var listPage = <%=list.size()%9==0?list.size()/9 : list.size()/9+1 %>
				//pageCount6�� 0�̸� 1~6������
				//�����ִ� ������ ����
				var printPage = listPage - <%=pageCount6Temp*6%>
				for(var i=1 ; i<=6 ; i++){
					var new_liP = document.getElementById("p"+i)
					if(i<=printPage){
						new_liP.style.display="inline"
					}else{
						new_liP.style.display="none"
					}
				}
				
				
				//pageCount6�� 0�̸� next�� �����ְ� �ƴϸ� �Ⱥ�����
				//pageCount6�� 0�϶� (pageCount6+1)*54 > list.size() �̸� ...�� �����ְ� NextȰ��ȭ
				//pageCount6�� ?�϶� (pageCount6>=1 �̸� ...�� PrevȰ��ȭ(button)
				//��Ȱ��ȭ button disabled
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
				
				//next�� prev������ ������ �ѱ��
				function cli(number){
					pageCountTemp = pageCountTemp + number
					startTemp = 0
					countTemp = 1
					location.href="class_index.jsp?start="+startTemp+"&count="+countTemp+"&pageCo="+pageCountTemp;
				}
				
			
			</script>
	</body>
</html>