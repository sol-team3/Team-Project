<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="recruitWriteWrap" style="margin-top: 70px;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 mx-auto">
					<div class="card">
						<form action="join.do" method="post" enctype="multipart/form-data" onsubmit="return check();">
							<h4 style="text-align: center; font-family: 'Do Hyeon', sans-serif; font-size: 25pt;">개인회원 가입</h4>
							<table class="table table-border">
								<tr>
									<th>아이디</th>
									<td colspan="2" align="left">
										<input class="form-control" id="id" name="u_id" placeholder="한글 외 5자리 이상 아이디을 입력하세요" style="width: 70%; float:left;">
										<input type="hidden" id="idcheck_ok2" value="">
										<button type="button" id="idChk" class="btn btn-outline-warning my-1 searchAddr">중복확인</button>
										<div style="margin-top: 50px;"><a id="idcheck_ok"></a></div>
										<p id="notice"></p>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td colspan="2"><input type="password" class="form-control" id="pw" name="u_pw" placeholder="영문자, 숫자, 특수기호 포함  5자리 이상 암호를 입력해주세요"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td colspan="2"><input type="password" class="form-control" id="pw2" name="u_pwChk" placeholder="한번 더 암호를 입력해주세요"></td>
								</tr>
								<tr>
									<th>이름</th>
									<th><input class="form-control" id="name" name="u_name"  maxlength="10" required></th>
								</tr>
					            <tr>
	            					<th>주소</th>
	            					<td colspan="2">
	           							<input type="text" class="form-control my-1" id="sample6_postcode" placeholder="우편번호" name="u_add1" required>
										<input type="button" class="btn btn-outline-warning my-1 searchAddr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<input type="text" class="form-control my-1" id="sample6_address" placeholder="주소" name="u_add2" required>
										<input type="text" class="form-control my-1" id="sample6_detailAddress" placeholder="상세주소" name="u_add3" required>
										<input type="text" class="form-control my-1" id="sample6_extraAddress" placeholder="참고항목" name="u_address2" required>
	            					</td>
	    	      				</tr>
								<tr>
									<th>휴대폰 번호</th>
									<td colspan="2" align="left">
										<input type="text" class="form-control" id="num1" name="u_phonNum1"  maxlength="3" value="010" style="width: 20%; float:left;">
										<input type="text" class="form-control" id="num2" name="u_phonNum2"  maxlength="4" style="width: 25%; float:left;">
										<input type="text" class="form-control" id="num3" name="u_phonNum3"  maxlength="4" style="width: 25%; float:left;">
										<input type="hidden" id="numcheck_ok2" value="">
										<button type="button" id="numChk" class="btn btn-outline-warning my-1 searchAddr">중복확인</button> 
										<div style="margin-top: 50px;"><a id="numcheck_ok"></a></div>
										<p id="notice2"></p>
									</td>
								</tr>
								<tr>
									<th>생일</th>
									<td align="left"><input type="date" id="birth" name="u_birth" required></td>
								</tr>
								<tr>
									<th>성별</th>
									<td colspan="2"><select class="form-select" aria-label="Default select example" name="u_gender" id="gender">
										<option selected value="non">성별을 선택해주세요</option>
										<option value="남">남</option>
										<option value="여">여</option>
									</select></td>
								</tr>
								<tr>
									<th>프로필 사진</th>
									<td colspan="2"><input class="form-control" type="file" id="formFile" name="u_profile" required></td>
								</tr>
								<tr>
									<th>자기소개 및 경력소개</th>
									<td colspan="2"><textarea class="form-control" rows="10" name="u_intro" required></textarea></td>
								</tr>
							</table>
							<input type="hidden" id="usertype" name="u_type" value="개인">
							<button type="submit" class="btn btn-warning" style="width: 100%">가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>