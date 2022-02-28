<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form action="board.reg" name = "boardRegForm" method="post" onsubmit="return boardReg();" style="width : 80%; margin: 0 auto;">
		  <div class="mb-3">
		  		<br>
				<h1 class="display-6">게시글 등록</h1>
				<br>
		  </div>
		  <div class="mb-3">
	     	<label for="exampleFormControlInput1">제목</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="b_title" placeholder="제목을 작성해주세요.">
		  </div>
		  <div class="mb-3">
		    <label for="exampleFormControlInput1">작성자</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="b_owner" placeholder="이름을 적어주세요.">
		  </div>
		  <div class="mb-3">
           	<label for="exampleFormControlTextarea1">내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1"  placeholder="내용을 입력해주세요." name="b_content" rows="10"></textarea>
		  </div>
		  <div class="mb-3" align="right">
		    <button type="submit" class="btn btn-secondary">등록하기</button>
		    <button type="button" class="btn btn-light" onclick = "location.href ='board.go'">목록으로</button>
		  </div>
		</form>
	
</body>
</html>