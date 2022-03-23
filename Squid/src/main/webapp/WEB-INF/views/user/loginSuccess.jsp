<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function loginOut() {
    let ok = confirm('정말 로그아웃 하시겠습니까?');
    if (ok) {
       location.href = 'loginout.do';
    }
 }
</script>
</head>
<body>
<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
        <div class="card card-container">
        	<div class="box" style="margin-left: 50px; border: 1px solid #D1D1D1">
        	<!-- <div class="box" style="margin-left: 50px; border: 1px solid #F9D371"> -->
            <img id="profile-img" class="profile" src="resources/profileImg/${loginUser.u_profile}" />
            </div>
            <p id="profile-name" class="profile-name-card"></p>
                <span id="reauth-email" class="reauth-email"></span>
                  <form class="form-signin" >
               <p align="center"> ${loginUser.u_name} 님</p>
               <p align="center"> ${loginUser.u_id} </p>
                </form>
            <div class="findidpw" style="text-align: center;">
            	<a href="mypage.go" class="forgot-password" style="text-align: center;">내 정보</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<a onclick="loginOut();" class="forgot-password" style="text-align: center; cursor: pointer;">로그아웃</a>
            </div>
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>