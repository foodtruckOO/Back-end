<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Food4JO - Fresh, Overpowered, Omnivorous Dish!</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/backend/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value='/backend/vendor/metisMenu/metisMenu.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/backend/dist/css/sb-admin-2.css'/>" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value='/backend/vendor/morrisjs/morris.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/backend/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value='/backend/js/jquery.validate.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

</head>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="/backend/template/Top.jsp"/>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Food4jo의 통계</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	행사 일정 통계 - <span id="barGraph">6개월</span>
                            <div class="pull-right">
                            	<button id="left1"><i class="fa fa-arrow-left"></i></button>
                            	<button id="right1"><i class="fa fa-arrow-right"></i></button>
                            	<input type="hidden" id="termNum" value="0">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        	기간 선택
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a id='quarter'>3개월</a>
                                        </li>
                                        <li><a id='half'>6개월</a>
                                        </li>
                                        <li><a id='year'>1년</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-bar-chart1"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<span id="donutGraph">회원 및 트럭 통계</span>
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        	선택
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a id='all'>모든 회원 수</a>
                                        </li>
                                        <li><a id='seller'>지역별 트럭분포</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	매출액 통계 - <span id="lineGraph">일별</span>
                            <div class="pull-right">
                            	<div class="btn-group">
                                	<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    	기간 선택
                                    	<span class="caret"></span>
                                    </button>
                           			<ul class="dropdown-menu pull-right" role="menu">
                                        <li>
                                        	<a id='daily'>일별매출액</a>
                                        </li>
                                        <li>
                                        	<a id='weekly'>주간매출</a>
                                        </li>
                                        <li>
                                        	<a id='monthly'>월간매출</a>
                                        </li>
                        			</ul>
                        		</div>
                        	</div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-line-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           	평점그래프
	                        <div class="pull-right">
	                            <div class="btn-group">
	                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
	                                    	전체
	                                    	<span class="caret"></span>
	                                </button>
	                           		<ul class="dropdown-menu pull-right" role="menu">
	                           			<li>
		                                	<a class="truckName" id='truckall' title="전체">전체</a>
		                                </li>
	                           			<c:forEach var="truckName" items="${truckNames}">
		                                    <li>
		                                       	<a class="truckName" id='truckName' title="${truckName}">${truckName}</a>
		                                    </li>
	                                    </c:forEach>
	                        		</ul>
	                        	</div>
	                        </div>
                     	</div>
	                    <!-- /.panel-heading -->
	                    <div class="panel-body">
	                        <div id="morris-bar-chart2"></div>
                        <!-- /.panel-body -->
	                    </div>
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<c:url value='/backend/vendor/jquery/jquery.min.js'/>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/backend/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value='/backend/vendor/metisMenu/metisMenu.min.js'/>"></script>
    <!-- Morris Charts JavaScript -->
    <script src="<c:url value='/backend/vendor/raphael/raphael.min.js'/>"></script>
    <script src="<c:url value='/backend/vendor/morrisjs/morris.js'/>"></script>
    <script>
    $(function() {
    	////이 아래부터 첫번째 그래프 - 바 그래프
		$("#quarter, #half, #year").click(function(){
			var title = $(this).prop("id")=="quarter"?"3개월":$(this).prop("id")=="half"?"6개월":"1년";
			var term = $(this).prop("id")=="quarter"?'3':$(this).prop("id")=="half"?'6':'12';
			console.log("버튼클릭함");
			$.ajax({
				url:"<c:url value='/Back/Graph.do'/>",
				type:'post',
				dataType:'text',
				data:'term='+term,
				success:function(data){
					$("#barGraph").html(title);
					barChartEvent.setData(JSON.parse(data));
				},
				error:function(data){
					console.log("에러발생 : "+data);
				}
			});
		});
    	$("#left1, #right1").click(function(){
    		var eventtitle = $("#barGraph").html();
    		var eventterm = $("#barGraph").html()=="3개월"?'3':$("#barGraph").html()=="6개월"?'6':'12';
    		if($(this).prop("id")=="left1") $("#termNum").val(parseInt($("#termNum").val())-1);
    		else $("#termNum").val(parseInt($("#termNum").val())+1);
			$.ajax({
				url:"<c:url value='/Back/Graph.do'/>",
				type:'post',
				dataType:'text',
				data:'term='+eventterm+"&month="+$("#termNum").val(),
				success:function(data){					
					$("#barGraph").html(eventtitle);
					barChartEvent.setData(JSON.parse(data));
				},
				error:function(data){
					console.log("에러발생 : "+data);
				}
			});
		});	
//////////////////////////////////////////////////////////////////이 아래부터 2번째 그래프 - 도넛그래프	
		$("#seller, #all").click(function(){
			var usertitle = $(this).prop("id")=="seller"?"회원비율 통계":"지역별 트럭 분포 통계";
			$.ajax({
				url:"<c:url value='/Back/Graph.do'/>",
				type:'post',
				dataType:'text',
				data:'type='+$(this).prop("id"),
				success:function(data){
					$("button:eq(4)").html(usertitle);
					console.log("성공"+data);
					$("#donutGraph").html(usertitle);
					donutChart.setData(JSON.parse(data));
				},
				error:function(data){
					console.log("에러발생 : "+data);
				}
			});
		});
///////////////////////////////////////////////////////이 아래부터 3번쨰 그래프 - 라인 그래프
		$("#daily, #weekly, #monthly").click(function(){
			console.log("버튼클릭함");
			var moneytitle = $(this).prop("id")=="daily"?"일 단위":$(this).prop("id")=="weekly"?"주 단위":"월 단위";
			var term =  $(this).prop("id")=="daily"?"day":$(this).prop("id")=="weekly"?"week":"month";
			$.ajax({
				url:"<c:url value='/Back/Graph.do'/>",
				type:'post',
				dataType:'text',
				data:'revenue='+$(this).prop("id"),
				success:function(data){
					$("button:eq(5)").html(moneytitle);
					$("#lineGraph").html(moneytitle);
					lineChart.setData(JSON.parse(data));
				},
				error:function(data){
					console.log("에러발생 : "+data);
				}
			});
		});
//////////////////////////////////////////////////////이하 4번째그래프

 		$(".truckName").click(function(){
			var reviewtitle = $(this).html();
			var target = $(this).prop("title");
			console.log(reviewtitle);
			console.log(target);
			$.ajax({
				url:"<c:url value='/Back/Graph.do'/>",
				type:'post',
				dataType:'text',
				data:'truckName='+target,
				success:function(data){
					$("button:eq(6)").html(reviewtitle);
					console.log("성공"+data);
					barChartReview.setData(JSON.parse(data));
				},
				error:function(data){
					console.log("에러발생 : "+data);
				}
			});
		}); 
//////////////////////////그래프 선택메뉴 관련////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////그래프 데이터 관련/////////////////////////////////////
        
        var donutChart = Morris.Donut({
            element: 'morris-donut-chart',
            data: ${memberCounts},
            resize: true
        });

        var barChartEvent = Morris.Bar({
            element: 'morris-bar-chart1',
            data: ${eventData},
            xkey: 'period',
            ykeys: ['count'],
            labels: ['갯수'],
            barColors:['green'],
            hideHover: 'auto',
            resize: true
        });
        var barChartReview = Morris.Bar({
            element: 'morris-bar-chart2',
            data: ${ReviewData},
            xkey: 'name',
            ykeys: ['score'],
            labels: ['점수'],
            barColors:['#40aac2'],
            hideHover: 'auto',
            resize: true
        }); 
        var lineChart = Morris.Line({//이걸 매출액 버전으로 만들면 될것같긴하다.
        	element: 'morris-line-chart',
        	data: ${salesData},
        	xkey: '기간',
        	ykeys: ['매출액'],
        	labels: ['매출액']
    	});
        
    });
    </script>
    <!-- Custom Theme JavaScript -->
    <script src="<c:url value='/backend/dist/js/sb-admin-2.js'/>"></script>
	</body>
</html>