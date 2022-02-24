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
	geocoder.addressSearch('${r.rv_rest_addr}', function(result, status) {
	
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
	            content: '<div style="border-radius:70%;width:150px;text-align:center;padding:6px 0;">${r.rv_rest_name}</div>'
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
								<span class="d-inline" style='float: right'>작성일 : <fmt:formatDate value="${r.rv_date }" type="date" pattern="yyyy년 MM월 dd일"/></span></td>
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
						        <div id="map" style="width:80%;height:300px"></div> <!-- 지도를 표시할 div 입니다 -->
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
								<c:if test="${loginUser.u_id == r.rv_u_id && loginUser.u_id == 'admin' }">
									<button type="button" id="modify" class="btn btn-light mt-1" onclick="updateReview(${r.rv_no})">수정</button>
									<button type="button" id="delete" class="btn btn-light mt-1" onclick="deleteReview(${r.rv_no})">삭제</button>
								</c:if>
						</span></td>
					</tr>
				</table>
				<h4>Commnet</h4>
				<table class="table table-striped">
					<c:forEach var="c" items="${comments }">
						<c:if test="${r.rv_no == c.rc_rv_no}">
						<tr>
							<td style="text-align: center; width: 10%;">${c.rc_u_id }</td>
							<td style="width: 85%;">${c.rc_content }</td>
							<c:if test="${loginUser.u_id == c.rc_u_id || loginUser.u_id == 'admin' }">
								<td id="deleteComment" style=" width: 5%;" onclick="deleteComment(${c.rc_no}, ${r.rv_no })">삭제</td>
							</c:if>
						</tr>
						</c:if>
					</c:forEach>
				</table>
				<table class="table table-condensed">
					<tr>
						<td>
							<form class="needs-validation" action="review.commnet.reg" method="post">
								<input type="hidden" name="rc_rv_no" value="${r.rv_no }">
								<input type="hidden" name="rv_no" value="${r.rv_no }">	
								<input type="hidden" name="rc_u_id" value="${loginUser.u_id }">
								<input type="hidden" name="token" value="${token }">		
								<div>
									<label for="commentParentText" class="form-label"></label>							
									<textarea id="commentParentText" name="rc_content" class="form-control d-inline col-lg-12" rows="4"></textarea>
								</div>
								<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
									<button type="submit" class="btn btn-light col-1" id="commentSubmit" style="float: right">등록</button>
								</c:if>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>