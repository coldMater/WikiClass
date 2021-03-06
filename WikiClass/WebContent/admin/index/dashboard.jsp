<%@page import="com.DAO.adminDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>WiKiClass ADM</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- 그래프 css -->
<style type="text/css">
.doughnut-legend {
	list-style: none;
	position: absolute;
	right: 8px;
	top: 0;
}

.doughnut-legend li {
	display: block;
	padding-left: 30px;
	position: relative;
	margin-bottom: 4px;
	border-radius: 5px;
	padding: 2px 8px 2px 28px;
	font-size: 14px;
	cursor: default;
	-webkit-transition: background-color 200ms ease-in-out;
	-moz-transition: background-color 200ms ease-in-out;
	-o-transition: background-color 200ms ease-in-out;
	transition: background-color 200ms ease-in-out;
}

.doughnut-legend li:hover {
	background-color: #fafafa;
}

.doughnut-legend li span {
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	width: 20px;
	height: 100%;
	border-radius: 5px;
}

.polararea-legend {
	list-style: none;
	position: absolute;
	right: 300px;
	top: 300px;
}

.polararea-legend li {
	display: block;
	padding-left: 30px;
	position: relative;
	margin-bottom: 4px;
	border-radius: 5px;
	padding: 2px 8px 2px 28px;
	font-size: 14px;
	cursor: default;
	-webkit-transition: background-color 200ms ease-in-out;
	-moz-transition: background-color 200ms ease-in-out;
	-o-transition: background-color 200ms ease-in-out;
	transition: background-color 200ms ease-in-out;
}

.polararea-legend li:hover {
	background-color: #fafafa;
}

.polararea-legend li span {
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	width: 20px;
	height: 100%;
	border-radius: 5px;
}
</style>

<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="../assets/css/material-dashboard.css?v=1.2.0"
	rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<<<<<<< HEAD
<!-- 차트생성을 위한 스크립트 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="../assets/js/Chart.min.js"></script>
<script src="../assets/js/Chart.StackedBar.js"></script>
<script src="../assets/js/Chart.LlineBar.js"></script>
=======
	<!-- 차트생성을 위한 스크립트 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script src="../assets/js/Chart.min.js"></script>
    <script src="../assets/js/Chart.StackedBar.js"></script>
    <script src="../assets/js/Chart.LlineBar.js"></script>
<style type="text/css">
#canvas2{
	color:white !important; 
}
>>>>>>> branch 'master' of https://github.com/coldMater/WikiClass.git

</style>
</head>

<body>

	<%
		adminDAO dao = new adminDAO();
		int num = 0;
		if (application.getAttribute("num") != null) {
			num = (Integer) application.getAttribute("num");
		} else {
			response.sendRedirect("../../main_index.jsp");
		}
	%>

	<div class="wrapper">
		<div class="sidebar" data-color="green"
			data-image="../assets/img/sidebar-1.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->

			<%@include file="logo.jsp"%>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="active"><a href="dashboard.jsp"> <i
							class="material-icons">assessment</i>
							<p>통계분석</p>
					</a></li>
					<li><a href="../../memberInfo"> <i class="material-icons">assignment_ind</i>
							<p>회원관리</p>
					</a></li>
					<li><a href="../../groupInfo"> <i class="material-icons">group</i>
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
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> Statistical Analysis -->
						WikiClass에서 수집된 데이터를 바탕으로 분석하여 그래프로 시각화합니다</a>


				</div>
				<div class="collapse navbar-collapse"></div>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange">
									<i class="material-icons">face</i>
								</div>
								<div class="card-content">
									<p class="category">Total Visit</p>
									<h3 class="title">
										<%=num%><small>명</small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">accessibility</i> <a>사이트를 방문한
											누적방문자 수입니다</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<i class="material-icons">done</i>
								</div>
								<div class="card-content">
									<p class="category">Total Member</p>
									<h3 class="title"><%=dao.getMemberNum()%><small>명</small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">perm_contact_calendar</i> WikiClass에
										등록한 총 가입자 수입니다
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="red">
									<i class="material-icons">speaker_group</i>
								</div>
								<div class="card-content">
									<p class="category">Total Group</p>
									<h3 class="title"><%=dao.getGroupNum()%><small>개</small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">group</i> WikiClass에 생성된 전체 그룹의 수
										입니다
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="blue">
									<i class="material-icons">note</i>
								</div>
								<div class="card-content">
									<p class="category">Total Document</p>
									<h3 class="title"><%=dao.getDocumentNum()%><small>개</small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">note_add</i>WikiClass에 생성된 전체 노트의 개수
										입니다
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart"
									data-background-color="green">

									<!-- 시간대별 누적 로그인 수 -->
									<div style="margin: 10px; , width: 60%">
										<canvas id="canvas1" width="470px"></canvas>
									</div>
									<script type="text/javascript">
										var randomScalingFactor = function() {
											return Math
													.round(Math.random() * 100)
										};
										var months = [ "January", "February",
												"March", "April", "May",
												"June", "July", "August",
												"September", "October",
												"November", "December" ];
										var lineChart = null;
										var lineChartData = {
											labels : [ "01~04시", "04~08시",
													"08~12시", "12~16시",
													"16~20시", "20~24시" ],
											datasets : [ {
												label : "My First dataset",
												fillColor : "rgba(220,220,220,0.2)",
												strokeColor : "rgba(220,220,220,1)",
												pointColor : "rgba(220,220,220,1)",
												pointStrokeColor : "#fff",
												pointHighlightFill : "#fff",
												pointHighlightStroke : "rgba(220,220,220,1)",
												/* 수치 입력 */
												data : [ 5, 6, 4, 7, 8, 3 ]

											} ]

										};

										$(function() {
											var ctx = document.getElementById(
													"canvas1").getContext("2d");
											lineChart = new Chart(ctx)
													.Line(
															lineChartData,
															{
																///Boolean - Whether grid lines are shown across the chart
																scaleShowGridLines : true,
																//String - Colour of the grid lines
																scaleGridLineColor : "rgba(0,0,0,0.05)",
																//Number - Width of the grid lines
																scaleGridLineWidth : 1,
																//Boolean - Whether the line is curved between points
																bezierCurve : true,
																//Number - Tension of the bezier curve between points
																bezierCurveTension : 0.4,
																//Boolean - Whether to show a dot for each point
																pointDot : true,
																//Number - Radius of each point dot in pixels
																pointDotRadius : 4,
																//Number - Pixel width of point dot stroke
																pointDotStrokeWidth : 1,
																//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
																pointHitDetectionRadius : 20,
																//Boolean - Whether to show a stroke for datasets
																datasetStroke : true,
																//Number - Pixel width of dataset stroke
																datasetStrokeWidth : 2,
																//Boolean - Whether to fill the dataset with a colour
																datasetFill : true,
																onAnimationProgress : function() {
																	console
																			.log("onAnimationProgress");
																},
																onAnimationComplete : function() {
																	console
																			.log("onAnimationComplete");
																}
															});
										});

										$("input#btnAdd")
												.on(
														"click",
														function() {
															lineChart
																	.addData(
																			[
																					randomScalingFactor(),
																					randomScalingFactor() ],
																			months[(lineChart.datasets[0].points.length) % 12]);
														});

										$("canvas")
												.on(
														"click",
														function(e) {
															var activePoints = lineChart
																	.getPointsAtEvent(e);
															console
																	.log(activePoints);

															for ( var i in activePoints) {
																console
																		.log(activePoints[i].value);
															}
														});
									</script>




								</div>
								<div class="card-content">
									<h4 class="title">시간대별 로그인 수 그래프</h4>
									<p class="category">사용자들의 활동이 가장 활발한 시간대를 확인하세요</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> 관리자페이지를 새로고침하면 실시간으로
										수치를 확인할 수 있습니다
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart"
									data-background-color="orange">
									<!-- 요일별 누적 로그인 수 -->

									<canvas id="canvas2" style="margin:10px" width="470px"></canvas>



									<script>
										
										var lineBarChartData2 = {
											labels : [ "월", "화", "수", "목", "금",
													"토", "일" ],
											datasets : [
													{
														type : "line",
														fillColor : "rgba(151,187,205,0)",
														strokeColor : "rgba(151,187,205,1)",
														pointColor : "rgba(151,187,205,1)",
														pointStrokeColor : "#fff",
														pointHighlightFill : "#fff",
														pointHighlightStroke : "rgba(151,187,205,1)",
														data : [
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor() ]
													},
													{
														fillColor : "rgba(220,220,220,0.5)",
														strokeColor : "rgba(220,220,220,0.8)",
														highlightFill : "rgba(220,220,220,0.75)",
														highlightStroke : "rgba(220,220,220,1)",
														data : [
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor() ]
													}

											]

										}

										var chart = null;
										$(function() {
											var ctx = document.getElementById(
													"canvas2").getContext("2d");
											chart = new Chart(ctx).LineBar(
													lineBarChartData2, {
														responsive : true
													});
										});
									</script>






								</div>
								<div class="card-content">
									<h4 class="title">요일별 로그인 수 그래프</h4>
									<p class="category">어떤 요일에 사용자들이 WikiClass를 활용하는지 알아보세요</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> DB에 저장된 데이터를 기준으로 출력
										합니다
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart" data-background-color="red">
									<!--월별 가입자 수 차트  -->


									<div style="margin-left: 10px; , width: 60%">
										<canvas id="canvas" width="470px"></canvas>
									</div>

									<script type="text/javascript">
										var randomScalingFactor = function() {
											return Math
													.round(Math.random() * 100)
										};
										var months = [ "January", "February",
												"March", "April", "May",
												"June", "July", "August",
												"September", "October",
												"November", "December" ];
										var barChart = null;
										var barChartData = {
											labels : [ "1월", "2월", "3월", "4월",
													"5월", "6월", "7월", "8월",
													"9월", "10월", "11월", "12월" ],
											datasets : [ {
												fillColor : "rgba(220,220,220,0.5)",
												strokeColor : "rgba(220,220,220,0.8)",
												highlightFill : "rgba(220,220,220,0.75)",
												highlightStroke : "rgba(220,220,220,1)",
												/* 여기에 그래프 값을 넣으면 됨  */
												data : [ 34, 24, 54, 65, 42,
														33, 66, 45, 21, 46, 97,
														25 ]
											}

											]

										};

										$(function() {
											var ctx = document.getElementById(
													"canvas").getContext("2d");
											barChart = new Chart(ctx)
													.StackedBar(
															barChartData,
															{
																//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
																scaleBeginAtZero : false,
																//Boolean - Whether grid lines are shown across the chart
																scaleShowGridLines : true,
																//String - Colour of the grid lines
																scaleGridLineColor : "rgba(0,0,0,0.05)",
																//Number - Width of the grid lines
																scaleGridLineWidth : 1,
																//Boolean - If there is a stroke on each bar
																barShowStroke : false,
																//Number - Pixel width of the bar stroke
																barStrokeWidth : 2,
																//Number - Spacing between each of the X value sets
																barValueSpacing : 5,
																//Number - Spacing between data sets within X values
																barDatasetSpacing : 1,
																onAnimationProgress : function() {
																	console
																			.log("onAnimationProgress");
																},
																onAnimationComplete : function() {
																	console
																			.log("onAnimationComplete");
																}
															});
										});

										$("input#btnAdd")
												.on(
														"click",
														function() {
															barChart
																	.addData(
																			[
																					randomScalingFactor(),
																					randomScalingFactor(),
																					randomScalingFactor() ],
																			months[(barChart.datasets[0].bars.length) % 12]);
														});

										$("canvas")
												.on(
														"click",
														function(e) {
															var activeBars = barChart
																	.getBarsAtEvent(e);
															console
																	.log(activeBars);

															for ( var i in activeBars) {
																console
																		.log(activeBars[i].value);
															}
														});
									</script>

								</div>
								<div class="card-content">
									<h4 class="title">월별 가입자 수 그래프</h4>
									<p class="category">마우스를 대면 정확한 수치를 볼 수 있습니다</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i>DB에 저장된 데이터로 산출합니다
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="purple">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<h4 class="title">분야별 클래스 수 그래프</h4>
											<p class="category">분야별 노트의 개수를 기준으로 합니다</p>
										</div>
									</div>
								</div>
								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="profile">
											<!--분야별 클래스 수 그래프생성  -->
											<canvas id="canvas4" height="300px" width="300px"></canvas>

											<script type="text/javascript">
												var randomScalingFactor = function() {
													return Math.round(Math
															.random() * 50)
												};
												var chartData = [
														{
															value : randomScalingFactor(),
															color : "#F7464A",
															highlight : "#FF5A5E",
															label : "게임"
														},
														{
															value : randomScalingFactor(),
															color : "#46BFBD",
															highlight : "#5AD3D1",
															label : "그래픽/디자인/멀티/미디어"
														},
														{
															value : randomScalingFactor(),
															color : "#FDB45C",
															highlight : "#FFC870",
															label : "네트워크/해킹/보안"
														},
														{
															value : randomScalingFactor(),
															color : "#A8F552",
															highlight : "#CBFF75",
															label : "모바일 프로그래밍"
														},
														{
															value : randomScalingFactor(),
															color : "#28B4B4",
															highlight : "#46D2D2",
															label : "모바일/태블릿/SNS"
														
														},
														{
															value : randomScalingFactor(),
															color : "#FF3CBB",
															highlight : "#FF6EED",
															label : "오피스 활용"
														
														},
														{
															value : randomScalingFactor(),
															color : "#FFB900",
															highlight : "#FFD700",
															label : "웹사이트"
														
														},
														{
															value : randomScalingFactor(),
															color : "#F59696",
															highlight : "#FFBEBE",
															label : "인터넷 비즈니스"
														
														},
														{
															value : randomScalingFactor(),
															color : "#FF5A5A",
															highlight : "#FF8C8C",
															label : "컴퓨터 공학"
														
														},
														{
															value : randomScalingFactor(),
															color : "#B75E5E",
															highlight : "#D26E6E",
															label : "OS/데이터베이스"
														
														},
														{
															value : randomScalingFactor(),
															color : "#EF8B47",
															highlight : "#F4A460",
															label : "컴퓨터 입문/활용"
														
														},
														{
															value : randomScalingFactor(),
															color : "#AD46E0",
															highlight : "#E782FF",
															label : "프로그래밍 언어"
														
														},
														{
															value : randomScalingFactor(),
															color : "#a828a8",
															highlight : "#da5ada",
															label : "기타"
														}

												];

												var chart = null;
												var canvas = null;
												var ctx = null;
												var legendHolder = null;
												var helpers = Chart.helpers;
												$(function() {
													canvas = document
															.getElementById("canvas4");
													legendHolder = document
															.createElement('div');
													ctx = canvas
															.getContext("2d");
													chart = new Chart(ctx)
															.PolarArea(
																	chartData,
																	{
																		scaleShowLabelBackdrop : true,
																		scaleBackdropColor : "rgba(255,255,255,0.75)",
																		scaleBeginAtZero : true,
																		scaleBackdropPaddingY : 2,
																		scaleBackdropPaddingX : 2,
																		scaleShowLine : true,
																		segmentShowStroke : true,
																		segmentStrokeColor : "#fff",
																		segmentStrokeWidth : 2,
																		animationSteps : 100,
																		animationEasing : "easeOutBounce",
																		animateRotate : true,
																		animateScale : false,
																		responsive : true,
																		onAnimationProgress : function() {
																			console
																					.log("onAnimationProgress");
																		},
																		onAnimationComplete : function() {
																			console
																					.log("onAnimationComplete");
																		}
																	});

													legendHolder.innerHTML = chart
															.generateLegend();
													helpers
															.each(
																	legendHolder.firstChild.childNodes,
																	function(
																			legendNode,
																			index) {
																		helpers
																				.addEvent(
																						legendNode,
																						'mouseover',
																						function() {
																							var activeSegment = chart.segments[index];
																							activeSegment
																									.save();
																							activeSegment.fillColor = activeSegment.highlightColor;
																							chart
																									.showTooltip([ activeSegment ]);
																							activeSegment
																									.restore();
																						});
																	});
													helpers
															.addEvent(
																	legendHolder.firstChild,
																	'mouseout',
																	function() {
																		chart
																				.draw();
																	});
													// 범례표시
													// canvas.parentNode.appendChild(legendHolder.firstChild); 
												});

												$("input#btnAdd")
														.on(
																"click",
																function() {
																	chart
																			.addData({
																				value : randomScalingFactor(),
																				color : "#B48EAD",
																				highlight : "#C69CBE",
																				label : "Purple"
																			});
																});

												$("input#btnPolar")
														.on(
																"click",
																function() {
																	chart
																			.destroy();
																	chart = new Chart(
																			ctx)
																			.PolarArea(
																					chartData,
																					{
																						segmentStrokeColor : "#000000",
																						animation : true,
																						responsive : true,
																					});
																});

												$("input#btnPie")
														.on(
																"click",
																function() {
																	chart
																			.destroy();
																	chart = new Chart(
																			ctx)
																			.Pie(
																					chartData,
																					{
																						animateScale : true,
																						animation : true,
																						responsive : true,
																					});
																});

												$("input#btnDoughnut")
														.on(
																"click",
																function() {
																	chart
																			.destroy();
																	chart = new Chart(
																			ctx)
																			.Doughnut(
																					chartData,
																					{
																						animateScale : true,
																						animation : true,
																						responsive : true,
																					});
																});

												$("canvas")
														.on(
																"click",
																function(e) {
																	var activePoints = chart
																			.getSegmentsAtEvent(e);
																	console
																			.log(activePoints);
																	for ( var i in activePoints) {
																		console
																				.log(activePoints[i].value);
																	}
																});
											</script>


										</div>
										<div class="tab-pane" id="messages">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes" checked>
																</label>
															</div>
														</td>
														<td>Flooded: One year later, assessing what was lost
															and what was found when a ravaging rain swept through
															metro Detroit</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Sign contract for "What are conference organizers
															afraid of?"</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="tab-pane" id="settings">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Lines From Great Russian Literature? Or E-mails
															From My Boss?</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes" checked>
																</label>
															</div>
														</td>
														<td>Flooded: One year later, assessing what was lost
															and what was found when a ravaging rain swept through
															metro Detroit</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="checkbox">
																<label> <input type="checkbox"
																	name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Sign contract for "What are conference organizers
															afraid of?"</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task"
																class="btn btn-primary btn-simple btn-xs">
																<i class="material-icons">edit</i>
															</button>
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="card">
								<div class="card-header" data-background-color="red">
									<h4 class="title">분야별 남,여 유저 활동량</h4>
									<p class="category">남 -> 파란막대 / 여 -> 분홍막대 / 꺽은선 -> 남,녀 및
										구분없음 총합</p>
								</div>
								<!--분야별 남여 유저별 활동량 그래프생성  -->
								<br>
								<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i
									style="margin-top: 5px" class="material-icons">insert_chart</i>
								<a style="font-size: 18px; color: black;">분야별로 남,녀가 활동하는
									클래스를 확인할 수 있습니다</a><br>
								<br>
								<canvas id="canvas5" height="200px" width="300px"></canvas>
								<br>
								<br>
								<br>
								<br>
								<div class="card-header" data-background-color="green">
									<i class="material-icons">label</i> <a style="font-size: 15px">남
										-> 파란막대</a><br> <i class="material-icons">label</i> <a
										style="font-size: 15px">여 -> 분홍막대</a><br> <i
										class="material-icons">label</i> <a style="font-size: 15px">꺽은선
										-> 남,녀 및 구분없음 총합</a><br>
								</div>
								<script>
									var randomScalingFactor = function() {
										return Math.round(Math.random() * 100)
									};

									var lineBarChartData = {
										labels : [ "게임", "그래픽/디자인/멀티/미디어",
												"네트워크/해킹/보안", "모바일 프로그래밍", "모바일/태블릿/SNS",
												"오피스 활용", "웹사이트" ,"인터넷 비즈니스","컴퓨터 공학","OS/데이터베이스",
												"컴퓨터 입문/활용","프로그래밍 언어","기타"],
										datasets : [
												{
													type : "line",
													fillColor : "rgba(52,66,19,0)",
													strokeColor : "rgba(52,66,19,1)",
													pointColor : "rgba(52,66,19,1)",
													pointStrokeColor : "#fff",
													pointHighlightFill : "#fff",
													pointHighlightStroke : "rgba(52,66,19,1)",
													data : [
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor() ]
												},
												{
													fillColor : "rgba(62,201,205,0.5)",
													strokeColor : "rgba(62,201,205,0.8)",
													highlightFill : "rgba(62,201,205,0.75)",
													highlightStroke : "rgba(62,201,205,1)",
													data : [
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor(),
														randomScalingFactor() ]
												},
												{
													fillColor : "rgba(219,129,203,0.5)",
													strokeColor : "rgba(219,129,203,0.8)",
													highlightFill : "rgba(219,129,203,0.75)",
													highlightStroke : "rgba(219,129,203,1)",
													data : [
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor(),
															randomScalingFactor() ]
												} ]

									}

									var chart = null;
									$(function() {
										var ctx = document.getElementById(
												"canvas5").getContext("2d");
										chart = new Chart(ctx).LineBar(
												lineBarChartData, {
													responsive : true
												});
									});
								</script>

							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
				<ul>
					<li><a href="http://knjas.or.kr"> WikiClass 바로가기 </a></li>
					<li><a href="http://knjas.or.kr/admin/index/dashboard.jsp">dashboard</a></li>
					<li><a href="http://knjas.or.kr/admin/index/member.jsp">member</a></li>
					<li><a href="http://knjas.or.kr/admin/index/group.jsp">group</a></li>
					<li><a href="http://knjas.or.kr/admin/index/document.jsp">document</a></li>

				</ul>
				</nav>
				<p class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					Made by Webvenger's Team<br> copyright @ by Webvenger's All
					Rights Reserved
				</p>
			</div>
			</footer>
		</div>
	</div>
</body>
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
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		// Javascript method's body can be found in assets/js/demos.js
		demo.initDashboardPageCharts();

	});
</script>

</html>