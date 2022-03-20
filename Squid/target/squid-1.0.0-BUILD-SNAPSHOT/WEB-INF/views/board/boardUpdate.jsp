<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	    <form action="board.update" method="post" name = "boardUpdateForm" onsubmit="return boardUpdate();"  style="width : 80%; margin: 0 auto;">
        <div class="mb-3">
		   	<br>
			<h1 class="display-6">게시글 수정</h1>
			<br>
         </div>
        <div class="mb-3">

              <label for="exampleFormControlInput1">제목</label>
          	  <input type="text" class="form-control" id="exampleFormControlInput1" name="b_title" value = "${param.b_title }">
         </div>
        <div  class="mb-3">
            <label for="exampleFormControlInput1">작성자</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="b_owner"  value = "${param.b_owner }">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1">내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="b_content" style="height: 200px">${param.b_content }</textarea>
        </div>
        <div class="mb-3" align="right">
		     <button type="submit" class="btn btn-secondary" value = "${param.b_no }" name = "b_no">수정하기</button>
		     <button type="button" class="btn btn-light" onclick = "location.href ='board.go'">목록으로</button>
        </div>       
    </form>
		
</body>
</html>