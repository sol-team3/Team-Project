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
<link rel="stylesheet" href="resources/css/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
/* Ready */
$(function(){
	
});

</script>
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
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
								<li><a class="dropdown-item" href="#">후기게시판</a></li>
							</ul>
						</li>
						<c:if test="${loginUser == null}">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							회원관리
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" href="login.go">로그인</a></li>
								<li><a class="dropdown-item" href="join.go">회원가입</a></li>
							</ul>
						</li>
						</c:if>
						<c:if test="${loginUser != null}">
						<div>
						${loginUser.u_name}
						<img src="resources/profileImg/${loginUser.u_profile}" class="navProfileImg" onclick="location.href='myprofil.go'">
						<a href="loginout.do">로그아웃</a>
						</div>
						</c:if>
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