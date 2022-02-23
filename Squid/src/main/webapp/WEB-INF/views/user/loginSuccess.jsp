<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
</head>
<body>

<div class="container">
        <div class="card card-container">
        	<div class="box">
            <img id="profile-img" class="profile" src="resources/profileImg/${loginUser.u_profile}" />
            </div>
            <p id="profile-name" class="profile-name-card"></p>
                <span id="reauth-email" class="reauth-email"></span>
                  <form class="form-signin" >
               <p align="center"> ${loginUser.u_name} 님</p>
               <p align="center"> ${loginUser.u_id} </p>
                </form>
            <a href="mypage.go" class="forgot-password" style="text-align: center;">
                	내 정보
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->

</body>
</html>