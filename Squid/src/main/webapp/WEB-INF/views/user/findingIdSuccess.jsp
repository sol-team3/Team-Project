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
	<div class="container">
		<div class="card card-container">
		<c:if test="${userById == null}">
		${information}
		<button type="button" class="btn btn-warning" onclick="history.back();">돌아가기</button>
		</c:if>
		<c:if test="${userById != nul}">
		아이디는 ${userById.u_id} 입니다		
		<button type="button" class="btn btn-warning" onclick="location.href='findPw.go'">비밀번호 찾기</button>
		</c:if>
		</div>
	</div>
</body>
</html>