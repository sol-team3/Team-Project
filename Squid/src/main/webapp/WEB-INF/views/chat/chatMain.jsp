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
	<div id="chatMainWrap">
		<div class="container">
			<div class="row text-center mt-4">
				<h3>채팅페이지</h3>
			</div>
			<div class="row mt-2">
				<div class="col col-8 mx-auto">
					<div class="card chatMainCard">
					    <div class="card-header text-center">
							<h5>오징어 채팅 서비스</h5>
					    </div>
					    <div class="card-body chatPartner" style="height: 700px; overflow-x:hidden; overflow-y:auto;">
					    	<c:forEach var="c" items="${chats }">
								<table class="table text-left" style="vertical-align: middle" border="1">
									<tr>
										<td style="width:10%;">이미지</td>
										<td style="width:70%;">
											<table>
												<tr>
													<td>${c.c_toUserId }</td>
												</tr>
												<tr>
													<td>${c.c_content }</td>
												</tr>
											</table>
										</td>
										<td style="width:20%;"><fmt:formatDate value="${c.c_date }" type="date" pattern="MM-dd hh:mm"/></td>
									</tr>
								</table>					    	
					    	</c:forEach>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>