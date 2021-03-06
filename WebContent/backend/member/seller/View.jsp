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

    <title>Food4JO - Fresh, Overpowered, Omnivorous, Delicious한 음식의 세계로</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/backend/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value='/backend/vendor/metisMenu/metisMenu.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/backend/dist/css/sb-admin-2.css'/>" rel="stylesheet">
	<!-- datepicker용 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />

    <!-- Custom Fonts -->
    <link href="<c:url value='/backend/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="<c:url value='/backend/js/jquery.validate.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
function deleteOK(no){
	if(confirm('정말로 삭제하시겠습니까?')){
		location.href="<c:url value='/Back/EventDelete.do?no="+no+"'/>";
	}
}
function editOK(no){
	location.href="<c:url value='/Back/EventEdit.do?no="+no+"'/>";
}
</script>
<style>
	.ui-datepicker-trigger{
		position:relative;
		width:30px;
		height:20px;
		top:10px;
	}
</style>
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <jsp:include page="/backend/template/Top.jsp"/>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">사장 게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	사장 게시판 내용
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <table width="100%" class="table table-striped table-bordered table-hover">
                                	<tr>
                                		<td width="20%">작성자</td>
                                		<td width="80%">${selBoard.sname}</td>
                                	</tr>
                                	<tr>
                                		<td>제목</td>
                                		<td>${selBoard.title}</td>
                                	</tr>
                                	<tr>
                                		<td>내용</td>
                                		<td>${selBoard.content}</td>
                                	</tr>
                                	<tr>
                                		<td>작성일자</td>
                                		<td>${selBoard.postdate}</td>
                                	</tr>
                                </table>
                                <!-- /.col-lg-6 (nested) -->
                       </div>
		                    <button onclick="editOK(${selBoard.sb_no})" class="btn btn-info">수정</button>
		                    <button onclick="deleteOK(${selBoard.sb_no})" class="btn btn-danger">삭제</button>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/backend/vendor/bootstrap/js/bootstrap.min.js'/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value='/backend/vendor/metisMenu/metisMenu.min.js'/>"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value='/backend/dist/js/sb-admin-2.js'/>"></script>
</body>
</html>

<%-- 
                                <c:if test="${not empty foodList}">
	                                <table>
	                                	<thead>
	                                		<tr>
	                                			<th>음식명</th>
	                                			<th>분류</th>
	                                			<th>설명</th>
	                                			<th>사진</th>
	                                			<th>가격</th>
	                                		</tr>
	                                	</thead>
	                                	<tbody>
	                                		<c:forEach var="food" items="${foodList}">
	                                			<tr>
	                                				<td>${food.fname}</td>
	                                				<td>${food.type}</td>
	                                				<td>${food.content}</td>
	                                				<td>${food.picture}</td>
	                                				<td>${food.price}</td>
	                                			</tr>
	                                		</c:forEach>
	                                	</tbody>
	                                </table>
                                </c:if>
                                <c:if test="${not empty tEventList}">
                                	<table>
	                                	<thead>
	                                		<tr>
	                                			<th>번호</th>
	                                			<th>제목</th>
	                                			<th>기간</th>
	                                			<th>작성일</th>
	                                		</tr>
	                                	</thead>
	                                	<tbody>
	                                		<c:forEach var="tEvent" items="${tEventList}">
	                                			<tr>
	                                				<td>${tEvent.eno}</td>
	                                				<td>${tEvent.title}</td>
	                                				<c:if test="${tEvent.s_date==tEvent.s_date}" var="oneday">
	                                					<td>${tEvent.s_date}</td>
	                                				</c:if>
	                                				<c:if test="${not oneday}">
	                                					<td>${tEvent.s_date}~${tEvent.s_date}</td>
	                                				</c:if>
	                                				<td>${tEvent.postdate}</td>
	                                			</tr>
	                                		</c:forEach>
	                                	</tbody>
	                                </table>
                                </c:if>
     --%> 