<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Material Dashboard by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="../assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-color="orange" data-image="../assets/img/sidebar-1.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
           <%@include file="logo.jsp" %>
            <div class="sidebar-wrapper">
                <ul class="nav">
					<li><a href="dashboard.jsp"> <i class="material-icons">assessment</i>
							<p>통계분석</p>
					</a></li>
					<li><a href="../../memberInfo"> <i class="material-icons">assignment_ind</i>
							<p>회원관리</p>
					</a></li>
					<li class="active"><a href="../../groupInfo"> <i class="material-icons">group</i>
							<p>그룹관리</p>
					</a></li>
					<li><a href="../../noteInfo"> <i class="material-icons">work</i>
							<p>문서분석</p>
					</a></li>
				</ul>
            </div>
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> Group Management-->관리자가 그룹사용자들에게 공지할 수 있으며 관리자권한으로 그룹을 수정, 삭제 할 수 있습니다</a>
                    </div>
                    <div class="collapse navbar-collapse">
                       
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="orange">
                                    <h4 class="title">그룹관리</h4>
                                    <p class="category">그룹검색후 삭제버튼를 누르면 관리자 권한으로 그룹및 문서를 삭제합니다</p>
                                    <form action="../../groupSearch">
                                    <input type="text" name="search" style="color : black"> <input type="submit" value="그룹검색" style="color : black" >
                                    </form>
                                </div>
                                
                                <form action="">
                                <div class="card-content table-responsive">
                                    <table class="table">
                                        <thead class="text-primary">
                                            <th>그룹번호</th>
                                            <th>그룹이름</th>
                                            <th>그룹소개</th>
                                            <th>그룹에 속한 클래스</th>
                                            <th>그룹삭제</th>
                                        </thead>
                                        <tbody>
                                        
                                        <c:forEach items="${groupInfo}" var="i">
                                            <tr>
                                                <td>${i.num}</td>
                                                <td>${i.name }</td>
                                                <td>${i.content}</td>
                                                <td class="text-primary"><a href="../../ClassSearch?num=${i.num}" >클래스보기</a></td>
                                                <td class="text-primary"><a onclick="confirm('그룹을 삭제하시겠습니까? 그룹에 속한 클래스도 함께 삭제 됩니다')">그룹삭제</a></td>
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                </form>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="card-header" data-background-color="orange">
                                    <h4 class="title">그룹에 속한 클래스</h4>
                                    <p class="category">선택한 그룹의 클래스를 수정하거나 삭제할 수 있습니다</p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <th>그룹번호</th>
                                            <th>멤버 수</th>
                                            <th>문서번호</th>
                                            <th>문서이름</th>
                                            <th>분야</th>
                                            <th>이미지저장위치</th>
                                            <th>문서저장위치</th>
                                            <th>최종수정날짜</th>
                                        </thead>
                                        <tbody>
                                           <c:forEach items="${ClassSearch}" var="i">
                                            <tr>
                                                <td>${i.group_num}</td>
                                                <td>${i.mem_num}</td>
                                                <td>${i.num}</td>
                                                <td>${i.name}</td>
                                                <td>${i.favorite}</td>
                                                <td>${i.imagepath}</td>
                                                <td>${i.classpath}</td>
                                                <td class="text-primary">편집하기</td>
                                                <td class="text-primary"><a onclick="confirm('그룹을 삭제하시겠습니까? 그룹에 속한 클래스도 함께 삭제 됩니다')">문서삭제</a></td>
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                    </p>
                </div>
            </footer>
        </div>
    </div>
</body>

</script>
<!--   Core JS Files   -->
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="../assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="../assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>

</html>