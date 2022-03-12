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
<table class= "table"   style="width : 90%; margin: 0 auto;">
	<tr>
		<td colspan ="4">
			<table class="table">
				<tr><td  colspan = "2" style = "border-bottom: solid 1px black; font-weight: bold; font-size: 25px;">기본정보</td></tr>
				<tr>
					<td rowspan = "3" align="center"><img src="resources/profileImg/${dj.u_profile }" height="100" width = "50"></td>
					<td>
						<span style="font-weight : bold; font-size : 20px;">${dj.u_name }</span>
						&nbsp;•&nbsp;${dj.u_gender }&nbsp;•&nbsp; 
						<c:set var= "birth" value = "${dj.u_birth }" ></c:set>
						${fn:substring(birth, 0,2) }년생
					</td>
				</tr>
				<tr>
					<td>
						<span style="font-weight : bold; font-size : 15px;">연락처</span>&nbsp;&nbsp;${dj.u_phonNumber }<br>
						<span style="font-weight : bold; font-size : 15px;">주소</span>&nbsp;&nbsp;${dj.u_address }
					</td>
				</tr>
			</table>		
		</td>
	</tr>

	<tr>
		<td style = " width: 15%; vertical-align : middle;" >${dj.j_no }</td>
		<td>${dj.j_title }</td>
		<td style = "width : 15%"><span style = "font-size: smaller; font-weight: lighter"><fmt:formatDate value="${dj.j_date }" type = "both" dateStyle="long" timeStyle="short"/></span></td>
		<td style = "width : 10%" align="center"><span style="font-size: smaller; font-weight: lighter">${dj.j_view }</span></td>
	</tr>
<!-- <tr>
		<td colspan = "4">연락하기</td>
	</tr> -->
	<tr>
		<th  scope="row" style = " width: 15%; vertical-align : middle;">잉여 날짜</th>
		<td colspan="3">
			<fmt:formatDate value="${dj.j_start_date }" type="date" pattern="yyyy년 MM월 dd일"/> <strong>~</strong>
			<fmt:formatDate value="${dj.j_end_date }" type="date" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	<tr>
		<th style = " width: 15%; vertical-align : middle;">잉여 시간</th>
		<td colspan="3">${dj.j_start_time } <strong>~</strong> ${dj.j_end_time }</td>
	</tr>
	<tr>
		<th style = " width: 15%; vertical-align : middle;">희망 지역</th>
		<td colspan="3">${dj.j_area }</td>
		
	</tr>
	<tr>
		<th style = " width: 15%; vertical-align : middle;">자기소개</th>
		<td colspan="3"><div style="white-space:pre;">${dj.j_intro }</div></td>
	</tr>
	<tr>
		<td colspan = "4" align="center"><img src = "resources/img/${dj.j_pic }" width = "150px" height="150px"></td>
	</tr>
	<tr>
		<td colspan="4">
			<div align="center">
			<c:choose>
			<c:when test="${dj.j_u_id == sessionScope.loginUser.u_id }">
				<button class="btn btn-primary" onclick = "location.href = 'job.update.go?j_no=${dj.j_no}'">수정</button>&nbsp;
				<button class="btn btn-secondary" onclick = "deleteJob('${dj.j_no}')">삭제</button>&nbsp;
				<button class="btn btn-light" onclick = "location.href = 'job.go'">목록으로</button>
			</c:when>
			<c:otherwise>			
				<button onclick = "location.href = 'job.go'" class="btn btn-warning">목록으로</button>
			</c:otherwise>
			</c:choose>
			</div>
		</td>
	</tr>
	</table>

</body>
</html>