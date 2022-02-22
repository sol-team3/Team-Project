function sortReviewNo() {
	$('#sortReviewNo').click(function(){
		$.ajax({
			type: "GET",
			url: "/squid/review.go",
			success:function(){
				
			}
		})
	});
};

function sortReviewRating() {
	
};

function sortReviewViews() {
	
};



// 스크립트 셋팅
$(function(){
	sortReviewNo();
	sortReviewRating();
	sortReviewViews();
});