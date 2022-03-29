<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row" style="margin-top: 100px;">
		<div class="card">
<table id = "jobDetailTbl" class= "table" style="width : 90%; margin: 0 auto;">
	<tr>
		<td colspan="4" style="border-bottom: solid 3px #b3b3b3;">
			<div></div>
		</td>
	</tr>
	<tr id = "jobTitle">
		<td colspan="3" style="font-size: 25px; font-weight: bold;">${dj.j_title }</td>
		<td style = "width : 30%"><span style = "font-weight: lighter"><fmt:formatDate value="${dj.j_date }" type = "both" dateStyle="long" timeStyle="short"/>&nbsp; | &nbsp; 조회수 ${dj.j_view }</span></td>
	</tr>
<!-- <tr>
		<td colspan = "4">연락하기</td>
	</tr> -->
	<tr>
		<td colspan ="5">
			<table class="table" id = "jobInfo">
				<tr><td id = "jobInfoTitle" colspan = "2" style="background-color: #fffbe9;">기본정보</td></tr>
				<tr>
					<td rowspan = "3" align="center" style="border-bottom : solid 1px #f7d511"><img src="resources/profileImg/${dj.u_profile }" height="100" width = "50"></td>
					<td>
						<span style="font-weight : bold; font-size : 20px;">${dj.u_name }</span>
						&nbsp;•&nbsp;${dj.u_gender }&nbsp;•&nbsp; 
						<c:set var= "birth" value = "${dj.u_birth }" ></c:set>
						${fn:substring(birth, 0,2) }년생
					</td>
				</tr>
				<tr>
					<td style="border-bottom : solid 1px #f7d511">
						<span style="font-weight : bold; font-size : 15px;">연락처</span>&nbsp;&nbsp;${dj.u_phonNumber }<br>
						<span style="font-weight : bold; font-size : 15px;">주소</span>&nbsp;&nbsp;${dj.u_address }
					</td>
				</tr>
			</table>		
		</td>
	</tr>
	<tr style = "vertical-align: middle; height: 80px;">
		<th  scope="row" style = " width: 15%; font-size: 18px">잉여 날짜</th>
		<td colspan="3">
			<i class="bi bi-calendar-week"></i>&nbsp;
			<fmt:formatDate value="${dj.j_start_date }" type="date" pattern="yyyy년 MM월 dd일"/> <strong>~</strong>
			<fmt:formatDate value="${dj.j_end_date }" type="date" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	<tr style = "vertical-align: middle; height: 80px;">
		<th style = " width: 15%; font-size: 18px">잉여 시간</th>
		<td colspan="3"><i class="bi bi-alarm"></i>&nbsp; ${dj.j_start_time } <strong>~</strong> ${dj.j_end_time }</td>
	</tr>
	<tr style = "vertical-align: middle; height: 80px;">
		<th style = " width: 15%; font-size: 18px">희망 지역</th>
		<td colspan="3"><i class="bi bi-geo-alt-fill"></i>&nbsp;${dj.j_area }</td>
		
	</tr>
	<tr style = "height: 200px;">
		<th style = " width: 15%; vertical-align : middle; font-size: 18px">자기소개</th>
		<td colspan="3"><div style="white-space:pre;">${dj.j_intro }</div></td>
	</tr>
	<tr>
		<th style = " width: 15%; vertical-align : middle; font-size: 18px">첨부파일</th>
		<td colspan = "3"><a href="resources/img/${dj.j_pic }" style="text-decoration: none;"><i class="bi bi-file-earmark-text"></i>&nbsp;${dj.j_pic }</a></td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom-style: none">
			<div align="right">
			<c:choose>
			<c:when test="${dj.j_u_id == sessionScope.loginUser.u_id }">
				<button class="btn btn-outline-warning" onclick = "location.href = 'job.update.go?j_no=${dj.j_no}&j_title=${dj.j_title }&j_start_date=${dj.j_start_date }&j_end_date=${dj.j_end_date }&j_start_time=${dj.j_start_time }&j_end_time=${dj.j_end_time }&j_area=${dj.j_area }&j_intro=${dj.j_intro }&j_pic=${dj.j_pic }'">수정</button>&nbsp;
				<button class="btn btn-outline-warning" onclick = "deleteJob('${dj.j_no}')">삭제</button>&nbsp;
				<button class="btn btn-outline-warning" onclick = "location.href = 'job.go'">목록으로</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-warning" onclick="submitIntro('${token }', '${loginUser.u_id}', '${dj.j_u_id}')">연락하기</button>
				<button class="btn btn-outline-warning" onclick = "location.href = 'job.go'">목록으로</button>
			</c:otherwise>
			</c:choose>
			</div>
		</td>
	</tr>
	</table>
	</div>
</div>
</div>
</body>
</html>