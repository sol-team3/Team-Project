<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

   <p>${loginUser.u_type}회원 < 내 정보</p>

   <form action="mypage.update.go" method="post">
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
            <td><input type="password" class="form-control" id="pw"
               name="u_pw" value="${loginUser.u_pw}"></td>
         </tr>
         <tr>
            <td>성별</td>
            <td>${loginUser.u_gender}</td>
         </tr>
         <tr>
            <td>프로필 사진</td>
            <td><img src="resources/profileImg/${loginUser.u_profile}" width="100px;">
         </tr>
         <tr>
            <td>주소</td>
            <td>${add1} ${add2} <br> ${add3}</td>
         </tr>
         <tr>
            <td>휴대폰 번호</td>
            <td>${phonNum1}-${phonNum2}-${phonNum3}</td>
         </tr>
         <tr>
            <td>동네</td>
            <td>${loginUser.u_address2}</td>
         </tr>
         <tr>
            <td>생년월일</td>
            <td>${loginUser.u_birth}</td>
         </tr>
         <c:if test="${loginUser.u_type == '개인'}">
            <tr>
               <td>자기소개</td>
               <td>${loginUser.u_intro}</td>
            </tr>
         </c:if>
         <c:if test="${loginUser.u_type == '사업자'}">
            <tr>
               <td>가게소개</td>
               <td>${loginUser.u_intro}
               </td>
            </tr>
         </c:if>
         <tr>
            <td colspan="2">
               <button type="button" onclick="location.href='myprofil.go'">돌아가기</button>
               <button type="button" onclick="deleteUser('${loginUser.u_id}')">탈퇴하기</button>
               <button>수정하러가기</button>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>