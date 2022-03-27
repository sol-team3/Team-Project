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
	$('.cards').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  nextArrow:$('.next'),
		  prevArrow:$('.prev'),
	})	
})
</script>
<body>
	<div id="content">
		<!-- Slider -->
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-top: 70px;">
			    <div class="carousel-indicators">
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    </div>
			    <div class="carousel-inner">
			    	<div class="carousel-item active">
			      		<img src="resources/img/광고1.png" class="d-block w-100 h-100" alt="...">
			    	</div>
			    	<div class="carousel-item">
			      		<img src="resources/img/광고2.png" class="d-block w-100 h-100" alt="...">
			    	</div>
			    	<div class="carousel-item">
			      		<img src="resources/img/광고3.png" class="d-block w-100 h-100" alt="...">
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
					<c:if test="${loginUser.u_type == '사업자' || loginUser.u_type == 'admin'}">
						<div class="row">
							<div class="mt-5 mb-2 text-center homeTitle" onclick="location.href='recruit.go'" style="font-family: 'Do Hyeon', sans-serif; font-size: 17pt;">최근 올라온 구직자 게시물</div>
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
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${loginUser.u_type == '개인' || loginUser.u_type == 'admin'}">
						<div class="row">
							<div class="mt-5 mb-2 text-center homeTitle" onclick="location.href='recruit.go'" style="font-family: 'Do Hyeon', sans-serif; font-size: 17pt;">최근 올라온 아르바이트</div>
						</div>
						<div class="row">
							<c:forEach var="r" items="${recruits }">
								<div class="col col-sm-12 col-md-12 col-xl-4" style="margin: auto;">
									<div class="card text-center goRecruitDetail my-1" >
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
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</section>
		<!-- //최근 올라온 알바 --> 
			
		<!-- 가장 핫한 후기 -->
 			<section class="mostlyReviews mb-4">
				<div class="container">
					<div class="row">
						<div class="mt-5 mb-2 text-center homeTitle" onclick="location.href='review.go'" style="font-family: 'Do Hyeon', sans-serif; font-size: 17pt;">최근 올라온 후기</div>
					</div>
					<div class="row cards">
 						<c:forEach var="r" items="${reviews }">
							<div class="cardSlide card text-center col-8" style="width: 80%; margin-top: 0px;">
							    <div class="card-header homeGoRecruit" onclick="location.href='review.detail?rv_no=${r.rv_no }&token=${token}'">
							    	${r.rv_rest_name }
							    </div>
							    <div class="card-body">
							    	<p></p>
							        <p class="card-text">${r.rv_title }</p>
							        <p class="card-text">
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
							        </p>
							        <p class="card-text">${r.rv_content }</p>
							    </div>
							</div>							
						</c:forEach>
 						<div class="cardSlideLeftBtn prev" style="width: 70px;">
							<i class="bi bi-caret-left csLeft"></i>
						</div>
						<div class="cardSlideRightBtn next" style="width: 70px;">
							<i class="bi bi-caret-right csRight"></i>
						</div>
					</div>
				</div>
			</section>
		<!-- //가장 핫한 후기 -->
		</div>
</body>
</html>