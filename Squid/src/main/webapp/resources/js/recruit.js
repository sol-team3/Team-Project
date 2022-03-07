function deleteRecruit(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "recruit.delete?rt_no=" + n;
	}
}

function recruitWrite(){
	
	let rtRestName = document.recruitWriteForm.rt_rest_name;
	let rtStartDate = document.recruitWriteForm.rt_start_date;
	let rtEndDate = document.recruitWriteForm.rt_end_date;
	let rtStartTime = document.recruitWriteForm.rt_start_time;
	let rtEndTime = document.recruitWriteForm.rt_end_time;
	let rtPay = document.recruitWriteForm.rt_pay;
	let rtContent = document.recruitWriteForm.rt_content;
	
	
	if(rtRestName.value == "") {
		alert('사업장 이름을 입력해주세요');
		rtRestName.focus();
		return false;
	} else if(rtStartDate.value=="") {
		alert('알바 시작 날짜을 선택해주세요');
		rtStartDate.focus();
		return false;
	} else if(rtEndDate.value=="") {
		alert('알바 끝나는 날짜을 선택해주세요');
		rtEndDate.focus();
		return false;
	} else if(rtStartTime.value=="") {
		alert('알바 시작 시간을 선택해주세요');
		rtStartTime.focus();
		return false;
	} else if(rtEndTime.value == "") {
		alert('알바 끝나는 시간을 선택해주세요');
		rtEndTime.focus();
		return false;
	} else if(rtPay.value == "") {
		alert('시급을 입력해주세요');
		rtPay.focus();
		return false;
	} else if(rtContent.value == "") {
		alert('업무 내용을 입력해주세요');
		rtContent.focus();
		return false;
	}
	
		return true;
}

function recruitUpdate(){

	let rtRestNameUpdate = document.recruitUpdateForm.rt_rest_name;
	let rtStartDateUpdate = document.recruitUpdateForm.rt_start_date;
	let rtEndDateUpdate = document.recruitUpdateForm.rt_end_date;
	let rtStartTimeUpdate = document.recruitUpdateForm.rt_start_time;
	let rtEndTimeUpdate = document.recruitUpdateForm.rt_end_time;
	let rtPayUpdate = document.recruitUpdateForm.rt_pay;
	let rtContentUpdate = document.recruitUpdateForm.rt_content;
	
	if(rtRestNameUpdate.value == "") {
		alert('사업장 이름을 입력해주세요');
		rtRestNameUpdate.focus();
		return false;
	} else if(rtStartDateUpdate.value=="") {
		alert('알바 시작 날짜을 선택해주세요');
		rtStartDateUpdate.focus();
		return false;
	} else if(rtEndDateUpdate.value=="") {
		alert('알바 끝나는 날짜을 선택해주세요');
		rtEndDateUpdate.focus();
		return false;
	} else if(rtStartTimeUpdate.value=="") {
		alert('알바 시작 시간을 선택해주세요');
		rtStartTimeUpdate.focus();
		return false;
	} else if(rtEndTimeUpdate.value == "") {
		alert('알바 끝나는 시간을 선택해주세요');
		rtEndTimeUpdate.focus();
		return false;
	} else if(rtPayUpdate.value == "") {
		alert('시급을 입력해주세요');
		rtPayUpdate.focus();
		return false;
	} else if(rtContentUpdate.value == "") {
		alert('업무 내용을 입력해주세요');
		rtContentUpdate.focus();
		return false;
	}
	
	return true;

}