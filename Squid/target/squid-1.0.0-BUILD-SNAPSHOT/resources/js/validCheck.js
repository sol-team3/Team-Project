var commentCheck = function(){
	if($('#commentParentText').val() == '' && $('#commentParentText').val() == null) {
		alert('댓글을 입력해주세요');
		return false;
	}
}

function isEmpty(input){
	return !input.value;		// 값이 없다.
} 

// <input>랑 글자 수를 넣으면 
// 그 글자 수 보다 적으면 true, 아니면 false

function lessThan(input, length){
	return input.value.length<length;
}  

// <input>을 넣으면
// 한글/특수문자 들어있으면 true, 아니면 false

function containKR(input){
	// 엠지
	//input.value = 'q지';
	
	let ok = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890@._";
	
	for(let i = 0; i < input.value.length; i++){
		
		if(ok.indexOf(input.value[i]) == -1){
			return true;
		}		
	}
}

// Test

// <input> x2 넣으면 (비번 확인)
// 내용이 다르면 true, 아니면 false

function notEquals(input1,input2){
	return input1.value != input2.value;
}

// <input>, 문자열 세트
// 그 문자열 세트가 포함 안되있으면 true
// 들어있으면 false
						// 조합
function notContains(input, set){
	// input : 1qwerASD
	
	// set : 1234567890		숫자를 반드시 포함
	// set : QWERTYUIOPASDFGHJKLZXCVBNM		대문자를 반드시 포함
	for(let i = 0; i < set.length; i++){
		if(input.value.indexOf(set[i])!=-1){
			return false;
		}
	}
		return true;
		
}

// <input>을 넣어서 
// 숫자가 아니면 true, 숫자면 false
function notNumber(input){
	return isNaN(input.value);
}
