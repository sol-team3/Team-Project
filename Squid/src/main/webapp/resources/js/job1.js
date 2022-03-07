function deleteJob(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "job.delete?j_no=" + n;
	}
}

function jobWrite(){
	
	let jRestName = document.jobWriteForm.j_rest_name;
	let jStartDate = document.jobWriteForm.j_start_date;
	let jEndDate = document.jobWriteForm.j_end_date;
	let jStartTime = document.jobWriteForm.j_start_time;
	let jEndTime = document.jobWriteForm.j_end_time;
	let jPay = document.jobWriteForm.j_pay;
	let jContent = document.jobWriteForm.j_content;
	
	
	if(jRestName.value == "") {
		alert('사업장 이름을 입력해주세요');
		jRestName.focus();
		return false;
	} else if(jStartDate.value=="") {
		alert('알바 시작 날짜을 선택해주세요');
		jStartDate.focus();
		return false;
	} else if(jEndDate.value=="") {
		alert('알바 끝나는 날짜을 선택해주세요');
		jEndDate.focus();
		return false;
	} else if(jStartTime.value=="") {
		alert('알바 시작 시간을 선택해주세요');
		jStartTime.focus();
		return false;
	} else if(jEndTime.value == "") {
		alert('알바 끝나는 시간을 선택해주세요');
		jEndTime.focus();
		return false;
	} else if(jPay.value == "") {
		alert('시급을 입력해주세요');
		jPay.focus();
		return false;
	} else if(jContent.value == "") {
		alert('업무 내용을 입력해주세요');
		jContent.focus();
		return false;
	}
	
		return true;
}

function jobUpdate(){

	let jRestNameUpdate = document.jobUpdateForm.j_rest_name;
	let jStartDateUpdate = document.jobUpdateForm.j_start_date;
	let jEndDateUpdate = document.jobUpdateForm.j_end_date;
	let jStartTimeUpdate = document.jobUpdateForm.j_start_time;
	let jEndTimeUpdate = document.jobUpdateForm.j_end_time;
	let jPayUpdate = document.jobUpdateForm.j_pay;
	let jContentUpdate = document.jobUpdateForm.j_content;
	
	if(jRestNameUpdate.value == "") {
		alert('사업장 이름을 입력해주세요');
		jRestNameUpdate.focus();
		return false;
	} else if(jStartDateUpdate.value=="") {
		alert('알바 시작 날짜을 선택해주세요');
		jStartDateUpdate.focus();
		return false;
	} else if(jEndDateUpdate.value=="") {
		alert('알바 끝나는 날짜을 선택해주세요');
		jEndDateUpdate.focus();
		return false;
	} else if(jStartTimeUpdate.value=="") {
		alert('알바 시작 시간을 선택해주세요');
		jStartTimeUpdate.focus();
		return false;
	} else if(jEndTimeUpdate.value == "") {
		alert('알바 끝나는 시간을 선택해주세요');
		jEndTimeUpdate.focus();
		return false;
	} else if(jPayUpdate.value == "") {
		alert('시급을 입력해주세요');
		jPayUpdate.focus();
		return false;
	} else if(jContentUpdate.value == "") {
		alert('업무 내용을 입력해주세요');
		jContentUpdate.focus();
		return false;
	}
	
	return true;

}