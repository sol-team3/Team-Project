<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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