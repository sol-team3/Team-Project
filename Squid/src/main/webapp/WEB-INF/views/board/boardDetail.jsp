<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	      				<button class="btn btn-primary" type = "button" onclick = "delBoard('${bd1.b_no}');" >삭제</button>
	      				<button class="btn btn-primary" type = "button" onclick = "location.href = 'board.go'">목록으로</button>		
	    	</td>
	    </tr>
	  </tbody>
	</table>
	<h4>Comment</h4>
	<table class="table table-striped">
		<c:forEach var="bc" items="${boardComments }">
			<c:if test="${bd1.b_no == bc.bc_b_no}">
				<tr>
					<td style="text-align: center; width: 10%;">${bc.bc_owner }</td>
					<td style="width: 85%;">${bc.bc_content }</td>
					<td id="deleteBoardComment" style=" width: 5%;" onclick="deleteBoardComment('${bc.bc_no}', '${bd1.b_no }')">삭제</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<table class="table table-condensed">
		<tr>
			<td>
			<form class="needs-validation" action="board.comment.reg" method="post">
			<input type="hidden" name="bc_b_no" value="${bd1.b_no }">
			<input type="hidden" name="b_no" value="${bd1.b_no }">	
			<input type="hidden" name="token" value="${token }">		
			<div>
				<label for="commentParentText" class="form-label"></label>							
				<textarea id="commentParentText" name="bc_content" class="form-control d-inline col-lg-12" rows="4"></textarea>
			</div>
			<button type="submit" class="btn btn-light col-1" id="commentSubmit" style="float: right">등록</button>
			</form>
			</td>
		</tr>
	</table>
</body>
</html>