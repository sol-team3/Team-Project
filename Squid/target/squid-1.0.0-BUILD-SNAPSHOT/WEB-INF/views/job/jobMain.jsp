<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${result }
	<div id="recruitWrap">
		<div class="container">
			<div class="row mt-5">
				<div class="col col-md-12">
					<form class="d-flex form-group" action="job.search">
						<div class="card w-100 text-center">
						  	<div class="card-body">
								<table class="table table-bordered">
									<tr>
										<th scope="row" style="width: 15%;">
											<select name = "selectType" class="form-control text-center">
												<option value="1">제목 or 내용
												<option value="2">지역 
												<option value="3">작성자
											</select>
										</th>
										<td colspan="2" style="width: 95%;"><input name = "search" class="form-control"></td>
									</tr>
									<tr>
										<th scope="row" style="width: 15%; vertical-align : middle;">잉여 날짜</th>
										<td style="width: 42.5%;"><input name = "j_start_date" type="date" class="form-control"></td>
										<td style="width: 42.5%;"><input  name = "j_end_date" type="date" class="form-control"></td>
									</tr>
									<tr>
										<th scope="row" style="width: 10%; vertical-align : middle;">잉여 시간</th>
										<td style="width: 42.5%;"><input name = "j_start_time" type="time" class="form-control"></td>
										<td style="width: 42.5%;"><input name = "j_end_time" type="time" class="form-control"></td>
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
			
				<!-- 페이징 처리 -->
<%-- 	<c:if test="${curPage != 1 }">
		<a href="job.page.change?p=${curPage - 1 }" >&lt;</a>
	</c:if>
	<c:if test="${curPage != pageCount }">
		<a href="job.page.change?p=${curPage + 1 }" >&gt;</a>
	</c:if> --%>
			
			
			<c:forEach var="j" items="${jobs }">
				<div class="row">
					<div class="col col-10" style="margin: auto;">
						<div class="card w-100 text-center goRecruitDetail"  onclick="location.href='job.detail?j_no=${j.j_no}'">
						  	<div class="card-body mb-0">
								<table class="table table-bordered">
									<tr>
										<td colspan="2" style = "font-size: 18px; font-weight: bolder">
											${j.j_title }
										</td>
									</tr>
									<tr>
										<th>
											이름
										</th>
										<td>
											${j.j_u_name }	
										</td>
									</tr>
									<tr>
										<th>
											희망 지역
										</th>
										<td>
											${j.j_area}
										</td>
									</tr>
									<tr>
										<th>
											잉여 날짜
										</th>
										<td>
											<fmt:formatDate value="${j.j_start_date }" type="date" pattern="yyyy년 MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${j.j_end_date }" type="date" pattern="yyyy년 MM월 dd일"/>
										</td>
									</tr>
									<tr>
										<th>
											잉여 시간
										</th>
										<td>
											${j.j_start_time } <strong>~</strong> ${j.j_end_time }
										</td>
									</tr>									
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
	<!-- 페이징 처리 -->  
	   		<div class="row">
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
			
			<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
 				<%-- <c:if test="${loginUser.u_type != '사업자' }"> --%>
			   		<!-- 글 등록 버튼 (로그인 시 사용가능) --> 
		   			<div class="row">
			   			<div class="btn btn-outline-warning col-1" style="margin-right: 10%;" id="regReivew" onclick="location.href = 'job.write.go'">글쓰기</div>
		   			</div>
	   		 	<%-- </c:if> --%>
 			</c:if>		
		</div>
	</div>
</body>
</html>