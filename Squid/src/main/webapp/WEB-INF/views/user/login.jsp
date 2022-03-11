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
                <button class="btn btn-outline-warning" type="submit">로그인</button>
            </form><!-- /form -->
            <div class="findidpw">
            <a href="findId.go" class="forgot-password">아이디찾기</a> &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="findPw.go" class="forgot-password">비밀번호찾기</a>
            </div><!-- /findidpw -->
        </div><!-- /card-container -->
    </div><!-- /container -->

</body>
</html>