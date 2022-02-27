<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 주소 api -->
<script type="text/javascript" src="resources/js/login.js"></script>
</head>
<body>
<p>${loginUser.u_type}회원 < 내정보수정</p>
<form action="mypage.update.do" method="post" enctype="multipart/form-data">
	<table class="table table-striped" style="width: 500px;">
			<tr>
				<td>이름</td>
				<td>${loginUser.u_name}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${loginUser.u_id}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
				<input type="password" class="form-control" name="u_pw" value="${loginUser.u_pw}">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
				<input type="password" class="form-control" name="u_pw2" value="${loginUser.u_pw}">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${loginUser.u_gender}</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td>
				<img src="resources/profileImg/${loginUser.u_profile}" width="100px;"> <br>
				<input type="file" name="u_profile" value="${loginUser.u_profile}"> 	
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="u_add1" value="${add1}">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" name="u_add2" value="${add2}"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="u_add3" value="${add3}">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="u_address2" value="${loginUser.u_address2}">
				</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td><input name="phonNum1" value="${phonNum1}" maxlength="3">-
				<input name="phonNum2" value="${phonNum2}" maxlength="4">-
				<input name="phonNum3" value="${phonNum3}" maxlength="4"></td>
			</tr>
			<tr>
				<td>동네</td>
				<td>${loginUser.u_address2}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${loginUser.u_birth}</td>
			</tr>
			<tr>
				<c:if test="${loginUser.u_type == '개인'}">
					<td>자기소개</td>
				</c:if>
				<c:if test="${loginUser.u_type == '사업자'}">
					<td>가게소개</td>
				</c:if>
				<td><textarea class="form-control" rows="3" name="u_intro">${loginUser.u_intro}</textarea></td>
			</tr>		
			<tr>
				<td colspan="2">
					<button type="button" onclick="history.back();">돌아가기</button>
					<button>수정하기</button>
				</td>
			</tr>
	</table>
</form>
</body>
</html>