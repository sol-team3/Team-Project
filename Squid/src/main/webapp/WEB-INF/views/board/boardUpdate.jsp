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
	<h1 class="display-6"  align="center">수정 페이지</h1>
	<br>
	
	<form  action="board.update" class="row g-3">
		<div class="col-md-3">
		    <label class="form-label">${param.b_no }</label>
		  </div>
		  <div class="col-md-3">
		    <input class="form-control" name = "b_owner" value = "${param.b_owner }">
		  </div>
		  <div class="col-md-6">
		    <input class="form-control" name = "b_title" value = "${param.b_title }">
		  </div>
		  <div class="col-12">
		  	<textarea class="form-control" name = "b_content" id="floatingTextarea2" style="height: 200px">${param.b_content }</textarea>
		  </div>
		  <div class="d-grid gap-2 col-6 mx-auto">
  			<button class="btn btn-primary" type="submit">수정하기</button>
		  </div>
	</form>
		
</body>
</html>