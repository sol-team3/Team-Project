<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.col-md-2 {
	width: 180px;
	height: 180px;
	border-radius: 50%;
	border: 1px solid #ffc107;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	color: #ffc107;
	cursor: pointer;
}

.col-md-2:hover {
	color: black;
	background: #ffc107;
}
</style>
</head>
<body>
<div class="container">
	<div class="row" align="center" style="margin : 200px 0 100px 330px;">
		 <div class="col-md-2" style="margin-right: 300px;" onclick="location.href='join.IndividualMember.go'">개인회원 가입</div>
		 <div class="col-md-2" onclick="location.href='join.corporateMember.go'">사업자회원 가입</div>
	</div>
</div>


</body>
</html>