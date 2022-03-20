<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function deleteUser(id) {
      let ok = confirm('정말 탈퇴 하시겠습니까?');
      if (ok) {
         location.href = 'mypage.userdelete.go?id=' + id;
      }
   }
</script>
</head>
<body>
	<div id="recruitWriteWrap">
		<div class="container">
			<div class="row">
				<div class="col-md-7 mx-auto">
					<div class="card">
						<form action="mypage.update.go" method="post">
							<h4 style="text-align: center;">${loginUser.u_type}회원 </h4>
							<table class="table table-border">
								<tr>
									<th>프로필 사진</th>
									<td colspan="2"><img src="resources/profileImg/${loginUser.u_profile}" width="100px;" ></td>
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
									<td colspan="2"><input type="password" class="form-control" id="pw" name="u_pw" value="${loginUser.u_pw}" style="width: 30%"></td>
								</tr>
								<tr>
									<th>성별</th>
									<td align="left">${loginUser.u_gender}</td>
								</tr>
					            <tr>
	            					<th>주소</th>
	            					<td colspan="2"  align="left">${add1} ${add2} <br> ${add3}</td>
	    	      				</tr>
								<tr>
	            					<th>동네</th>
	           						<td colspan="2"  align="left">${loginUser.u_address2}</td>
								</tr>
								<tr>
									<th>휴대폰 번호</th>
									<td colspan="2" align="left">${phonNum1}-${phonNum2}-${phonNum3}</td>
								</tr>
								<tr>
									<th>생일</th>
									<td align="left">${loginUser.u_birth}</td>
								</tr>
         								<c:if test="${loginUser.u_type == '개인'}">
           								 <tr>
               								<th>자기소개 및 경력소개</th>
               								<td align="left">${loginUser.u_intro}</td>
            							</tr>
         								</c:if>
        								 <c:if test="${loginUser.u_type == '사업자'}">
          								  <tr>
              								 <th>자기소개 및 가게소개</th>
               								<td align="left">${loginUser.u_intro}</td>
            							</tr>
         								</c:if>
							</table>
							<div style="float: right;">
							<button type="button" class="btn btn-warning" onclick="location.href='myprofil.go'">돌아가기</button>
							<button type="button" class="btn btn-warning" onclick="deleteUser('${loginUser.u_id}')">탈퇴하기</button>
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