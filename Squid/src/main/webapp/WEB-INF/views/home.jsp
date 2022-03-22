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
<style>
.cards .cardSlide {
	display: none;
}
.cards .cardSlide:first-child {
	display: flex;
}
</style>
<script type="text/javascript">

</script>
<body>
	<div id="content">
		<!-- Slider -->
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			    <div class="carousel-indicators">
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    </div>
			    <div class="carousel-inner">
			    	<div class="carousel-item active">
			      		<img src="resources/img/banner1.jpg" class="d-block w-100 h-100" alt="...">
			    	</div>
			    	<div class="carousel-item">
			      		<img src="resources/img/banner2.jpg" class="d-block w-100 h-100" alt="...">
			    	</div>
			    	<div class="carousel-item">
			      		<img src="resources/img/banner3.jpg" class="d-block w-100 h-100" alt="...">
			    	</div>
			    </div>
			    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>	
			    	<span class="visually-hidden">Previous</span>
			  	</button>
			  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
			    	<span class="visually-hidden">Next</span>
			  	</button>
			</div>
		<!-- //Slider -->
		<!-- 최근 올라온 알바 -->
			<section class="latestJob">
				<div class="container">
					<div class="row">
						<div class="hr-sect my-5">최근 올라온 아르바이트</div>
					</div>
					<div class="row">
						<c:forEach var="r" items="${recruits }">
							<div class="col col-sm-12 col-md-6 col-xl-4" style="margin: auto;">
								<div class="card w-100 text-center goRecruitDetail my-1" >
								  	<div class="card-body pb-0">
										<table class="table table-bordered" onclick="goRecruitDetail('${r.rt_no}', '${token }')">
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
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div style="text-align: right;">
							<button type="button" onclick="location.href='recruit.go'" class="btn btn-outline-warning mt-3">구인 페이지</button>
						</div>
					</div>
				</div>
			</section>
		<!-- //최근 올라온 알바 -->
			
		<!-- 가장 핫한 후기 -->
			<section class="mostlyReviews">
				<div class="container">
					<div class="row">
						<div class="hr-sect my-5">최근 올라온 후기</div>
					</div>
					<div class="row cards">
 						<c:forEach var="r" items="${reviews }">
							<div class="cardSlide card text-center col-8">
							    <div class="card-header">
							    	${r.rv_title }
							    </div>
							    <div class="card-body">
							        <h5 class="card-title">${r.rv_rest_name }</h5>
							        <p class="card-text">${r.rv_u_id }</p>
							        <p class="card-text">${r.rv_score }</p>
							        <p class="card-text">${r.rv_content }</p>
							    </div>
							</div>							
						</c:forEach>
						<div class="cardSlideLeftBtn">
							<i class="bi bi-caret-left csLeft"></i>
						</div>
						<div class="cardSlideRightBtn">
							<i class="bi bi-caret-right csRight"></i>
						</div>
					</div>
				</div>
			</section>
		<!-- //가장 핫한 후기 -->
		</div>
</body>
</html>