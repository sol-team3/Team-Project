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
	<div id="recruitWrap">
		<div class="container">
	    	<div class="row recruitHeader">
	    		<h3 class="text-center mt-4" style="font-family: 'Do Hyeon', sans-serif;" onclick="location.href = 'job.go'">구직게시판</h3>
	    	</div>
			<div class="row mt-2">
				<div class="col col-md-12">
					<form class="d-flex form-group" action="job.search">
						<div class="card w-100 text-center">
						  	<div class="card-body">
								<table class="table table-bordered">
									<tr>
										<td colspan="2" style="width: 95%;"><input name="search" class="form-control" placeholder="검색어를 입력하세요"></td>
									</tr>
								</table>
					 	 	</div>
						  	<div class="card-body text-muted text-center">
						    	<button type="submit" class="btn btn-outline-warning">검색</button>
						    	<button type="button" class="btn btn-outline-warning" id="resetSearchRecruit">초기화</button>
						  	</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<c:forEach var="j" items="${jobs }">
					<div class="col col-sm-12 col-md-6 col-xl-4" style="margin: auto;">
						<div class="card w-100 text-center goRecruitDetail my-1" >
						  	<div class="card-body pb-0">
								<table class="table table-bordered" onclick="location.href='job.detail?j_no=${j.j_no}&token=${token }'">
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
											제목
										</th>
										<td>
											${j.j_title }
										</td>
									</tr>
									<tr>
										<th>
											희망지역
										</th>
										<td>
											${j.j_area}
										</td>
									</tr>
									<tr>
										<th>
											잉여날짜
										</th>
										<td>
											<fmt:formatDate value="${j.j_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${j.j_end_date }" type="date" pattern=" MM월 dd일"/>
										</td>
									</tr>
									<tr>
										<th>
											잉여시간
										</th>
										<td>
											${j.j_start_time } <strong>~</strong> ${j.j_end_time }
										</td>
									</tr>											
								</table>
								<input type="hidden" value="${loginUser.u_id}" id="userId">
								<input type="hidden" value="${j.j_no }" id="jNo">
								<button type="button" class="btn btn-warning recruitStar" style="background: white; border: 0px;">
									<i class="fa fa-star-o"></i>
								</button>
								<button type="button" id="jobPlus" style="background: white; border: 0px;" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#jobPlusModal${j.j_no }">
									<i class="fa fa-plus mt-1"></i>
								</button>
							</div>
						</div>
					</div>
					
					<!-- Modal -->
					<div class="modal fade" id="jobPlusModal${j.j_no }" tabindex="-1" role="dialog" aria-labelledby="jobPlusModalLabel${j.j_no }" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="jobPlusModalLabel${j.j_no }">${j.j_title }</h5>
					      </div>
					        <div class="modal-body" style="text-align:center;">
							  <img alt="회원 이미지" style="width: 100px; height: 100px" src="resources/profileImg/${j.u_profile }"> <br>
							  <fmt:formatDate value="${j.j_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${j.j_end_date }" type="date" pattern="MM월 dd일"/> <br>
							  ${j.j_start_time } <strong>~</strong> ${j.j_end_time }<br>
							  ${j.j_area }<br>
							  ${j.j_u_name } <br>
							  ${j.j_intro } <br>
							  <hr>
							  <span class="d-inline-block text-truncate font-weight-bold" style="max-width: 100%;">
								  ${j.j_title }
						      </span>
						      <br>
							  <button type="button" class="btn btn-outline-warning" onclick="location.href='job.detail?j_no=${j.j_no}&token=${token }'">상세페이지</button>
							</div>
					    </div>
					  </div>
					</div>
				</c:forEach>
			</div>
			
			<div style="text-align: right;">
			<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
				<c:if test="${loginUser.u_type != '사업자' }">
			   		<!-- 글 등록 버튼 (로그인 시 사용가능) --> 
		   			<div>
			   			<button type="button" class="btn btn-warning mt-2 mb-4" style="color: white;" onclick="location.href = 'job.write.go'">글쓰기</button>
		   			</div>
	   			</c:if>
			</c:if>
			</div>
			
	  <!-- 페이징 처리 -->  
	<div>
		<c:choose>
			<c:when test="${curPage == 1 }"></c:when>
			<c:otherwise>
				<a href="job.page.change?p=${curPage - 1 }" id = "jobL"><i class="bi bi-caret-left"></i></a>
			</c:otherwise>
		</c:choose>	
	
<%-- 	<c:if test="${curPage != 1 }">
			<a href="job.page.change?p=${curPage - 1 }" id = "jobL"><i class="bi bi-caret-left text-warning"></i></a>
		</c:if> --%>
	</div>
	
	<div>
	<c:choose>
		<c:when test="${curPage == pageCount }"></c:when>
		<c:otherwise>
			<a href="job.page.change?p=${curPage + 1 }" id = "jobR"><i class="bi bi-caret-right"></i></a>
		</c:otherwise>
	</c:choose>
	
<%-- 	<c:if test="${curPage != pageCount }">
			<a href="job.page.change?p=${curPage + 1 }" id = "jobR"><i class="bi bi-caret-right text-warning"></i></a>
		</c:if>  --%>
	</div>
		</div>
	</div>
</body>
</html>