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
	<div id="recruitWrap">
		<div class="container">
			<div class="row mt-5">
				<div class="col col-md-12">
					<form class="d-flex form-group" action="recruit.search">
						<div class="card w-100 text-center">
						  	<div class="card-body">
								<table class="table table-bordered">
									<tr>
										<th scope="row" style="width: 15%;"><select class="form-control text-center">
											<option value="1">제목+내용
											<option value="2">지역
											<option value="3">작성자
										</select></th>
										<td colspan="2" style="width: 95%;"><input class="form-control"></td>
									</tr>
									<tr>
										<th scope="row" style="width: 15%; vertical-align : middle;">잉여 날짜</th>
										<td style="width: 42.5%;"><input type="date" class="form-control"></td>
										<td style="width: 42.5%;"><input type="date" class="form-control"></td>
									</tr>
									<tr>
										<th scope="row" style="width: 10%; vertical-align : middle;">잉여 시간</th>
										<td style="width: 42.5%;"><input type="time" class="form-control"></td>
										<td style="width: 42.5%;"><input type="time" class="form-control"></td>
									</tr>
								</table>
					 	 	</div>
						  	<div class="card-body text-muted text-center">
						    	<button class="btn btn-outline-warning">상세 검색</button>
						    	<button class="btn btn-outline-warning">초기화</button>
						  	</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<c:forEach var="r" items="${recruits }">
					<div class="col col-4" style="margin: auto;">
						<div class="card w-100 text-center goRecruitDetail my-1"  onclick="goRecruitDetail">
						  	<div class="card-body pb-0">
								<table class="table table-bordered">
									<tr>
										<td>
											${r.rt_rest_name }	
										</td>
									</tr>
									<tr>
										<td>
											${r.rt_title }
										</td>
									</tr>
									<tr>
										<td>
											${r.u_address2 }
										</td>
									</tr>
									<tr>
										<td>
											<fmt:formatDate value="${r.rt_start_date }" type="date" pattern="yy년 MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${r.rt_end_date }" type="date" pattern="yy년 MM월 dd일"/>
										</td>
									</tr>
									<tr>
										<td>
											${r.rt_start_time } <strong>~</strong> ${r.rt_end_time }
										</td>
									</tr>						
									<tr>
										<td>
											${r.rt_pay } <strong>원</strong>
										</td>
									</tr>						
								</table>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
				<c:if test="${loginUser.u_type != '개인' }">
			   		<!-- 글 등록 버튼 (로그인 시 사용가능) --> 
		   			<div class="row">
			   			<div class="btn btn-outline-warning col-1 mt-2" style="margin-left: auto; margin-right: 1%;" id="regRecruit" onclick="goRecruitWritePage('${token}')">글쓰기</div>
		   			</div>
	   			</c:if>
			</c:if>
			
	   		<!-- 페이징 처리 -->  
	   		<div class="row mt-2">
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				    	<c:choose>
				    		<c:when test="${curPageNo == 1 }"></c:when>
				    		<c:otherwise>
			    		      <a class="page-link" href="recruit.go?p=${param.p - 1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
					    		<span class="sr-only">Previous</span>
						      </a>
				    		</c:otherwise>
				    	</c:choose>
				    </li>
				    <c:forEach var="p" begin="1" end="${pageCnt }">			    
				    <li class="page-item"><a class="page-link" href="recruit.go?p=${p }">${p }</a></li>
				    </c:forEach>
				    <c:choose>
			    		<c:when test="${curPageNo == endPage }"></c:when>
			    		<c:otherwise>
						      <a class="page-link" href="recruit.go?p=${param.p + 1 }" aria-label="Next">
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