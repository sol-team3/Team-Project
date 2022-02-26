<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="login.do" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input  id="inputEmail" class="form-control" name="u_id" placeholder="아이디" required autofocus>
                <input type="password" id="inputPassword" class="form-control" name="u_pw" placeholder="비밀번호" required>
<!--                 <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div> -->
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">로그인</button>
            </form><!-- /form -->
            <a href="findPw.go" class="forgot-password">
                	비밀번호를 잊어버리셨나요?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->

</body>
</html>