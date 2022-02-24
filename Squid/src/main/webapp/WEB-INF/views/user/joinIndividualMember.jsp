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
<script type="text/javascript">
$(function() {
	$("#idChk").on("click", function() {
		var u_id = $("#id").val();		
		console.log(u_id);

		$.ajax({
            url: 'idCheck.do' /* 서버요청경로지정 */,
            type : 'POST' /* 어떤방식요청인지 */, 
            data: u_id /* 전송할데이터 */,
            contentType: "application/json; charset=UTF-8" /* 어떤형식데이터보낼지 */,
            dataType: 'text' /* 컨트롤에서 리턴받을 타입 */,
			success:function(data){
				if(data.cnt == 1) {
					$("#notice").css("color","red").text("이미 사용 중인 ID 입니다.");
					$("#id").focus();
				}else {
					$("#notice").css("color","blue").text("사용 가능한 ID 입니다.");
					$("#pw").focus();
					
				}
			}
		});//ajax
	});//click
}); //ready
</script>
</head>
<body>
<div class="container">
<p>개인회원 가입</p>
	<form action="join.do" method="post" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="exampleInputEmail1">아이디</label>
	    <input class="form-control" id="id" name="u_id" placeholder="아이디을 입력하세요">
	    <button type="button" id="idChk">중복확인</button>
	    <p id="notice"></p>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">비밀번호</label>
	    <input type="password" class="form-control" id="pw" name="u_pw" placeholder="암호를 입력하세요">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword2">비밀번호 확인</label>
	    <input type="password" class="form-control" id="pw2" name="u_pwChk" placeholder="한번 더 암호를 입력해주세요">
	  </div>
	  <div class="form-group">
	    <label>이름</label>
	    <input class="form-control" id="name" name="u_name">
	  </div>
	  <div class="form-group">
	  <label>주소</label> <p> 
		<input type="text" id="sample6_postcode" placeholder="우편번호" name="u_add1">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="u_add2"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="u_add3">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="u_address2">
	  </div>
	  <div class="form-group">
	  <label>휴대폰 번호</label> <p>
	  	<input name="u_phonNum1" maxlength="3">-
	  	<input name="u_phonNum2" maxlength="4">-
	  	<input name="u_phonNum3" maxlength="4">
	  </div>
	  <div class="form-group">
	  <label>생일</label> <p>
	  <input type="date" name="u_birth">
	  </div>
	  <div class="form-group">
	  <label>성별</label>
		<select class="form-select" aria-label="Default select example" name="u_gender">
		  <option selected>성별은 선택해주세요</option>
		  <option value="남">남</option>
		  <option value="여">여</option>
		</select>
	  </div>
	  <div class="form-group"></div>
	  <div class="form-group">
	    <label for="exampleInputFile">프로필 사진 업로드</label> <p>
	    <input class="form-control" type="file" id="formFile" name="u_profile">
	  </div>
	  <div class="form-group">
	  <label>자기소개 및 경력소개</label>
	 <textarea class="form-control" rows="3" name="u_intro"></textarea>
	  </div>
	  <input type="hidden" id="usertype" name="u_type" value="개인">
	  <button type="submit" class="btn btn-default">가입하기</button>
	</form>
</div>
</body>
</html>