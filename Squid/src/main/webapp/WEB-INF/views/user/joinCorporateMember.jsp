<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript">
$(function() {
	let a = new Date();
	console.log(a.getFullYear());
	console.log(a.getMonth());
	console.log(a.getDate()+1);
	let now = a.getFullYear() + "-" + a.getMonth() + "-" + (a.getDate()+1);
	console.log(typeof(now));
	console.log(now);
	
	/* $('#birth').attr('max':now); */
	let birth =  document.getElementById('birth');
	birth.setAttribute("min", "1900-01-01");	
	birth.setAttribute("max", "2022-02-28");	
})
</script>
</head>
<body>
<div class="container">
<p>사업자회원 가입</p>
	<form action="join.do" method="post" enctype="multipart/form-data" onsubmit="return check();">
	  <div class="form-group">
	    <label for="exampleInputEmail1">아이디</label>
	    <input class="form-control" id="id" name="u_id" placeholder="한글 외 5자리 이상 아이디을 입력하세요"><p id="idcheck_ok"></p>
	    <button type="button" id="idChk">중복확인</button>
	    <p id="notice"></p>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">비밀번호</label>
	    <input type="password" class="form-control" id="pw" name="u_pw" placeholder="한글 외 5자리 이상 암호를 입력하세요">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword2">비밀번호 확인</label>
	    <input type="password" class="form-control" id="pw2" name="u_pwChk" placeholder="한번 더 암호를 입력해주세요">
	  </div>
	  <div class="form-group">
	    <label>이름</label>
	    <input class="form-control" id="name" name="u_name" required="required" maxlength="10">
	  </div>
	  <div class="form-group">
	  <label>주소</label> <p>
		<input type="text" id="sample6_postcode" placeholder="우편번호" name="u_add1" required>
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="u_add2" required><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="u_add3" required>
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="u_address2">
	  </div>
	  <div class="form-group">
	  <label>휴대폰 번호</label> <p>
	  	<input id="num1" name="u_phonNum1" maxlength="3" value="010">-
	  	<input id="num2" name="u_phonNum2" maxlength="4">-
	  	<input id="num3" name="u_phonNum3" maxlength="4"><p id="numcheck_ok"></p>
	  	<button type="button" id="numChk">중복확인</button>
	  	<p id="notice2"></p>
	  </div>
	  <div class="form-group">
	  <label>생일</label> <p>
	  <input type="date" id="birth" name="u_birth" required>
	  </div>
	  <div class="form-group">
	  <label>성별</label>
		<select class="form-select" aria-label="Default select example" name="u_gender" id="gender">
		  <option selected value="non">성별은 선택해주세요</option>
		  <option value="남">남</option>
		  <option value="여">여</option>
		</select>
	  </div>
	  <div class="form-group"></div>
	  <div class="form-group">
	    <label for="exampleInputFile">프로필 사진 업로드</label> <p>
	    <input class="form-control" type="file" id="formFile" name="u_profile" required>
	  </div>
	  <div class="form-group">
	  <label>가게 소개</label>
	 <textarea class="form-control" rows="3" name="u_intro" required></textarea>
	  </div>
	  <input type="hidden" id="usertype" name="u_type" value="사업자">
	  <button type="submit" class="btn btn-default">가입하기</button>
	</form>
</div>
</body>
</html>