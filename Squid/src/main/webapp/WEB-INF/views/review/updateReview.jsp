<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="card mt-4">
			<form action="review.update" method="post">
				<div class="form-group mt-5">
					<label for="exampleFormControlInput1">제목</label> <input type="text"
						class="form-control" name="rv_title" value="${r.rv_title }" required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">가게이름</label> <input
						type="text" class="form-control" name="rv_rest_name"
						value="${r.rv_rest_name }" required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">가게위치</label> <input
						type="text" class="form-control" id="address_kakao"
						name="rv_rest_addr" value="${r.rv_rest_addr }" readonly />
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">평점 : </label>
					<c:choose>
						<c:when test="${r.rv_score  == 1 }">
							<div class="rating d-inline">
								<i class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i>
							</div>
						</c:when>
						<c:when test="${r.rv_score == 2 }">
							<div class="rating d-inline">
								<i class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</c:when>
						<c:when test="${r.rv_score == 3 }">
							<div class="rating d-inline">
								<i class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i>
							</div>
						</c:when>
						<c:when test="${r.rv_score == 4 }">
							<div class="rating d-inline">
								<i class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star"></i>
							</div>
						</c:when>
						<c:when test="${r.rv_score == 5 }">
							<div class="rating d-inline">
								<i class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i> <i
									class="fa fa-star" style="color: #F05522;"></i>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control" id="contentArea" name="rv_content"
						rows="10" required>${r.rv_content }</textarea>
				</div>
				<input type="hidden" name="rv_no" value="${r.rv_no }">
				<button type="submit" 
					class="btn btn-outline-warning mt-2 regReviewBtn">수정하기</button>
				<button type="button" class="btn btn-warning mt-2 regReviewBtn"
					onclick="history.back()">돌아가기</button>
			</form>
			</div>
		</div>
	</div>
</body>
</html>