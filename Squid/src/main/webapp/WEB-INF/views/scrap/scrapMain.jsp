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
							<th>가게명</th>
							<th>시급</th>
							<th>시간</th>
							<th>기간</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody style="background: white;">
						<c:forEach var="sr" items="${recruits }">
							<tr>
								<td>${sr.rt_no }</td>
								<td id="scrapTitle" onclick="goRecruitDetail('${sr.rt_no}', '${token }')">${sr.rt_title }</td>
								<td>${sr.rt_rest_name }</td>
								<td><strong><fmt:formatNumber value="${sr.rt_pay }" type="number" maxFractionDigits="3"></fmt:formatNumber> 원</strong></td>
								<td>${sr.rt_start_time } <strong>~</strong> ${sr.rt_end_time }</td>
								<td>
									<fmt:formatDate value="${sr.rt_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${sr.rt_end_date }" type="date" pattern="MM월 dd일"/>
								</td>
								<td><i class="fa fa-close" onclick="deleteScrap('${loginUser.u_id}', '${sr.rt_no }')"></i></td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>			
			</div>
		</div>
	</div>

</body>
</html>