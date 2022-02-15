<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
<div class="container">
<p>개인회원 가입</p>
	<form action="#" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="exampleInputEmail1">아이디</label>
	    <input class="form-control" id="id" name="id" placeholder="아이디을 입력하세요">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">비밀번호</label>
	    <input type="password" class="form-control" id="pw" name="pw" placeholder="암호를 입력하세요">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword2">비밀번호 확인</label>
	    <input type="password" class="form-control" id="pw2" name="pw2" placeholder="한번더 암호를 입력해주세요">
	  </div>
	  <div class="form-group">
	    <label>이름</label>
	    <input class="form-control" id="name" name="name">
	  </div>
	  <div class="form-group">
	  <label>주소</label> <p>
	  <input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	  </div>
	  <div class="form-group">
	  <label>생일</label> <p>
	  <input type="date">
	  </div>
	  <div class="form-group">
	  <label>성별</label>
		<select class="form-select" aria-label="Default select example">
		  <option selected>성별은 선택해주세요</option>
		  <option value="남">남</option>
		  <option value="여">여</option>
		</select>
	  </div>
	  <div class="form-group"></div>
	  <div class="form-group">
	    <label for="exampleInputFile">프로필 사진 업로드</label> <p>
	    <input type="file" id="file" name="file">
	  </div>
	  <div class="form-group">
	  <label>자기 소개 및 경력 소개</label>
	 <textarea class="form-control" rows="3"></textarea>
	  </div>
	  <input type="hidden" id="usertype" name="usertype" value="개인">
	  <button type="submit" class="btn btn-default">가입하기</button>
	</form>
</div>
</body>
</html>