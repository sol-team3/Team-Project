<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<h1 class="display-6" align="center">게시글 등록</h1>
	<br>

	<form  action="board.reg" class="row g-3">
		  <div class="col-md-6">
		    <input class="form-control" name ="b_owner" placeholder = "작성자명">
		  </div>
		  <div class="col-md-6">
		    <input class="form-control" name = "b_title" placeholder = "제목을 입력해주세요.">
		  </div>
		  <div class="col-12">
		  	<textarea class="form-control" placeholder="내용을 입력해주세요." name = "b_content" id="floatingTextarea2" style="height: 200px"></textarea>
		  </div>
		  <div class="d-grid gap-2 col-6 mx-auto">
  			<button class="btn btn-primary" type="submit">등록하기</button>
		  </div>
	</form>
	
</body>
</html>