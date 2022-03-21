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
	<div class="scrapWrap" style="text-align: center;">
		<div class="container">
	    	<div class="row scrapHeader">
	    		<h3 class="text-center mt-4">관심글목록</h3>
	    	</div>
			<div class="row mt-5">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th style="width: 30%;">제목</th>
							<th>가게명</th>
							<th>시급</th>
							<th>기간</th>
							<th>시간</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="r" items="${recruits }">
							<tr>
								<td>${r.rt_no }</td>
								<td style="width: 30%;">${r.rt_title }</td>
								<td>${r.rt_rest_name }</td>
								<td><strong><fmt:formatNumber value="${r.rt_pay }" type="number" maxFractionDigits="3"></fmt:formatNumber> 원</strong></td>
								<td>${r.rt_start_time } <strong>~</strong> ${r.rt_end_time }</td>
								<td>
									<fmt:formatDate value="${r.rt_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${r.rt_end_date }" type="date" pattern="MM월 dd일"/>
								</td>
								<td onclick="deleteScrap('${loginUser.u_id}', '${r.rt_no }')"><i class="fa fa-close"></i></td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>			
			</div>
		</div>
	</div>

</body>
</html>