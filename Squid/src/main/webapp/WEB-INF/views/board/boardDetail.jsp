<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//게시글 삭제
function deleteBoard(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "board.delete?b_no=" + n;
	}
}
</script>
</head>
<body>
	<br>
	<!-- 게시글 -->
	<table class="table table-bordered">
	  <tbody>
	    <tr>
	      <td style="font-weight: bold">${bd1.b_no }</td>
	      <td style="font-weight: bold">${bd1.b_title }</td>
	      <td style="font-weight: bold">${bd1.b_owner }</td>
	    </tr>
	    <tr>
	      <td colspan = "3" height="200px">${bd1.b_content }</td>
	    </tr>
	    <tr align="center">
	    	<td colspan = "3">
	    				<button class="btn btn-primary" type = "button" onclick = "location.href = 'board.update.go?b_no=${bd1.b_no}'" >수정</button>
	      				<button class="btn btn-primary" type = "button" onclick = "deleteBoard(${bd1.b_no});" >삭제</button>
	      				<button class="btn btn-primary" type = "button" onclick = "location.href = 'board.go'">목록으로</button>		
	    	</td>
	    </tr>
	  </tbody>
	</table>

</body>
</html>