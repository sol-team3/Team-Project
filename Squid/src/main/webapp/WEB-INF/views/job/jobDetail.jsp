<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style> -->
<script type="text/javascript">
$(function(){
	var mapContainer = document.getElementById('jobMap'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${dj.u_address}', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dj.j_rest_name}</div>'
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

<table class= "table table-bordered">
	<tr>
		<td width = "10%">${dj.j_no }</td>
		<td width = "60%">${dj.j_rest_name }</td>
	</tr>
	<tr>
		<td colspan = "2">${dj.u_phonNumber }</td>
	</tr>
	<tr>
		<td width = "10%">잉여 날짜
		<td width = "60%">
			<fmt:formatDate value="${dj.j_start_date }" type="date" pattern="yyyy년 MM월 dd일"/> <strong>~</strong>
			<fmt:formatDate value="${dj.j_end_date }" type="date" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	<tr>
		<td width = "10%">잉여 시간
		<td width = "60%">${dj.j_start_time } <strong>~</strong> ${dj.j_end_time }</td>
	</tr>
	<tr>
		<td width = "10%">시급</td>
		<td width = "60%">${dj.j_pay }&nbsp;원</td>
	</tr>
	<tr>
		<td width = "60%"><%-- ${dr.u_address} --%><!-- 가게 위치 지도 넣기 --> <div id="jobMap" style="width:80%;height:300px"></div></td>
		<td><div style="white-space:pre;">${dj.j_content }</div></td>
	</tr>
	<c:if test="${dj.j_pic != null }">
	<tr>
		<td colspan = "2" align="center">
			<div><img src="resources/img/${dj.j_pic }"></div>
		</td>
	</tr>
	</c:if>
	</table>

	<div style = "float: right;">
		<c:choose>
		<c:when test="${dj.j_u_id == sessionScope.loginUser.u_id }">
			<button onclick = "location.href = 'job.update.go?j_no=${dj.j_no}'">수정</button>&nbsp;
			<button onclick = "deleteRecruit('${dj.j_no}')">삭제</button>&nbsp;
			<button onclick = "location.href = 'job.go'">목록으로</button>
		</c:when>
		<c:otherwise>			
			<button onclick = "location.href = 'job.go'">목록으로</button>
		</c:otherwise>
		</c:choose>
	</div>

</body>
</html>