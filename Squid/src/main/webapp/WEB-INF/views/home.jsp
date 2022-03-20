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
						<div class="col col-6 col-md-12 mx-auto" style="width: 18rem;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							</div>
						</div>
						<div class="col col-6 col-md-12 mx-auto" style="width: 18rem;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							</div>
						</div>
						<div class="col col-6 col-md-12 mx-auto" style="width: 18rem;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							</div>
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
					<div class="row">
						<c:forEach var="r" items="${reviews }">
							<div class="col col-md-12 mx-auto">
								<div class="card-body">
									<p class="card-text">${r.rv_no} </p>
									<p class="card-text">${r.rv_title} </p>
									<p class="card-text">${r.rv_content} </p>
								</div>
							</div>						
						</c:forEach>
					</div>
				</div>
			</section>
		<!-- //가장 핫한 후기 -->
		</div>
</body>
</html>