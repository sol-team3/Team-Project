<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('대구 남구 안지랑로 57', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="border-radius:70%;width:150px;text-align:center;padding:6px 0;">대구 남구 안지랑로 57</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    

});
</script>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-8 mx-auto">
				<div class="card" style="font-size:12px;">
					<div style="position: relative;">${recruit.rt_rest_name }<span style="position: absolute; top: 0; right: 0;">
						<button class="btn btn-outline-warning"><i class="fa fa-star-o"></i>&nbsp;스크랩</button>
					</span></div>
					<h2>${recruit.rt_title }</h2>
					<hr>
					<table class="table table-borderless mb-0">
						<tr>
							<td style="width: 50%;"><img src="resources/img/squid.png" style="width: 100%; height: 70px;"></td>
							<td style="width: 25%; text-align: center;"><img src="resources/img/clock.jpg" class="mb-2" style="width: 100%; height: 50px;">${recruit.rt_pay } 원</td>
							<td style="width: 25%; text-align: center;"><img src="resources/img/calendar.jpg" class="mb-2" style="width: 100%; height: 50px;"><fmt:formatDate value="${recruit.rt_start_date }" pattern="MM-dd" type="date"/> ~ <fmt:formatDate value="${recruit.rt_end_date }" pattern="MM-dd" type="date"/></td>
						</tr>
					</table>
					<hr>
					<h5>모집조건</h5>
					<table class="table table-borderless">
						<tr>
							<th style="width:15%;">마감일</th>
							<td>D-4</td>
						</tr>
						<tr>
							<th style="width:15%;">연령</th>
							<td>무관</td>
						</tr>
						<tr>
							<th style="width:15%;">성별</th>
							<td>무관</td>
						</tr>
						<tr>
							<th style="width:15%;">고용형태</th>
							<td>단기 알바, 계약직</td>
						</tr>
					</table>
					<hr>
					<h5>근무조건</h5>
					<table class="table table-borderless">
						<tr>
							<th style="vertical-align: middle; width:15%;">급여</th>
							<td><strong>시급</strong> &nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 14pt;">${recruit.rt_pay }</span>원</td>
							<td style="text-align: right;"><button type="button" class="btn btn-outline-warning" style="font-size: 4px;" data-toggle="modal" data-target="#exampleModal">급여계산기</button></td>
						</tr>
						<tr>
							<th style="width:15%;">근무기간</th>
							<td><fmt:formatDate value="${recruit.rt_start_date }" pattern="MM월 dd일" type="date"/> ~ <fmt:formatDate value="${recruit.rt_end_date }" pattern="MM월 dd일" type="date"/></td>
						</tr>
						<tr>
							<th style="width:15%;">근무시간</th>
							<td>${recruit.rt_start_time } ~ ${recruit.rt_end_time }</td>
						</tr>
						<tr>
							<th style="width:15%;">업직종</th>
							<td>편의점</td>
						</tr>
					</table>
					<hr>
					<h5>근무지역</h5>
					<i class="fas fa-map-marker-alt my-2">&nbsp;<span style="font-weight: normal; font-size: 10px;">대구 남구 안지랑로 57</span></i>
					<div id="map" style="width:100%;height:300px"></div> <!-- 지도를 표시할 div 입니다 -->
					<i class="fa-solid fa-message mt-4 mb-1">&nbsp;<span style="font-weight: normal; font-size: 11px;">내정보에 작성한 자기소개와 함께 쪽지가 발송됩니다.</span></i>
					<button class="btn btn-warning">지원하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>