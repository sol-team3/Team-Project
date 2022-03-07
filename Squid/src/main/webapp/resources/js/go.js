function goAboutUs() {
	location.href="aboutus.go";
}

function goReviewWritePage(token) {
	location.href="review.write?token=" + token;
}

function deleteReview(no) {
	let ok = confirm("글을 삭제할까요?");
	
	if(ok) {
		location.href="review.delete?rv_no=" + no;
	}
}

function updateReview(no) {
	location.href="review.update.go?rv_no=" + no;
}

function deleteComment(no1, no2) {
	let ok = confirm("댓글을 삭제할까요?")
	
	if(ok) {
		location.href="review.comment.delete?rc_no=" + no1 + "&rv_no=" + no2;
	}
}

function goRecruitDetail(rtNo, token) {
	location.href="recruit.detail?rt_no=" + rtNo + "&token=" + token;
}

function goRecruitWritePage(uId, token) {
	location.href= "recruit.write?uId=" + uId + "&token=" + token;
}