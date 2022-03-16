<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="recruitWriteWrap">
		<div class="container">
			<div class="row">
				<div class="col-md-8 mx-auto">
					<div class="card">
						<form action="mypage.update.do" method="post" enctype="multipart/form-data" onsubmit="return check2();">
							<h4 style="text-align: center;">내 정보 수정</h4>
							<table class="table table-border">
								<tr>
									<th>프로필 사진</th>
									<td colspan="2">
									<img src="resources/profileImg/${loginUser.u_profile}" width="100px;"><br>
									<input type="file" id="u_profile" name="u_profile" value="${loginUser.u_profile}" style="display: none;"> 	
									<a id="fn" style="text-align: right;"></a>
									<input type="button" onclick="document.all.u_profile.click();" class="btn btn-outline-warning my-1 searchAddr" value="사진업로드">
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan="2" align="left">${loginUser.u_name}</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td colspan="2" align="left">${loginUser.u_id}</td>
								</tr>
								<tr>
									<th>비밀번호 </th>
									<td colspan="2"><input type="password" class="form-control" id="pw" name="u_pw" value="${loginUser.u_pw}"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="password" class="form-control" id="pw2" name="u_pw2" value="${loginUser.u_pw}"></td>
								</tr>
								<tr>
									<th>성별</th>
									<td align="left">${loginUser.u_gender}</td>
								</tr>
					            		<tr>
	            							<th>주소</th>
	            							<td colspan="2">
	           									<input type="text" class="form-control my-1" id="sample6_postcode" placeholder="우편번호" name="u_add1"  value="${add1}" required>
										<input type="button" class="btn btn-outline-warning my-1 searchAddr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<input type="text" class="form-control my-1" id="sample6_address" placeholder="주소" name="u_add2" value="${add2}" required>
										<input type="text" class="form-control my-1" id="sample6_detailAddress" placeholder="상세주소" name="u_add3" value="${add3}" required>
										<input type="text" class="form-control my-1" id="sample6_extraAddress" placeholder="참고항목" name="u_address2" value="${loginUser.u_address2}" required>
	            							</td>
	    	      						</tr>
								<tr>
									<th>휴대폰 번호</th>
									<td colspan="2" align="left">
									<div>
										<input type="text" class="form-control" id="num1" name="phonNum1" value="${phonNum1}"  maxlength="3" value="010" style="width: 20%; float:left;" required>
										<input type="text" class="form-control" id="num2" name="phonNum2" value="${phonNum2}"  maxlength="4" style="width: 25%; float:left;" required>
										<input type="text" class="form-control" id="num3" name="phonNum3" value="${phonNum3}"  maxlength="4" style="width: 25%; float:left;" required>
									</div>	
									</td>
								</tr>
								<tr>
									<th>생일</th>
									<td align="left">${loginUser.u_birth}</td>
								</tr>
								<tr>
								<c:if test="${loginUser.u_type == '개인'}">
									<th>자기소개 및 경력소개</th>
								</c:if>
								<c:if test="${loginUser.u_type == '사업자'}">
									<th>자기소개 및 가게소개</th>
								</c:if>
									<td><textarea class="form-control" rows="3" name="u_intro" required>${loginUser.u_intro}</textarea></td>
								</tr>
							</table>
							<div style="float: right;">
							<button type="button" class="btn btn-warning" onclick="history.back();">돌아가기</button>
							<button class="btn btn-warning">수정하러가기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>