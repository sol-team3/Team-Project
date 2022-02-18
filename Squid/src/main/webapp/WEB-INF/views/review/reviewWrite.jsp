<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	
	// 주소 API
    $("#address_kakao").click(function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                $("#contentArea").focus(); //입력 포커싱
            }
        }).open();
    	$(this).close();
    });
	
	// 별점 찍는 기능
    $('.makeStar i').click(function(){
    	let targetNum = $(this).index() + 1;
    	console.log(targetNum);
    	$('form .makeStar i').css({color:'#000'});
    	$('form .makeStar i:nth-child(-n+'+ targetNum +')').css({color:'#F05522'});
    	
    	$('#rating').val(targetNum);
    });
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
		   	<form action="reivew.reg?num=" method="post">
		        <div class="form-group mt-5">
		              <label for="exampleFormControlInput1">제목</label>
		            <input type="text" class="form-control" name="rv_title" placeholder="제목을 작성해주세요.">
		          </div>
		          <div class="form-group">
		            <label for="exampleFormControlInput1">가게사진</label>
		            <input type="file" class="form-control" name="rv_rest_img">
	    	      </div>	
		          <div class="form-group">
		            <label for="exampleFormControlInput1">가게이름</label>
		            <input type="text" class="form-control" name="rv_rest_name" placeholder="이름을 적어주세요.">
	    	      </div>	
		          <div class="form-group">
		            <label for="exampleFormControlInput1">가게위치</label>
		            <input type="text" class="form-control" id="address_kakao" name="rv_rest_addr" readonly />
	    	      </div>	
		          <div class="form-group">
		            <label for="exampleFormControlTextarea1">평점</label>
		            <input type="hidden" id="rating" name="rv_score">
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
		            <textarea class="form-control" id="contentArea" name="rv_content" rows="10"></textarea>
		          </div>
		        <button type="submit" class="btn btn-outline-secondary mt-2 regReviewBtn">등록하기</button>
		        <button type="button" class="btn btn-secondary mt-2 regReviewBtn" onclick="history.back()">목록으로</button>
		    </form>
    	</div>
    </div>
</body>
</html>