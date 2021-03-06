<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
		   	<form action="review.reg" method="post">
		   		<input type="hidden" name="rv_u_id" value="${loginUser.u_id }">
		        <div class="form-group mt-5">
		              <label for="exampleFormControlInput1">제목</label>
		            <input type="text" class="form-control" name="rv_title" placeholder="제목을 작성해주세요." required>
		          </div>
		          <div class="form-group">
		            <label for="exampleFormControlInput1">가게이름</label>
		            <input type="text" class="form-control" name="rv_rest_name" placeholder="이름을 적어주세요." required>
	    	      </div>	
		          <div class="form-group">
		            <label for="exampleFormControlInput1">가게위치</label>
		            <input type="text" class="form-control" id="address_kakao" name="rv_rest_addr" readonly required />
	    	      </div>	
		          <div class="form-group">
		            <label for="exampleFormControlTextarea1">평점</label>
		            <input type="hidden" id="rating" name="rv_score" value="0">
		            <div class="makeStar">
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
					</div>
		          </div>
		          <div class="form-group">
		            <label for="exampleFormControlTextarea1">내용</label>
		            <textarea class="form-control" id="contentArea" name="rv_content" rows="10" required></textarea>
		          </div>
		        <button type="submit" class="btn btn-outline-secondary mt-2 regReviewBtn" name="token" value="${param.token }">등록하기</button>
		        <button type="button" class="btn btn-secondary mt-2 regReviewBtn" onclick="history.back()">목록으로</button>
		    </form>
    	</div>
    </div>
</body>
</html>