<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- CSS -->    
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
/* Ready */
$(function(){
	
});

</script>
<script type="text/javascript" src="resources/js/board.js"></script>
</head>
<body>
<!-- Header -->
	<header>
	<!-- Nav -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light px-5">
			<div class="container-fluid px-5">
				<a class="navbar-brand" href="#">Navbar</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">홈</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">구인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">구직</a>
						</li>					
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							커뮤니티
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" href="board.go">자유게시판</a></li>
								<li><a class="dropdown-item" href="#">후기게시판</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							회원관리
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" href="#">로그인</a></li>
								<li><a class="dropdown-item" href="#">회원가입</a></li>
								<li><a class="dropdown-item" href="#">회원찾기</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- //Nav -->
	</header>
<!-- //Header -->

<!-- Content -->
	<jsp:include page="${contentPage }"></jsp:include>
<!-- //Content -->

<!-- Footer -->
	<div class="card text-left mt-5">
		<div class="container">
			<div class="row">
				<div class="card-body col-md-6">
					<h5>About Us</h5>
					<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
				</div>
				<div class="card-body col-md-6">
					<h5>Contact Us</h5>
					<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
				</div>
			</div>
			<hr class="m-0 b-0">
			<div class="row">
				<p class="text-center">copy right ~~</p>
			</div>
		</div>
	</div>
<!-- //Footer -->
</body>
</html>