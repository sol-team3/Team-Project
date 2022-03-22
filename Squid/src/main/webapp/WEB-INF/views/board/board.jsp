<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#freeBoard{
	width : 80%; 
	margin: 0 auto;
}
</style>
</head>
<body>
${result }

<table id = "freeBoard" class = "table table-borderless">
	<tr>
		<td>
			<br>
			<h3 align="center" onclick = "location.href = 'board.go'">자유 게시판</h3>
			<br>
		</td>
	</tr>
	<tr>
	<td>
		<div style="float : right;">
		<!-- 검색  -->
			<form  action="board.search">
				  <div class="row">
				    <div class="col">
				      	<input type="text" class="form-control" placeholder="검색어를 입력하세요" name= "search1" style="width: 300px">
				    </div>
				    <div class="col">
				      	<button type="submit" class="btn btn-outline-warning">검색</button>
				    </div>
				  </div>
			</form>
		</div>
	</td>
	</tr>
	<tr>
	<td>
		<table class="table table-hover table-bordered" style = " text-align: center; ">
			  <thead class="table-light">
			    <tr class="table-light">
			      <th scope="col">글번호</th>
			      <th scope="col" style = "width : 40%">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">회원타입</th>
			      <th scope="col">등록일</th>
			      <th scope="col">조회수</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var = "b" items = "${boa }">
			    <tr>
			        <td onclick = "location.href = 'board.detail.go?b_no=${b.b_no}'">${b.b_no }</td>
					<td  style = "width : 35%" onclick = "location.href = 'board.detail.go?b_no=${b.b_no}'">${b.b_title }</td>
					<td onclick = "location.href = 'board.detail.go?b_no=${b.b_no}'">${b.b_owner }</td>
					<td>${b.b_u_type }</td>
					<td><fmt:formatDate value="${b.b_date }" type = "date" dateStyle="long"/></td>
					<td>${b.b_views }</td>
			    </tr>
			    </c:forEach>
			  </tbody>
		</table>
	</td>
	</tr>
	<tr>
	<td>
		<div style="float: right;">
					<c:if test="${loginUser.u_id != null && loginUser.u_id != '' }">
			  		<button onclick = "location.href = 'board.reg.go'" class="btn btn-outline-warning me-md-2" type="button">글 등록하기</button>
					</c:if>
		</div>
	</td>
	</tr>
	<tr>
	<td>	
		<div style="float: left;">
			<c:if test="${curPage != 1 }">
				<a href="board.page.change?p=${curPage - 1 }" style="text-decoration:none"><i class="bi bi-arrow-left-square fs-2 text-warning" id = "pageLeft"></i></a>
			</c:if>
		</div>
		<div style="float: right;">
			<c:if test="${curPage != pageCount }">
				<a href="board.page.change?p=${curPage + 1 }"  style="text-decoration:none;"><i class="bi bi-arrow-right-square fs-2 text-warning" id = "pageRight"></i></a>
			</c:if>
		</div>	    	
</table>

</body>
</html>