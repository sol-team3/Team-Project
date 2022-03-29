<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="row" style="margin-top: 120px;">
<div class="card">

	<form action="job.update" name = "jobUpdateForm"  method = "post" enctype = "multipart/form-data" onsubmit= "return jobUpdate();"  style="width : 90%; margin: 0 auto;">
	  <table class="table">
	    <tr><td colspan="3" style="border-bottom:  solid 3px #b3b3b3; "><div><h4>구직 게시판</h4></div></td></tr>
	  	<tr>
	  		<td colspan = "3">
	  			<table class="table" id = "jobInfo">
				<tr>
					<td  id = "jobInfoTitle"  colspan = "2" style="background-color: white">기본정보
					<span style = "color: red; font-weight: lighter; font-size: 10px;">&nbsp;*기본정보 수정은 내정보수정에서 해주세요!</span>
				</td>
				</tr>
				<tr>
					<td rowspan = "3" align="center" style="border-bottom : solid 1px #f7d511"><img src="resources/profileImg/${loginUser.u_profile }" height="100" width = "50"></td>
					<td>
						<span style="font-weight : bold; font-size : 20px;">${loginUser.u_name }</span>
						&nbsp;•&nbsp;${loginUser.u_gender }&nbsp;•&nbsp; 
						<c:set var= "birth" value = "${loginUser.u_birth }" ></c:set>
						${fn:substring(birth, 0,2) }년생
					</td>
				</tr>
				<tr>
					<td style="border-bottom : solid 1px #f7d511">
						<span style="font-weight : bold; font-size : 15px;">연락처</span>&nbsp;&nbsp;${loginUser.u_phonNumber }<br>
						<span style="font-weight : bold; font-size : 15px;">주소</span>&nbsp;&nbsp;${loginUser.u_address }
					</td>
				</tr>
			</table>
	  		
	  		</td>
	  	</tr>
	  	<tr>
			<th scope="row" style="width: 15%; vertical-align : middle; font-size: 18px;">제목</th>
	  		<td colspan = "2"><input type = "text" name = "j_title" type="text" class="form-control" value = "${param.j_title }" placeholder="제목을 수정해주세요"></td>
	  	</tr>
	    <tr>
			<th scope="row" style="width: 15%; vertical-align : middle; font-size: 18px;">잉여 날짜</th>
			<td style="width: 42.5%;"><input name = "j_start_date" type="date" class="form-control" value = "${param.j_start_date }"></td>
			<td style="width: 42.5%;"><input  name = "j_end_date" type="date" class="form-control" value = "${param.j_end_date }"></td>
	    </tr>
	    <tr>
			<th scope="row" style="width: 15%; vertical-align : middle; font-size: 18px;">잉여 시간</th>
			<td style="width: 42.5%;"><input name = "j_start_time" type="time" class="form-control"  value = "${param.j_start_time }"></td>
			<td style="width: 42.5%;"><input  name = "j_end_time" type="time" class="form-control" value = "${param.j_end_time }"></td>
	    </tr>
	        <tr>
    	<th scope="row" style="width: 15%; vertical-align : middle; font-size: 18px;">희망 지역</th>
    	<td colspan = "2">
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="서울" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox1">서울</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="경기" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox2">경기</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="인천" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox3">인천</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="부산" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox4">부산</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="대구" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox5">대구</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="대전" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox6">대전</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="경남" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox7">경남</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="전남" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox8">전남</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="충남" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox9">충남</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="광주" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox10">광주</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="울산" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox11">울산</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="경북" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox12">경북</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="전북" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox13">전북</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="충북" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox14">충북</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox15" value="강원" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox15">강원</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox16" value="제주" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox16">제주</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox17" value="세종" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox17">세종</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox18" value="전국" name = "j_area">
			  <label class="form-check-label" for="inlineCheckbox18">전국</label>
			</div>
    	</td>
  		</tr>
	    <tr>
			<th scope="row" style="width: 15%; vertical-align : middle; font-size: 18px;">자기소개</th>
	  		<td colspan = "2"><textarea class="form-control" aria-label="With textarea" name = "j_intro" rows = "15" placeholder="자기소개 내용을 수정해주세요">${param.j_intro }</textarea></td>
	  	</tr>
	  	<tr>
	  		<th scope="row" style="width: 15%; vertical-align : middle; font-size: 18px;">파일첨부</th>
	 		<td colspan = "2"><input type = "file" name = "j_pic" class="form-control" value = "${param.j_pic }"></td> 		
	  	</tr>
	</table>
	<div align="center">
		 	<button name = "j_no" class="btn btn-outline-warning" value= "${param.j_no }">수정</button>&nbsp;
			<button onclick = "history.back()" class="btn btn-outline-warning">뒤로가기</button> 	
	</div>
	</form>
	
	</div>
</div>
</div>

</body>
</html>