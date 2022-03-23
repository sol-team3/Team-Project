<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 170px; margin-bottom: 100px;">
		<div class="card card-container">
		<c:if test="${userByPw == null}">
		${information}
		<button type="button" class="btn btn-warning" onclick="history.back();">돌아가기</button>
		</c:if>
		<c:if test="${userByPw != nul}">
		비밀번호는 ${userByPw.u_pw} 입니다
		<button type="button" class="btn btn-warning" onclick="location.href='login.go'">로그인 하기</button>		
		</c:if>
		</div>
	</div>
</body>
</html>