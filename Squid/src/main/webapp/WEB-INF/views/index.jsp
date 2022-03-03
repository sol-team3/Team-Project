<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>오징어</title>
<link rel="shortcut icon" href="resources/img/squid.png" type="image/x-icon">
<!-- CSS -->    
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/review.css">
<link rel="stylesheet" href="resources/css/recruit.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e4a3aeb46d3edd233004fa8b9b332aa&libraries=services"></script>

<script>
$(function(){

   // 주소 API
    $("#address_kakao").click(function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                $("#contentArea").focus(); //입력 포커싱
            }
        }).open();
       $(this).close();
    });
      
   // 별점 찍는 기능
    $('.makeStar i').click(function(){
       let targetNum = $(this).index() + 1;
       console.log(targetNum);
       $('form .makeStar i').css({color:'#000'});
       $('form .makeStar i:nth-child(-n+'+ targetNum +')').css({color:'#F05522'});
       
       $('#rating').val(targetNum);
    });

});
</script>
<script type="text/javascript" src="resources/js/board.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
<!-- Header -->
   <header>
   <!-- Nav -->
      <nav class="navbar navbar-expand-lg navbar-light">
         <div class="container-fluid px-5">
            <a class="navbar-brand" href="index.go">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
               <ul class="navbar-nav">
                  <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="index.go">홈</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="#">구인</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="recruit.go">구직</a>
                  </li>               
                  <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     커뮤니티
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="board.go">자유게시판</a></li>
                        <li><a class="dropdown-item" href="review.go">후기게시판</a></li>
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
                     <%-- ${loginUser.u_name} --%>
                     <img src="resources/profileImg/${loginUser.u_profile}" style="cursor: pointer;" width="30px;" class="navProfileImg" onclick="location.href='myprofil.go'">
                  </div>   
                  </c:if>
               </ul>
            </div>
         </div>
      </nav>
   <!-- //Nav -->
   </header>
<!-- //Header -->
</div>

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
               <button type="button" onclick="goAboutUs()" class="btn btn-outline-warning">Read More</button>
            </div>
            <div class="card-body col-md-6">
               <form action="${pageContext.request.contextPath }/mail/mailSend" method="post" role="form">
                  <h5>Contact Us</h5>
                  <input class="form-control" type="text" name="name" placeholder="Name" style="width:50%; float:left;" required>
                  <input class="form-control col-6" type="text" name="Last_name" placeholder="Last Name" style="width:50%; float:left;" required>
                  <input class="form-control" type="email" name="email" placeholder="Email" required>
                  <input class="form-control" type="text" name="phone" placeholder="Phone" required>
                  <textarea class="form-control" name="message" placeholder="Message" rows="3" required></textarea>
                  <input class="btn btn-outline-secondary form-control input-sm" type="submit" value="SEND">
               </form>
            </div>
         </div>
         <div class="row">
            <p class="text-left">copyright&copy;2022.All Right Reserves by Squid</p>
         </div>
      </div>
   </div>
<!-- //Footer -->
</body>
</html>