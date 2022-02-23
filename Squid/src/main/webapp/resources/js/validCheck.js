var commentCheck = function(){
	if($('#commentParentText').val() == '' && $('#commentParentText').val() == null) {
		alert('댓글을 입력해주세요');
		return false;
	}
}

