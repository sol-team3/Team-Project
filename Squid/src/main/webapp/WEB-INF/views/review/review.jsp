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
	<div id="reviewWrap" style="margin-top: 70px; padding-top: 20px; text-align: center;">
	    <div class="container">
	    	<div class="row reviewHeader">
	    		<h3 class="text-center mt-4" style="font-family: 'Do Hyeon', sans-serif;">후기게시판</h3>
	    	</div>
	    	<div class="row search">
				<form class="d-flex" action="review.search">
					<select class="mt-2 mb-3" name="what" id="selectReviewType">
						<option value="1">작성자</option>
						<option value="2">상호명</option>
						<option value="3">제목</option>
					</select>
					<input class="form-control mt-2 mb-3" type="search" name="search" placeholder="검색어를 입력하세요" aria-label="Search">
					<button class="btn btn-outline-warning mt-2 mb-3" type="submit"><span class="fa fa-search"></span></button>
				</form>
	    	</div>
	    	<div class="row">
	               <table class="table table-hover table-bordered">
	                   <thead class="table-light">
	                       <tr class="table-light">
	                           <th class="text-center reviewNo">번호</th>
	                           <th class="text-center">별점</th>
	                           <th>제목</th>
	                           <th class="restName">상호명</th>
	                           <th>작성자</th>
	                           <th class="text-center">조회수</th>
	                       </tr>
	                   </thead>
	                    <tbody style="background: white;">
						 <c:forEach var="r" items="${reviews}" >
	                        <tr>
	                            <td class="text-center reviewNo">${r.rv_no }</td>
	                            <td class="text-center">
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
	                            <td class="reviewTitle"><a href="review.detail?rv_no=${r.rv_no }&token=${token}">${r.rv_title }</a></td>
	                            <td class="restName">${r.rv_rest_name }</td>
	                            <td>${r.rv_u_id }</td>
	                            <td class="text-center">${r.rv_views }</td>
	                        </tr>
							</c:forEach>
	                    </tbody>
				</table>
	   		</div>     
	   
   			<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
				<c:if test="${loginUser.u_type != '사업자' }">
			   		<!-- 글 등록 버튼 (로그인 시 사용가능) --> 
		   			<div class="row">
			   			<div class="btn btn-warning col-1 mb-2" style="color: white" id="regReivew" onclick="goReviewWritePage('${token}')">글쓰기</div>
		   			</div>
	   			</c:if>
			</c:if>
	   		
	   		<!-- 페이징 처리 -->  
	   		<div class="row mb-4">
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				    	<c:choose>
				    		<c:when test="${curPageNo == 1 }"></c:when>
				    		<c:otherwise>
			    		      <a class="page-link" href="review.go?p=${param.p - 1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
					    		<span class="sr-only">Previous</span>
						      </a>
				    		</c:otherwise>
				    	</c:choose>
				    </li>
				    <c:forEach var="p" begin="1" end="${pageCnt }">			    
				    <li class="page-item"><a class="page-link" href="review.go?p=${p }">${p }</a></li>
				    </c:forEach>
				    <c:choose>
			    		<c:when test="${curPageNo == endPage }"></c:when>
			    		<c:otherwise>
						      <a class="page-link" href="review.go?p=${param.p + 1 }" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						        <span class="sr-only">Next</span>
						      </a>
			      		</c:otherwise>
			    	</c:choose>
				  </ul>
				</nav>
			</div>
	   	</div>  
   	</div>
</body>
</html>