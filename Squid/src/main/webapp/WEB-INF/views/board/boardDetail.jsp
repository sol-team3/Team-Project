<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#boardDetail{
	width : 90%; 
	margin: 0 auto;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
<div class="card" style="margin-top: 100px;">
<table id = "boardDetail">
	<tr>
	<td>
	<!-- 게시글 -->	
	<table class="table">
	  <tbody>
	    <tr>
	      <td id = "boardTitle" colspan="3">${bd1.b_title }</td>
	    </tr>
	    <tr>
	    	<td><img src="resources/profileImg/${bd1.u_profile }" height="80" width = "70"></td>
	    	<td id = "boardOwner">${bd1.b_owner }</td>
	    	<td style="vertical-align: middle;"><span style="font-weight: lighter; font-size: 15px;">${bd1.b_u_type }회원 &nbsp; | &nbsp; <fmt:formatDate value="${bd1.b_date }" type="both" dateStyle="long" timeStyle="short"/> &nbsp; | &nbsp; 조회수 &nbsp; ${bd1.b_views }</span></td>
	    </tr>
	    <tr>
	      <td colspan = "3" height="300px">${bd1.b_content }</td>
	    </tr>
	    <tr align="center">
	    	<td colspan = "3">
	    	<c:if test="${bd1.b_owner == sessionScope.loginUser.u_id }">
	    				<button class="btn btn-outline-warning" type = "button" onclick = "location.href = 'board.update.go?b_no=${bd1.b_no}&b_title=${bd1.b_title }&b_content=${bd1.b_content }'" >수정</button>
	      				<button class="btn btn-outline-warning" type = "button" onclick = "delBoard('${bd1.b_no}');" >삭제</button>
	      	</c:if>	
	      				<button class="btn btn-outline-warning" type = "button" onclick = "location.href = 'board.go'">목록으로</button>		
	    	</td>
	    </tr>
	  </tbody>
	</table>
	</td>
	</tr>
	<tr>
	<td>
	<h4>Comments</h4>
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
	</td>
	</tr>
	<tr>
	<td>
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
			<button type="submit" class="btn btn-outline-warning col-1" id="commentSubmit" style="float: right">등록</button>
			</form>
			</td>
		</tr>
	</table>
	</td>
	</tr>
</table>
</div>
</div>
</div>
</body>
</html>