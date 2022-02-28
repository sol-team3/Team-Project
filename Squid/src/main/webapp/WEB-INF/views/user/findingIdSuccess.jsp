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
		</c:if>
		<c:if test="${userById != nul}">
		아이디는 ${userById.u_id} 입니다		
		</c:if>
		</div>
	</div>
</body>
</html>