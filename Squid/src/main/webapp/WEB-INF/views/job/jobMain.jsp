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
								<table class="table table-bordered" id = "search_area">
									<tr>
										<td colspan="2" style="width: 95%;"><input name = "search" class="form-control" placeholder="검색어를 입력하세요"></td>
									</tr>
								</table>
					 	 	</div>
 						  	<div class="card-body text-muted text-center">
						    	<button class="btn btn-outline-warning">검색</button>
						    	<button class="btn btn-outline-warning">초기화</button>
						  	</div>
						</div>
					</form>
				</div>
			</div>
			
			
	<!-- 페이징 처리 -->
	<div>
		<c:if test="${curPage != 1 }">
			<a href="job.page.change?p=${curPage - 1 }" id = "jobL"><i class="bi bi-caret-left"></i></a>
		</c:if>
	</div>
	<div>
		<c:if test="${curPage != pageCount }">
			<a href="job.page.change?p=${curPage + 1 }" id = "jobR"><i class="bi bi-caret-right"></i></a>
		</c:if> 
	</div>
	
	
	

	<!-- 글 목록  -->
			<c:forEach var="j" items="${jobs }">
				<div class="row">
					<div class="col col-10" style="margin: auto;">
						<div class="card w-100 text-center goRecruitDetail"  onclick="location.href='job.detail?j_no=${j.j_no}'">
						  	<div class="card-body mb-0">
								<table class="table table-bordered">
									<tr>
										<td colspan="4">
											<span style = "font-size: 18px; font-weight: bolder">${j.j_title }</span>
										</td>
									</tr>
									<tr>
										<th>
											이름
										</th>
										<td width = "30%">
											${j.j_u_name }	
										</td>
										<th width="20%">등록일</th>
										<td width="30%"><fmt:formatDate value="${j.j_date }" type = "date" dateStyle="long"/></td>
									</tr>
									<tr>
										<th>
											희망 지역
										</th>
										<td colspan="3">
											${j.j_area}
										</td>
									</tr>
									<tr>
										<th>
											잉여 날짜
										</th>
										<td colspan="3">
											<fmt:formatDate value="${j.j_start_date }" type="date" pattern="yyyy년 MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${j.j_end_date }" type="date" pattern="yyyy년 MM월 dd일"/>
										</td>
									</tr>
									<tr>
										<th>
											잉여 시간
										</th>
										<td colspan="3">
											${j.j_start_time } <strong>~</strong> ${j.j_end_time }
										</td>
									</tr>
									<tr>								
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


			
			<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
 				<c:if test="${loginUser.u_type != '사업자' }">
		   			<div class="row">
			   			<div class="btn btn-outline-warning col-1" style="margin-right: 10%;" id="regReivew" onclick="location.href = 'job.write.go'">글쓰기</div>
		   			</div>
	   		 	</c:if> 
 			</c:if>		
		</div>
	</div>
</body>
</html>