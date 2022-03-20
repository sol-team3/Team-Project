<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="card card-container">
				<form action="findPw.do" class="form-signin" method="post">
				<h4 style="text-align: center;">비밀번호 찾기</h4>
					<div>
						<label>아이디</label> 
						<input name="u_id" placeholder="아이디" required autofocus class="form-control">
					</div>
					<div>
						<label>이름</label> <input name="u_name" placeholder="이름" class="form-control">
					</div>
					<div>
						<label>휴대폰 번호</label> <br> 
						<input name="u_phonNum1" maxlength="3" class="form-control mb-2" style="width:30%; float:left;">
						<input name="u_phonNum2" maxlength="4" class="form-control mb-2" style="width:35%; float:left;"> 
						<input name="u_phonNum3" maxlength="4" class="form-control mb-2" style="width:35%; float:left;">
					</div>
					<button class="btn btn-warning"
						type="submit">확인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>