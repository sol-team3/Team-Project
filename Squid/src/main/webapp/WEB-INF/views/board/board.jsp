<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${result }

	<br>
	<h1 class="display-6" align="center">자유 게시판</h1>
	<br>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  	<button onclick = "location.href = 'board.reg.go'" class="btn btn-primary me-md-2" type="button">글 등록하기</button>
  	</div>
	
	<br>
	<table class="table table-hover" >
		  <thead class="table-light">
		    <tr>
		      <th scope="col">글번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">등록일</th>
		      <th scope="col">조회수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var = "b" items = "${boa }">
		    <tr>
		        <td onclick = "location.href = 'board.detail.go?b_no=${b.b_no}'">${b.b_no }</td>
				<td onclick = "location.href = 'board.detail.go?b_no=${b.b_no}'">${b.b_title }</td>
				<td onclick = "location.href = 'board.detail.go?b_no=${b.b_no}'">${b.b_owner }</td>
				<td><fmt:formatDate value="${b.b_date }" type = "date" dateStyle="long"/></td>
				<td>${b.b_views }</td>
		    </tr>
		    </c:forEach>
		  </tbody>
	</table>
		<div style='width:80px; float: left;'>
				<c:if test="${curPage != 1 }"> 
					<a href="board.page.change?p=${curPage - 1 }">Previous</a>
				</c:if>
		</div>
		<div style='width:80px;float: right;'>
				<c:if test="${curPage != pageCount }">
					<a href="board.page.change?p=${curPage + 1 }">Next</a>
				</c:if>
		</div>	    
	
		<!-- 검색  -->
	<div class="container row" style="float: none; margin:100 auto;">
		<form  action="board.search" class="row g-3">
		<div class="col-md-6">
		<input class="form-control" name ="search">
		</div>
		<div class="col-3">
		<button type="submit" class="btn btn-primary">검색</button>
		</div>
		</form>
	</div>		
</body>
</html>