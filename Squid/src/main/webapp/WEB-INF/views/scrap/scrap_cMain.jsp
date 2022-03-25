<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="scrapWrap" style="text-align: center; margin-top: 70px; padding-top: 20px;">
		<div class="container">
	    	<div class="row scrapHeader">
	    		<h3 class="text-center mt-4" style="font-family: 'Do Hyeon', sans-serif;">관심글목록</h3>
	    	</div>
			<div class="row mt-5 mb-5">
				<table class="table table-hover table-bordered">
					<thead class="table table-light">
						<tr>
							<th>번호</th>
							<th style="width: 30%;">제목</th>
							<th>회원명</th>
							<th>희망지역</th>
							<th>시간</th>
							<th>기간</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody style="background: white;">
						<c:forEach var="j" items="${jobs }">
							<tr>
								<td>${j.j_no }</td>
								<td id="scrapTitle" onclick="location.href='job.detail?j_no=${j.j_no}&token=${token }'">${j.j_title }</td>
								<td>${j.j_u_id }</td>
								<td>${j.j_area }</td>
								<td>${j.j_start_time } <strong>~</strong> ${j.j_end_time }</td>
								<td>
									<fmt:formatDate value="${j.j_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${j.j_end_date }" type="date" pattern="MM월 dd일"/>
								</td>
								<td><i class="fa fa-close" onclick="deleteScrap_c('${loginUser.u_id}', '${j.j_no }')"></i></td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>			
			</div>
		</div>
	</div>
</body>
</html>