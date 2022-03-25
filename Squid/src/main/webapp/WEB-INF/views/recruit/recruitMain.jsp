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
<script type="text/javascript">
$(function(){
	$('#resetSearchRecruit').click(function(){
		$('.form-group').find('input').val('');
	});
	
	$('.recruitStar').click(function(){
		// alert($(this).siblings('#rtNo').val());
		let rtNo = $(this).siblings('#rtNo').val();
		let userId = $(this).siblings('#userId').val();
		let userType = $(this).siblings('#userType').val();
		/* let iTag = $(this).children('.scrapStar'); */	
		
		if(userId == null || userId == ""){
			alert('로그인이 필요한 서비스입니다.')
			let ok = confirm('로그인페이지로 이동하시겠습니까?');
			if(ok) {
				location.href="login.go";
			}
			
			return;
		};
		
		if (userType == "사업자") {
			alert('개인 유저만 사용 가능한 서비스입니다.');
			
			return;
		};
		
		$.ajax({
			type: 'POST',
			url: 'scrap.add',
			dataType: 'text',
			data: {
				s_u_id: userId,
				s_rt_no: rtNo
			},
			success: function(data) {
				alert(data);
				/* iTag.removeClass('fa-star-o');
				iTag.addClass('fa-star'); */
			}
		});
	});
});
</script>
<body>
	<div id="recruitWrap" style="margin-top: 70px; padding-top: 20px;">
		<div class="container">
	    	<div class="row recruitHeader">
	    		<h3 class="text-center mt-4" style="font-family: 'Do Hyeon', sans-serif;">구인게시판</h3>
	    	</div>
			<div class="row mt-2">
				<div class="col col-md-12">
					<form class="d-flex form-group" action="recruit.search">
						<div class="card w-100 text-center">
						  	<div class="card-body">
								<table class="table table-hover table-bordered">
									<tr>
										<th scope="row" style="width: 15%;">
											<select class="form-control text-center" name="recruitResearchMainSelect">
												<option value="1" selected>지역
												<option value="2">제목
											</select>
										</th>
										<td colspan="2" style="width: 95%;"><input name="recruitResearchMainInput" class="form-control" placeholder="지역의 경우 동으로 검색 해주세요."></td>
									</tr>
									<tr>
										<th scope="row" style="width: 15%; vertical-align : middle;">잉여 날짜</th>
										<td style="width: 42.5%;"><input type="text" name="searchStartDate" id="startDate" class="form-control" readonly></td>
										<td style="width: 42.5%;"><input type="text" name="searchEndDate" id="endDate" class="form-control" readonly></td>
									</tr>
									<tr>
										<th scope="row" style="width: 10%; vertical-align : middle;">잉여 시간</th>
										<td style="width: 42.5%;"><input type="time" name="recruitResearchStartTime" class="form-control"></td>
										<td style="width: 42.5%;"><input type="time" name="recruitResearchEndTime" class="form-control"></td>
									</tr>
								</table>
					 	 	</div>
						  	<div class="card-body text-muted text-center">
						    	<button type="submit" class="btn btn-outline-warning">상세 검색</button>
						    	<button type="button" class="btn btn-outline-warning" id="resetSearchRecruit">초기화</button>
						  	</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<c:forEach var="r" items="${recruits }">
					<div class="col col-sm-12 col-md-6 col-xl-4" style="margin: auto;">
						<div class="card w-100 text-center goRecruitDetail my-1" >
						  	<div class="card-body pb-0">
								<table class="table" onclick="goRecruitDetail('${r.rt_no}', '${token }')">
									<tr>
										<th>
											가게이름
										</th>
										<td>
											${r.rt_rest_name }
										</td>
									</tr>
									<tr>
										<th>
											제목
										</th>
										<td>
											${r.rt_title }
										</td>
									</tr>
									<tr>
										<th>
											지역
										</th>
										<td>
											${r.rt_rest_addr2 }
										</td>
									</tr>
									<tr>
										<th>
											기간
										</th>
										<td>
											<fmt:formatDate value="${r.rt_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${r.rt_end_date }" type="date" pattern="MM월 dd일"/>
										</td>
									</tr>
									<tr>
										<th>
											근무시간
										</th>
										<td>
											${r.rt_start_time } <strong>~</strong> ${r.rt_end_time }
										</td>
									</tr>						
									<tr>
										<th>
											시급
										</th>
										<td>
											<strong><fmt:formatNumber value="${r.rt_pay }" type="number" maxFractionDigits="3"></fmt:formatNumber> 원</strong>
										</td>
									</tr>						
								</table>
								<input type="hidden" value="${loginUser.u_id}" id="userId">
								<input type="hidden" value="${loginUser.u_type }" id="userType">
								<input type="hidden" value="${r.rt_no }" id="rtNo">
								<button type="button" class="btn btn-warning recruitStar" style="background: white; border: 0px;">스크랩</button>
								<button type="button" id="recruitPlus" style="background: white; border: 0px;" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#recruitPlusModal${r.rt_no }">
									<i class="fa fa-plus mt-1"></i>
								</button>
							</div>
						</div>
					</div>
					
					<!-- Modal -->
					<div class="modal fade" id="recruitPlusModal${r.rt_no }" tabindex="-1" role="dialog" aria-labelledby="recruitPlusModalLabel${r.rt_no }" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="recruitPlusModalLabel${r.rt_no }">${r.rt_title }</h5>
					      </div>
					        <div class="modal-body" style="text-align:center;">
							  <img alt="가게이미지" style="width: 100%;" src="resources/restImg/${r.rt_rest_img }"> <br>
							  <fmt:formatDate value="${r.rt_start_date }" type="date" pattern="MM월 dd일"/> <strong>~</strong> <fmt:formatDate value="${r.rt_end_date }" type="date" pattern="MM월 dd일"/> <br>
							  ${r.rt_start_time } ~ ${r.rt_end_time } <br>
							  ${r.rt_pay } <br>
							  ${r.rt_con_age } <br>
							  ${r.rt_con_gender } <br>
							  <hr>
							  <span class="d-inline-block text-truncate font-weight-bold" style="max-width: 100%;">
								  ${r.rt_title }
						      </span>
						      <br>
							  <button type="button" class="btn btn-outline-warning" onclick="goRecruitDetail('${r.rt_no}', '${token }')">상세페이지</button>
							</div>
					    </div>
					  </div>
					</div>
				</c:forEach>
			</div>
			
			<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
				<c:if test="${loginUser.u_type != '개인' }">
			   		<!-- 글 등록 버튼 (로그인 시 사용가능) --> 
		   			<div class="row">
			   			<button type="button" class="btn btn-warning col-1 mt-2" id="regRecruit" style="color: white;" onclick="goRecruitWritePage('${loginUser.u_id }','${token}')">글쓰기</button>
		   			</div>
	   			</c:if>
			</c:if>
			
	   		<!-- 페이징 처리 -->  
	   		<div class="row mt-2 mb-4">
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