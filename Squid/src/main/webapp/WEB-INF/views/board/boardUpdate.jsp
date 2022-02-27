<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//자유 게시판 수정
function boardUpdate() {
	let boardTitleUpdateInput1 = document.getElementById('boardTitleUpdateInput1');
	let boardOwnerUpdateInput1 = document.getElementById('boardOwnerUpdateInput1');
	let boardContentUpdateTextarea1 = document.getElementById('boardContentUpdateTextarea1');
	
	if(isEmpty(boardTitleUpdateInput1)) {
		alert('제목을 입력해주세요!');
		boardTitleUpdateInput1.focus();
		return false;
	}
	
	if(isEmpty(boardOwnerUpdateInput1)) {
		alert('작성자명을 입력해주세요!');
		boardOwnerUpdateInput1.focus();
		return false;
	}
		
	if(isEmpty(boardContentUpdateTextarea1)) {
			alert('내용을 입력해주세요!');
			boardContentUpdateTextarea1.focus();
			return false;
	}

}	
</script>
</head>
<body>
	<br>
	<h1 class="display-6"  align="center">수정 페이지</h1>
	<br>
	
	    <form action="board.update" method="post" name = "boardUpdateForm" onsubmit="return boardUpdate();">
        <div class="form-group">
              <label for="exampleFormControlInput1">제목</label>
          	  <input type="text" class="form-control" id="exampleFormControlInput1" name="b_title" value = "${param.b_title }">
          </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">작성자</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="b_owner"  value = "${param.b_owner }">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="b_content" style="height: 200px">${param.b_content }</textarea>
          </div>
          <br>
        <button type="submit" class="btn btn-info" value = "${param.b_no }" name = "b_no">수정하기</button>
        <button type="button" class="btn btn-secondary" onclick = "location.href ='board.go'">목록으로</button>
    </form>
		
</body>
</html>