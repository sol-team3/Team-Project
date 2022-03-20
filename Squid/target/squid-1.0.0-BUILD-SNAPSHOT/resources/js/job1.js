function deleteJob(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "job.delete?j_no=" + n;
	}
}

function jobWrite(){
	
	let jTitle = document.jobWriteForm.j_title;
	let jStartDate = document.jobWriteForm.j_start_date;
	let jEndDate = document.jobWriteForm.j_end_date;
	let jStartTime = document.jobWriteForm.j_start_time;
	let jEndTime = document.jobWriteForm.j_end_time;
	let jIntro = document.jobWriteForm.j_intro;
	
	
	if(jTitle.value == "") {
		alert('제목을 입력해주세요');
		jRestName.focus();
		return false;
	} else if(jStartDate.value=="") {
		alert('잉여 시작 날짜을 선택해주세요');
		jStartDate.focus();
		return false;
	} else if(jEndDate.value=="") {
		alert('잉여 끝나는 날짜을 선택해주세요');
		jEndDate.focus();
		return false;
	} else if(jStartTime.value=="") {
		alert('잉여 시작 시간을 선택해주세요');
		jStartTime.focus();
		return false;
	} else if(jEndTime.value == "") {
		alert('잉여 끝나는 시간을 선택해주세요');
		jEndTime.focus();
		return false;
	} else if(jarea.value == "") {
		alert('희망 지역을 선택해주세요');
		jarea.focus();
		return false;
	} else if(jIntro.value == "") {
		alert('자기소개를 입력해주세요');
		jIntro.focus();
		return false;
	}
	
		return true;
}

function jobUpdate(){

	let jTitleUpdate = document.jobUpdateForm.j_rest_name;
	let jStartDateUpdate = document.jobUpdateForm.j_start_date;
	let jEndDateUpdate = document.jobUpdateForm.j_end_date;
	let jStartTimeUpdate = document.jobUpdateForm.j_start_time;
	let jEndTimeUpdate = document.jobUpdateForm.j_end_time;
	let jareaUpdate = document.jobUpdateForm.j_area;
	let jIntroUpdate = document.jobUpdateForm.j_intro;
	
	if(jTitleUpdate.value == "") {
		alert('제목을 입력해주세요');
		jRestNameUpdate.focus();
		return false;
	} else if(jStartDateUpdate.value=="") {
		alert('잉여 시작 날짜을 선택해주세요');
		jStartDateUpdate.focus();
		return false;
	} else if(jEndDateUpdate.value=="") {
		alert('잉여 끝나는 날짜을 선택해주세요');
		jEndDateUpdate.focus();
		return false;
	} else if(jStartTimeUpdate.value=="") {
		alert('잉여 시작 시간을 선택해주세요');
		jStartTimeUpdate.focus();
		return false;
	} else if(jEndTimeUpdate.value == "") {
		alert('잉여 끝나는 시간을 선택해주세요');
		jEndTimeUpdate.focus();
		return false;
	} else if(jareaUpdate.value == "") {
		alert('희망 지역을 선택해주세요');
		jareaUpdate.focus();
		return false;
	} else if(jIntroUpdate.value == "") {
		alert('자기소개를 입력해주세요');
		jIntroUpdate.focus();
		return false;
	}
	
	return true;

}