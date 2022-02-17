<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container">
    	<div class="row">
			<form class="d-flex">
				<input class="form-control mt-5" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
				<button class="btn btn-outline-success mt-5" type="submit">검색</button>
			</form>
    	</div>
    	<div class="row">
               <table class="table table-striped table-hover table-bordered">
                   <thead>
                       <tr>
                           <th>번호</th>
                           <th>제목<i class="fa fa-sort"></i></th>
                           <th>상호명</th>
                           <th>가게주소<i class="fa fa-sort"></i></th>
                           <th>작성자</th>
                           <th>별점<i class="fa fa-sort"></i></th>
                           <th>조회수</th>
                       </tr>
                   </thead>
				<c:forEach var="r" items="${reviews}" >
                    <tbody>
                        <tr>
                            <td>${r.rv_no }</td>
                            <td>${r.rv_title }</td>
                            <td>${r.rv_rest_name }</td>
                            <td>${r.rv_rest_addr }</td>
                            <td>${r.rv_u_id }</td>
                            <td><fmt:formatNumber value="${r.rv_score }" pattern=".0"></fmt:formatNumber></td>
                            <td>${r.rv_views }</td>
                        </tr>
                    </tbody>
				</c:forEach>
			</table>
   		</div>        
   	</div>  
</body>
</html>