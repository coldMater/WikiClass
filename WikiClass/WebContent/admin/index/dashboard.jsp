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
	<!-- ��Ʈ������ ���� ��ũ��Ʈ -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script src="../assets/js/Chart.min.js"></script>
    <script src="../assets/js/Chart.StackedBar.js"></script>
    <script src="../assets/js/Chart.LlineBar.js"></script>

</head>

<body>

<% adminDAO dao = new adminDAO(); 
int num = 0;
if(application.getAttribute("num")!=null){
	num = (Integer)application.getAttribute("num");
}else{
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
					<li class="active"><a href="dashboard.jsp"> <i class="material-icons">assessment</i>
							<p>���м�</p>
					</a></li>
					<li><a href="../../memberInfo"> <i class="material-icons">assignment_ind</i>
							<p>ȸ������</p>
					</a></li>
					<li><a href="../../groupInfo"> <i class="material-icons">group</i>
							<p>�׷����</p>
					</a></li>
					<li><a href="../../noteInfo"> <i class="material-icons">work</i>
							<p>�����м�</p>
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
					<a class="navbar-brand" href="#"> Statistical Analysis -->  WikiClass���� ������ �����͸� �������� �м��Ͽ� �׷����� �ð�ȭ�մϴ�</a>
				
				
				</div>
				<div class="collapse navbar-collapse">
				</div>
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
										 <%=num %><small>��</small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">accessibility</i> 
										<a>����Ʈ�� �湮�� �����湮�� ���Դϴ�</a>
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
									<h3 class="title"><%=dao.getMemberNum() %><small>��</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">perm_contact_calendar</i> WikiClass�� ����� �� ������ ���Դϴ�
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
									<h3 class="title"><%=dao.getGroupNum() %><small>��</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">group</i> WikiClass�� ������ ��ü �׷��� �� �Դϴ�
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
									<h3 class="title"><%=dao.getDocumentNum() %><small>��</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">note_add</i>WikiClass�� ������ ��ü ��Ʈ�� ���� �Դϴ�
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
									
									<!-- �ð��뺰 ���� �α��� �� -->
									<div style="margin:10px;,width: 60%">
		<canvas id="canvas1" width="470px"></canvas>
	</div>
	<script type="text/javascript">
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
		var lineChart = null;
		var lineChartData = {
			labels : ["01~04��","04~08��","08~12��","12~16��","16~20��","20~24��"],
			datasets : [
				{   
					label: "My First dataset",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)", 
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					/* ��ġ �Է� */
					data : [5,6,4,7,8,3]
				
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas1").getContext("2d");
			lineChart = new Chart(ctx).Line(lineChartData, {
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
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			lineChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(lineChart.datasets[0].points.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activePoints = lineChart.getPointsAtEvent(e);
			console.log(activePoints);

			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});

	</script>
									
									
									
									
								</div>
								<div class="card-content">
									<h4 class="title">�ð��뺰 �α��� �� �׷���</h4>
									<p class="category">
										����ڵ��� Ȱ���� ���� Ȱ���� �ð��븦 Ȯ���ϼ���
									</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> �������������� ���ΰ�ħ�ϸ� �ǽð����� ��ġ�� Ȯ���� �� �ֽ��ϴ�
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart"
									data-background-color="orange">
									<!-- ���Ϻ� ���� �α��� �� -->
										<div>
		<canvas id="canvas2" style="margin:10px" width="470px"></canvas>
	</div>


<script>
var randomScalingFactor = function(){ return Math.round(Math.random()*100)};

var lineBarChartData = {
	labels : ["��","ȭ","��","��","��","��","��"],
	datasets : [
		{
			type: "line",
			fillColor : "rgba(151,187,205,0)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(151,187,205,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		},
		{
			fillColor : "rgba(220,220,220,0.5)",
			strokeColor : "rgba(220,220,220,0.8)",
			highlightFill: "rgba(220,220,220,0.75)",
			highlightStroke: "rgba(220,220,220,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		}
		
	]

}

var chart = null;
$(function() {
	var ctx = document.getElementById("canvas2").getContext("2d");
	chart = new Chart(ctx).LineBar(lineBarChartData, {
		responsive : true
	});
});
</script>
									





								</div>
								<div class="card-content">
									<h4 class="title">���Ϻ� �α��� �� �׷���</h4>
									<p class="category">� ���Ͽ� ����ڵ��� WikiClass�� Ȱ���ϴ��� �˾ƺ�����</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> DB�� ����� �����͸� �������� ��� �մϴ�
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart" data-background-color="red">
									<!--���� ������ �� ��Ʈ  -->
									
									
									 <div style="margin-left: 10px;, width: 60%">
        <canvas  id="canvas"  width="470px"></canvas>
    </div>

    <script type="text/javascript">
        var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
        var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
        var barChart = null;
        var barChartData = {
            labels : ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    /* ���⿡ �׷��� ���� ������ ��  */
                    data : [34,24,54,65,42,33,66,45,21,46,97,25]
                }
             
            ]

        };

        $(function() {
            var ctx = document.getElementById("canvas").getContext("2d");
            barChart = new Chart(ctx).StackedBar(barChartData, {
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
                onAnimationProgress: function() {
                    console.log("onAnimationProgress");
                },
                onAnimationComplete: function() {
                    console.log("onAnimationComplete");
                }
            });
        });

        $("input#btnAdd").on("click", function() {
            barChart.addData(
                [randomScalingFactor(),randomScalingFactor(),randomScalingFactor()], 
                months[(barChart.datasets[0].bars.length)%12]
            );
        });

        $("canvas").on("click", function(e) {
            var activeBars = barChart.getBarsAtEvent(e);
            console.log(activeBars);

            for(var i in activeBars) {
                console.log(activeBars[i].value);
            }
        });

    </script>
									
									
									
									
									
									
								</div>
								<div class="card-content">
									<h4 class="title">���� ������ �� �׷���</h4>
									<p class="category">���콺�� ��� ��Ȯ�� ��ġ�� �� �� �ֽ��ϴ�</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i>DB�� ����� �����ͷ� �����մϴ�
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
											<span class="nav-tabs-title">�����ڸ޸���</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active"><a href="#profile" data-toggle="tab">
														<i class="material-icons">event_note</i> �����ڰ� �ʿ��� ������ �޸��մϴ�
														<div class="ripple-container"></div>
												</a></li>
												
											</ul>
										</div>
									</div>
								</div>
								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="profile">
											<table class="table">
												<tbody>
													
												
													<tr>
														<td>
															
														</td>
																											
														<td> sdfsdf</td>
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
																	name="optionsCheckboxes">
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
																	name="optionsCheckboxes" checked>
																</label>
															</div>
														</td>
														<td>Create 4 Invisible User Experiences you Never
															Knew About</td>
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
								<div class="card-header" data-background-color="orange">
									<h4 class="title">Employees Stats</h4>
									<p class="category">New employees on 15th September, 2016</p>
								</div>
								<div class="card-content table-responsive">
									<table class="table table-hover">
										<thead class="text-warning">
											<th>ID</th>
											<th>Name</th>
											<th>Salary</th>
											<th>Country</th>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Dakota Rice</td>
												<td>$36,738</td>
												<td>Niger</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Minerva Hooper</td>
												<td>$23,789</td>
												<td>Curaao</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Sage Rodriguez</td>
												<td>$56,142</td>
												<td>Netherlands</td>
											</tr>
											<tr>
												<td>4</td>
												<td>Philip Chaney</td>
												<td>$38,735</td>
												<td>Korea, South</td>
											</tr>
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
					<li><a href="#"> Home </a></li>
					<li><a href="#"> Company </a></li>
					<li><a href="#"> Portfolio </a></li>
					<li><a href="#"> Blog </a></li>
				</ul>
				</nav>
				<p class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					<a href="http://www.creative-tim.com">Creative Tim</a>, made with
					love for a better web
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