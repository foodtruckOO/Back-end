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

    <title>SB Admin 2 - Bootstrap Admin Theme</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	</style>
	<style>
	    label, input { display:block;}
	    input.text { margin-bottom:12px; width:95%; padding: .4em; }
	    fieldset { padding:0; border:0; margin-top:25px; }
	    h1 { font-size: 1.2em; margin: .6em 0; }
	    .ui-dialog .ui-state-error { padding: .3em; }
	    .validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/backend/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value='/backend/vendor/metisMenu/metisMenu.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/backend/dist/css/sb-admin-2.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/backend/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">  
    tr.a:hover { 
    color:#FE9A2E;
    font-size: 1.2em;
    }
</style> 
<script src="<c:url value='/backend/js/sojaeji2.js'/>"></script><!-- 소재지 파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4fa6b1aa17406c2b2c3553c2e41aad3a&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="/backend/template/Top.jsp"/>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">지도</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	트럭리스트
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
	                        <button id="create-user">Create new user</button>
	                       	<article>
								<fieldset>
									<legend>주소그룹</legend>
									<div style="margin-left: 30px;">
										<select class="form-control" name="sido" id="sido" style="width: 15%; float: left; margin-right: 5px"></select>
										<select class="form-control" name="gugun" id="gugun" style="width: 15%; float: left; margin-right: 5px"></select>
										<select class="form-control" name="dong" id="dong" style="width: 15%; float: left; margin-right: 5px"></select>
										<input id="address" class="form-control" type="text" placeholder="상호명" style="width: 20%; float:left; margin-right: 5px"/>
										<input id="submit" class="btn btn-primary" type="button" value="검색"/>
									</div>
								</fieldset>
							</article>
	                        <div id="map" style="width:100%;height:500px;margin-top: 20px;"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
    <!-- ModalPage -->
    <div id="dialog-form" title="Create new user">
		<p class="validateTips">트럭 정보 수정 창</p>
		<form id="frm" method="post" action="<c:url value='/Back/TruckEdit.do'/>">
			<fieldset>
				<label for="tname">상호명</label>
				<input type="text" name="name" id="tname" value="" class="text ui-widget-content ui-corner-all">
				<label for="tal">연락처</label>
				<input type="text" name="tel" id="tel" value="" class="text ui-widget-content ui-corner-all">
				<label for="addr">위치</label><input type="button" id="selectOnMap" value="지도에서 위치변경" style="display: inline-block;">
				<input type="text" name="addr" id="addr" value="" class="text ui-widget-content ui-corner-all">
				<label for="addr">사업자번호</label>
				<input type="text" name="corpNo" id="corpNo" value="" class="text ui-widget-content ui-corner-all">
				<input type="hidden" id="no" name="no" value="">
				<input type="hidden" id="cc" name="cc" value="">
	 			<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
			</fieldset>
		</form>
	</div>
    <!-- /ModalPage -->
    
    
<script type="text/javascript">
	new sojaeji('sido', 'gugun', 'dong');
</script>
<script>
/////////////////////////////////////////////////////////////
///////////////////모달창 관련된 부분들/////////////////////////////
	dialog = $( "#dialog-form" ).dialog({
	  autoOpen: false,
	  height: 425,
	  width: 350,
	  modal: true,
	  buttons: {
	    "수정": function(){
	    	if(confirm("이대로 수정하시겠습니까?"))$("#frm").submit();
	    },
	    "삭제": function(){
	    	if(confirm("정말로 삭제하시겠습니까?"))location.href="<c:url value='/Back/TruckDelete.do?no="+$("#no").val()+"&cc="+$("#cc").val()+"'/>";
	    },
	    "취소": function() {
	    	dialog.dialog( "close" );
	    }
	  },
	  close: function() {
	  		dialog.dialog( "close" );
	  }
	});
	
	$( "#create-user" ).on( "click", function() {
	  dialog.dialog( "open" );
	});
	function modalShow(dto, marker){
		//console.log(no+",   "+cc);//tname, tel, addr
		$("#tname").val(dto.tname);
		$("#tel").val(dto.tel);
		$("#addr").val(dto.location);
		$("#no").val(dto.no);
		$("#corpNo").val(dto.corpNo);
		$("#cc").val(dto.cc);
	    dialog.dialog( "open" );
	    $("#selectOnMap").click(function(){
	    	marker.setDraggable(true);
	    	
	    });
	}
///////////////////모달창 관련된 부분들/////////////////////////////
/////////////////////////////////////////////////////////////
	var mapData = ${json};
	var markers = [];
	var infowindow;
	var container = document.getElementById('map');
	var options = {
		center: new daum.maps.LatLng(37.47893444641687, 126.87900549310089),
		level: 3
	};
	var map = new daum.maps.Map(container, options);
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
	var mapTypeControl = new daum.maps.MapTypeControl();
	// 지도에 컨트롤을 추가해야 지도위에 표시
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	function openOverlay(map,marker,overlay){
		 return function() {
			overlay.setMap(map);
		 };
	}
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(index) {
	    	overlays[index].setMap(null);     	
	}
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();
	// 키워드를 생성한다
	var keyword="";
	$(function(){
		$('#submit').click(function(){
			var a=$('#sido').val();			
			var b=$('#gugun').val();
			var c=$('#dong').val();
			var d=$('#address').val()==null?" ":$('#address').val();
			keyword = a+" "+b+" "+d;
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			removeMarker();
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(keyword, placesSearchCB); 
			console.log(keyword);
		});
	});
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new daum.maps.LatLngBounds();
	        for (var i=0; i<data.length; i++) {
	            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
	        }
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	     	// 지도의 중심좌표를 얻어옵니다 
		    var latlng = map.getCenter();
		    //var message = '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
			// 마커가 표시될 위치입니다 
		    var markerPosition  = new daum.maps.LatLng(latlng.getLat(), latlng.getLng()); 
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        position: markerPosition
		    });
		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);
		    var iwContent = '<div style="width:180px;">현위치 좌표<br><br> 위도:'+latlng.getLat()+'<br> 경도:'+latlng.getLng()+'<br/><br/></div>',
		    iwPosition = new daum.maps.LatLng(latlng.getLat(), latlng.getLng());
			// 인포윈도우를 생성합니다
			infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
			});
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
	    } 
	}
////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////DB에 저장된 주소 받아서 위도/경도로 변환한 뒤 해당 지점에 마커 찍는 로직/////////////////////////
	$.each(mapData, function() {
		//여기서 넘겨줘야 하는 것은 결국 컨텐츠하고 회원여부, 번호 정도가 되겠습니다... 별도로 구글기준 지오코더 안써도 다음 지오코더가 더 나음
		var dto = this;
		////////////////////////////////
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch(this.location, function(result, status) {//첫 인자로 주소를 넣어야 한다. 따라서 json으로 주소를 넘겨주는 게 필수
			if (status === daum.maps.services.Status.OK) {
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        //마커이미지관련
		        var imageSrc='';
		        if(dto.cc=='9') imageSrc="<c:url value='/backend/img/map/Marker_Colored.png'/>";
		        else imageSrc="<c:url value='/backend/img/map/Marker_Monochrome.png'/>";
		        var imageSize= new daum.maps.Size(24,24),
		            imageOption={offset:new daum.maps.Point(0,0)};
		        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
				//마커이미지 생성완료
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            image:markerImage,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
			    	content : dto.content//글에 담을 내용. 생각해보면 infowindow 선언 이전에 content 선언후 거기서 수식해도 될것같음
				});
		        daum.maps.event.addListener(marker, 'mousedown', function() {
				      // 마커 위에 인포윈도우를 표시합니다
				      switch(event.button){
				      case 0 : 
						  infowindow.close();
					      modalShow(dto, marker);//모달에서 필요로 하는 정보들은 다음과 같다
				    	  break;
				      case 2 : 
					      alert(dto.cc=='9'?'회원':'비회원');
					      alert("트럭번호는 "+dto.no);
				    	  confirm("해당 마커를 숨깁니다");
				    	  break;
				      }
				});
				// 마커에 마우스오버 이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'mouseover', function() {
				  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				    infowindow.open(map, marker);
				});

				// 마커에 마우스아웃 이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'mouseout', function() {
				    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				    infowindow.close();
				});
				
		    } 
		});//지오코드 종료
	});///.each 종료
	//지도위에 추가된 마커를 삭제하는 함수
	function removeMarker() {
		for ( var i = 0; i < markers.length; i++ ) {
			infowindow.close();
			markers[i].setMap(null);
		} 
	}
////////////////////////////////////////////////////////////////////////////
</script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/backend/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value='/backend/vendor/metisMenu/metisMenu.min.js'/>"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<c:url value='/backend/dist/js/sb-admin-2.js'/>"></script>
</body>
</html>