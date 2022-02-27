/*다음주소*/ 
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

/*아이디 중복검사*/  
    $(function() {
    	$("#idChk").click(function() {
    		
    		let u_id = $("#id").val();
    		
    		$.ajax({
    			url : "idcheck.do?u_id="+u_id,
                type : 'GET',
                dataType : 'html',
                success : function(data) {
                	if (data == "1") {
//                		alert("사용가능한 아이디입니다.")
                		$("#notice").text("사용가능한 아이디입니다.")
                		$("#notice").css("color","blue")
                		$('#pw').focus();

                	} else {
//                		alert("아이디가 존재합니다.다른 아이디를 입력해주세요");
                		$("#notice").text("아이디가 존재합니다.다른 아이디를 입력해주세요.")
                		$("#notice").css("color","red")
                		$('#id').empty();
                	}
                }
    		})
    	})
    }); 
    
 /*회원가입 유효성 검사*/   
    function check() {

    	let id = document.getElementById('id');
    	let pw = document.getElementById('pw');
    	let pww = document.getElementById('pw2');
    	let name = document.getElementById('name');
    	let num1 = document.getElementById('num1');
    	let num2 = document.getElementById('num2');
    	let num3 = document.getElementById('num3');
    	let gender = document.getElementById('gender');

    	
    // 아이디 (한글외 5자리이상)
    if(isEmpty(id)) {
    	alert('아이디를 입력하지 않았습니다.')
    	id.focus();
    	id.value = "";
    	return false;
    }

    if(lessThan(id,5) || containKR(id)) {
    	alert('아이디를 한글 외 5자리이상 입력해주세요!')
    	return false;
    }

    // 비밀번호 (대,소,수 포함 3자리 이상)
    if(isEmpty(pw)) {
    	alert('비밀번호를 입력하지 않았습니다.');	
    	pw.focus();
    	pw.value = "";
    	return false;
    }


    if(lessThan(pw,5) || containKR(pw)) {
    	alert('비밀번호를 한글 외 5자리이상 입력해주세요!');	
    	pw.focus();
    	pw.value = "";
    	return false;
    }
    // 비밀번호(pw랑pww 비교)
    if(notEquals(pw,pww)) {
    	alert('비밀번호가 일치하지 않습니다!')
    	
    	pww.focus();
    	pww.value = "";
    	return false;
    }
    // 전화번호 2번째 자리(숫자 3자리이상)	
    if(notNumber(num2) || lessThan(num2,3)) {
    	alert('전화번호(중간) : 숫자만 3자리 이상 입력해주세요')
    	
    	num2.focus();
    	num2.value = "";
    	
    	return false;
    }
    // 전화번호 3번째 자리(숫자 자리이상)	
    if(notNumber(num3) || lessThan(num3,4)) {
    	alert('전화번호(마지막) : 숫자만 4자리 이상 입력해주세요')
    	
    	num3.focus();
    	num3.value = "";
    	
    	return false;
    }
    // 성별 셀렉트 항목
    if(gender.value == "non") {
    	alert("성별을 선택해주세요")
    	return false;
    	
    }
    return true;
    }


    
    