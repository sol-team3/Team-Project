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
    <div class="container">
    	<div class="row serach">
			<form class="d-flex" action="review.search">
				<select class="mt-5" name="what" id="selectReviewType">
					<option value="1">작성자</option>
					<option value="2">상호명</option>
					<option value="3">제목</option>
				</select>
				<input class="form-control mt-5" type="search" name="search" placeholder="검색어를 입력하세요" aria-label="Search">
				<button class="btn btn-outline-warning mt-5" type="submit"><span class="fa fa-search"></span></button>
			</form>
    	</div>
    	<div class="row">
               <table class="table table-hover">
                   <thead>
                       <tr>
                           <th>번호<i class="fa fa-sort"></i></th>
                           <th>별점<i class="fa fa-sort"></i></th>
                           <th>제목</th>
                           <th>상호명</th>
                           <th>가게주소</th>
                           <th>작성자</th>
                           <th>조회수<i class="fa fa-sort"></i></th>
                       </tr>
                   </thead>
				<c:forEach var="r" items="${reviews}" >
                    <tbody>
                        <tr>
                            <td class="text-center">${r.rv_no }</td>
                            <td>
								<c:choose>							
	                            	<c:when test="${r.rv_score  == 1 }">
            			            	<div class="rating">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 2 }">
	                            		<div class="rating">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 3 }">
	                            		<div class="rating">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 4 }">
	                            		<div class="rating">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star"></i>
										</div>
	                            	</c:when>
	                            	<c:when test="${r.rv_score == 5 }">
	                            		<div class="rating">
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
											<i class="fa fa-star" style="color: #F05522;"></i>
										</div>
	                            	</c:when>
								</c:choose>
                            </td>
                            <td>${r.rv_title }</td>
                            <td>${r.rv_rest_name }</td>
                            <td>${r.rv_rest_addr }</td>
                            <td>${r.rv_u_id }</td>
                            <td class="text-center">${r.rv_views }</td>
                        </tr>
                    </tbody>
				</c:forEach>
			</table>
   		</div>     
   		
   		<!-- 글 등록 버튼 (로그인 시 사용가능) --> 
   		<div class="row">
	   		<div class="btn btn-outline-secondary col-1" id="regReivew" onclick="goReviewWritePage()">글쓰기</div>
   		</div>
   		
   		<!-- 페이징 처리 -->  
   		<div class="row">
			<div aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1">Previous</a>
					</li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</div>
		</div>
   	</div>  
</body>
</html>