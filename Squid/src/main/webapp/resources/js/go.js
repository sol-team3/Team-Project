function goAboutUs() {
	location.href="aboutus.go";
}

function goReviewWritePage(no) {
	location.href="review.write";
}

function deleteReview(no) {
	let ok = confirm("글을 삭제할까요?");
	
	if(ok) {
		location.href="review.delete?rv_no=" + no;
	}
}

function updateReview(no) {
	location.href="review.update?rv_no=" + no;
}