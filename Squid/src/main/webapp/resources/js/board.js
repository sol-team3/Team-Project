function delBoard(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "board.delete?b_no=" + n;
	}
}

function deleteBoardComment(no1, no2) {
		var ok = confirm("댓글을 삭제할까요?")
		
		if(ok) {
			location.href="board.comment.delete?bc_no=" + no1 + "&b_no=" + no2;
		}
}

function boardReg() {
	
			let boardTitle = document.boardRegForm.b_title;
			let boardOwner = document.boardRegForm.b_owner;
			let boardContent= document.boardRegForm.b_content;
			
			if(isEmpty(boardTitle)) {
				alert('제목을 입력해주세요!');
				boardTitle.value = "";
				boardTitle.focus();
				return false;
			}else if(isEmpty(boardOwner)) {
				alert('작성자명을 입력해주세요!');
				boardOwner.value = "";
				boardOwner.focus();
				return false;
			}else if(isEmpty(boardContent)) {
				alert('내용을 입력해주세요!');
				boardContent.value = "";
				boardContent.focus();;
				return false;
			}
			
			return true;
}		

function boardUpdate() {
	
	let boardTitleUpdate = document.boardUpdateForm.b_title;
	let boardOwnerUpdate = document.boardUpdateForm.b_owner;
	let boardContentUpdate = document.boardUpdateForm.b_content;
	
	if(isEmpty(boardTitleUpdate)) {
		alert('제목을 입력해주세요!');
		boardTitleUpdate.value = "";
		boardTitleUpdate.focus();
		return false;
	} else if(isEmpty(boardOwnerUpdate)) {
		alert('작성자명을 입력해주세요!');
		boardOwnerUpdate.value = "";
		boardOwnerUpdate.focus();
		return false;
	} else if(isEmpty(boardContentUpdate)) {
		alert('내용을 입력해주세요!');
		boardContentUpdate.value = "";
		boardContentUpdate.focus();;
		return false;
	}
	
	return true;
}		

	