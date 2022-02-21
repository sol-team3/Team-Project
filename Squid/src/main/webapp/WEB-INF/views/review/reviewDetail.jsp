<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'zoom_changed', function() {        
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    var level = map.getLevel();
	    var resultDiv = document.getElementById('result');  
	});
	
	var geocoder = new kakao.maps.services.Geocoder();

	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    }
	};

	geocoder.addressSearch('해남군 송지면', callback);
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-5">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th width="10%">${r.rv_no }</th>
							<th width="60%">${r.rv_title }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>평점</td>
							<td>
								<c:choose>							
	                            	<c:when test="${r.rv_score  == 1 }">
            			            	<div class="rating d-inline">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 2 }">
	                            		<div class="rating d-inline">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 3 }">
	                            		<div class="rating d-inline">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 4 }">
	                            		<div class="rating d-inline">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 5 }">
	                            		<div class="rating d-inline">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
										</div>
	                            	</c:when>
								</c:choose>
								<span class="d-inline" style='float: right'>작성일 : ${r.rv_date }</span></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${r.rv_u_id }<span style='float: right'>조회 :
									${r.rv_views }</span></td>
						</tr>
						<tr>
							<td>상호명</td>
							<td>${r.rv_rest_name }</td>
						</tr>
						<tr>
							<td>가게위치</td>
							<td>
								<div id="map" style="width:80%; height:200px;"></div>
								${r.rv_rest_addr }
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<p>${r.rv_content }</p>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-condensed">
					<tr>
						<td><span style='float: right'>
								<button type="button" id="list" class="btn btn-light mt-1" onclick="history.back()">목록</button>
								<button type="button" id="modify" class="btn btn-light mt-1" onclick="updateReview(${r.rv_no})">수정</button>
								<button type="button" id="delete" class="btn btn-light mt-1" onclick="deleteReview(${r.rv_no})">삭제</button>
						</span></td>
					</tr>
				</table>
				<table class="table table-condensed">
					<tr>
						<form action="#">
							<input type="hidden" name="rv_no" value="${r.rv_no }">
							<textarea id="commentParentText" class="form-control d-inline col-lg-12" rows="4"></textarea>
							<button type="button" class="btn btn-light" style="float: right;">등록</button>
						</form>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>