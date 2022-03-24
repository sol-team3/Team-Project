<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>오징어</title>
<link rel="shortcut icon" href="resources/img/squid.png" type="image/x-icon">

<!-- CSS -->    
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/review.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/chat.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/recruit.css">
<link rel="stylesheet" href="resources/css/job.css">
<link rel="stylesheet" href="resources/css/scrap.css">
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Sunflower:wght@300&display=swap">

<!-- JS -->
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<script type="text/javascript" src="resources/js/recruit.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/job1.js"></script>
<script type="text/javascript" src="resources/js/scrap.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/moment.js"></script>
<script type="text/javascript" src="https://kit.fontawesome.com/ae61323fbc.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e4a3aeb46d3edd233004fa8b9b332aa&libraries=services"></script>

<script>
	let time = <%=session.getMaxInactiveInterval()%> // 세션설정시간 들고옴
	console.log("세션시간 :" + time);
	
	function session_time() {   // 1초씩 카운트      
		let minutes = Math.floor(time / 60);
		let seconds = time % 60
		if(minutes < 10) {
			minutes = '0'+ minutes;
		}
		if(seconds < 10){
			seconds = '0' + seconds;
		}
	    m = minutes + ":" + seconds; // 남은 시간 계산, Math.floor는 소수점이하 버림        
	    let msg = "<font color='#334756'>" + m + "</font>"; 
	    $("#ViewTimer").html(msg); // div 영역에 보여줌 
	    time--;                  // 1초씩 감소
	    if (time < 0) {          // 시간이 종료 되었으면..        
	        clearInterval(tid);     // 타이머 해제(함수 리턴을 중지)
	        alert("로그인 세션이 만료되었습니다.");
	        location.href="login.go";
	
	    }      
	}
	function session_resettime() {
		clearInterval(tid);
	}
	$(function TimerStart() {
		if('${loginUser.u_id}' != null) {
		tid=setInterval('session_time()',1000) // 1초마다 session_time()호출 			
		}
	})

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
   
    var dateFormat = "mm/dd/yy",
    from = $( "#startDate" )
      .datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        to.datepicker( "option", "minDate", getDate( this ) );
      }),
    to = $( "#endDate" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1
    })
    .on( "change", function() {
      from.datepicker( "option", "maxDate", getDate( this ) );
    });

	function getDate( element ) {
	    var date;
	    try {
	      date = $.datepicker.parseDate( dateFormat, element.value );
	    } catch( error ) {
	      date = null;
	    }
	
	    return date;
	}

	
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
	
	myModal.addEventListener('shown.bs.modal', function () {
	  myInput.focus()
	});
	
	// --------- 네비 액션 --------- //
	$('.nav-item').click(function(){
		$(this).css('font-color', 'blakc').css('font-weight', 'bold');
	});
	// ------------------------- //
	
});
</script>
<script type="text/javascript">
function loginOut() {
    let ok = confirm('정말 로그아웃 하시겠습니까?');
    if (ok) {
       location.href = 'loginout.do';
    }
 }
</script>
<style type="text/css">
body {
	background-color: #fffbe9;
}

header {
	background-color: white;
	font-size: 13pt;
}
</style>
</head>
<body>
<!-- Header -->
	<header>
	<!-- Nav -->
		<div style="position: fixed; display: block; background-color: #FFF89A; width: 100%; top: 0; z-index: 1; border-bottom: 2px solid #AD8B73;">
			<nav class="navbar navbar-expand-lg navbar-light px-5">
				<div class="container-fluid">
					<div style="width: 40px; margin-left: 100px;">
						<img src="resources/img/오징어r1.png" width="100%">
					</div>
					<a class="navbar-brand" href="index.go" style="color: #D67D3E; font-family: 'Do Hyeon', sans-serif; font-size: 20pt;"> &nbsp;ㅇ.ㅇ</a>
					<div style="width: 40px;">
						<img src="resources/img/오징어r1.png" width="100%">
					</div>					
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="recruit.go" style="font-weight: bold;">구인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="job.go" style="font-weight: bold;">구직</a>
							</li>					
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">
								커뮤니티
								</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item" href="board.go">자유게시판</a></li>
									<li><a class="dropdown-item" href="review.go">후기게시판</a></li>
								</ul>
							</li>
							<c:if test="${loginUser == null}">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">
								회원관리
								</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item" href="login.go">로그인</a></li>
									<li><a class="dropdown-item" href="join.go">회원가입</a></li>
								</ul>
							</li>
							</c:if>
							<c:if test="${loginUser != null}">
							<li class="nav-item dropdown">
								<div style="margin-left: 13px; margin-top: 8px; float: left;">
									<div id="ViewTimer">30:00</div> <!-- <a href="javascript:session_resettime();">연장</a> -->
								</div>	
								<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"  style="color: white;">
								<div style="margin-left: 15px; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; border: 1px solid #D1D1D1; display: inline-block;">
									<img src="resources/profileImg/${loginUser.u_profile}" style="cursor: pointer; width: 100%; height: 100%; object-fit: cover;" class="navProfileImg">
								</div>	
								</a>
									<ul class="dropdown-menu" >
										<li><a class="dropdown-item" href="myprofil.go">내 계정</a></li>
										<li><a class="dropdown-item" href="chat.go?u_id=${loginUser.u_id }">쪽지함</a></li>
										<li><a class="dropdown-item" href="scrap.go?s_u_id=${loginUser.u_id }">나의 관심글</a></li>
										<li><a class="dropdown-item" onclick="loginOut();">로그아웃</a></li>
									</ul>
							</li>
							</c:if>
						</ul>
					</div> <!-- div : collapse navbar-collapse justify-content-end -->
				</div>
			</nav>
		</div>
	<!-- //Nav -->
	</header>
<!-- //Header -->

<!-- Content -->

   <jsp:include page="${contentPage }"></jsp:include>
<!-- //Content -->

<!-- Footer -->
   <div class="card text-left" style="margin-top: 0px;">
      <div class="container">
         <div class="row">
            <div class="card-body col-md-6">
               <h5 style="color: #D67D3E; font-family: 'Do Hyeon', sans-serif; font-size: 20pt;">오징어 프로젝트</h5>
               <p class="card-text"> "오늘의 징검다리로 어우러지다"라는 의미로 아르바이트, 일용근로 형태의 구직자와 구인자의 징검다리가 되어주는 역할을 하는 서비스를 하고자 본 프로젝트입니다.</p>
               <button type="button" onclick="goAboutUs()" class="btn btn-outline-warning">자세히 보기</button>
            </div>
            <div class="card-body col-md-6">
               <form action="${pageContext.request.contextPath }/mail/mailSend" method="post" role="form">
                  <h5 style="color: #D67D3E; font-family: 'Do Hyeon', sans-serif; font-size: 20pt;">Contact Us</h5>
                  <input class="form-control" type="text" name="name" placeholder="Name" style="width:50%; float:left;" required>
                  <input class="form-control col-6" type="text" name="Last_name" placeholder="Last Name" style="width:50%; float:left;" required>
                  <input class="form-control" type="email" name="email" placeholder="Email" required>
                  <input class="form-control" type="text" name="phone" placeholder="Phone" required>
                  <textarea class="form-control" name="message" placeholder="Message" rows="3" required></textarea>
                  <input class="btn btn-outline-secondary form-control input-sm" type="submit" value="SEND">
               </form>
            </div>
         </div>
         <div class="row" style="text-align: right;">
            <p class="text-left" style="font-family: 'Nanum Myeongjo', serif; font-size: 12pt;">copyright&copy;2022.All Right Reserves by Squid</p>
         </div>
      </div>
   </div>
<!-- //Footer -->
</body>
</html>