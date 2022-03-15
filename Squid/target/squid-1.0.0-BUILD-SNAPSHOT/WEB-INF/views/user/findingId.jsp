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
		<div class="row">
			<p>아이디 찾기</p>
			<div class="card card-container">
				<form action="findId.do" class="form-signin" method="post">
					<div>
						<label>이름</label> <input name="u_name" placeholder="이름" class="form-control">
					</div>
					<div>
						<label>휴대폰 번호</label> <br> 
						<input name="u_phonNum1" maxlength="3" class="form-control mb-2" style="width:30%; float:left;">
						<input name="u_phonNum2" maxlength="4" class="form-control mb-2" style="width:35%; float:left;"> 
						<input name="u_phonNum3" maxlength="4" class="form-control mb-2" style="width:35%; float:left;">
					</div>
					<button class="btn btn-lg btn-primary btn-block btn-signin"
						type="submit">확인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>