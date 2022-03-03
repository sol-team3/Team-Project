<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${loginUser.u_id }
	<div id="recruitWriteWrap">
		<div class="container">
			<div class="row">
				<div class="col-md-8 mx-auto">
					<div class="card">
						<form action="recruit.reg" enctype="multipart/form-data" method="post">
							<h4 style="text-align: center;">채용공고 등록</h4>
							<table class="table table-border">
								<tr>
									<th>상호명</th>
									<td colspan="2"><input class="form-control" name="rt_rest_name" placeholder="상호명을 입력해주세요" required></td>
								</tr>
								<tr>
									<th>상호등록</th>
									<td colspan="2"><input type="file" class="form-control" name="rt_rest_img"></td>
								</tr>
								<tr>
									<th>글제목</th>
									<td colspan="2"><input class="form-control" name="rt_title" placeholder="글 제목을 입력해주세요" required></td>
								</tr>
					            <tr>
	            					<th>가게위치</th>
	            					<td colspan="2">
	           							<input type="text" class="form-control my-1" id="sample6_postcode" placeholder="우편번호" name="u_add1" required>
										<input type="button" class="btn btn-outline-warning my-1 searchAddr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<input type="text" class="form-control my-1" id="sample6_address" placeholder="주소" name="u_add2" required>
										<input type="text" class="form-control my-1" id="sample6_detailAddress" placeholder="상세주소" name="u_add3" required>
										<input type="text" class="form-control my-1" id="sample6_extraAddress" placeholder="참고항목" name="u_address2">
	            					</td>
	    	      				</tr>
								<tr>
									<th>연령</th>
									<td colspan="2">
										<input type="checkbox" class="btn-check" id="btn-check1" name="rt_con_age" value="10대">
										<label class="btn btn-outline-warning" for="btn-check1">10대</label>
										<input type="checkbox" class="btn-check" id="btn-check2" name="rt_con_age" value="20대">
										<label class="btn btn-outline-warning" for="btn-check2">20대</label>
										<input type="checkbox" class="btn-check" id="btn-check3" name="rt_con_age" value="30대">
										<label class="btn btn-outline-warning" for="btn-check3">30대</label>
										<input type="checkbox" class="btn-check" id="btn-check4" name="rt_con_age" value="40대">
										<label class="btn btn-outline-warning" for="btn-check4">40대</label>
										<input type="checkbox" class="btn-check" id="btn-check5" name="rt_con_age" value="50대">
										<label class="btn btn-outline-warning" for="btn-check5">50대</label>
										<input type="checkbox" class="btn-check" id="btn-check6" name="rt_con_age" value="60대">
										<label class="btn btn-outline-warning" for="btn-check6">60대</label>
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td colspan="2"><select name="rt_con_gender" class="form-select" aria-label="Default select example" required>
										<option value="성별무관">성별무관
										<option value="남자만">남자만
										<option value="여자만">여자만
									</select></td>
								</tr>
								<tr>
									<th>급여</th>
									<td colspan="2"><input class="form-control" name="rt_pay" value="9160" required></td>
								</tr>
								<tr>
									<th>근무기간</th>
									<td class="rtDate"><input type="date" name="rt_start_date" class="form-control" required></td>
									<td class="rtDate"><input type="date" name="rt_end_date" class="form-control" required></td>
								</tr>
								<tr>
									<th>근무시간</th>
									<td class="rtTime"><input type="time" name="rt_start_time" class="form-control" required></td>
									<td class="rtTime"><input type="time" name="rt_end_time" class="form-control" required></td>
								</tr>
								<tr>
									<th>업직종</th>
									<td colspan="2"><input class="form-control" name="rt_rest_type" required></td>
								</tr>
								<tr>
									<th>고용형태</th>
									<td colspan="2"><input class="form-control" name="rt_con_type" required></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="2"><textarea rows="10" class="form-control" name="rt_content" required></textarea></td>
								</tr>
							</table>
							<input type="hidden" name="rt_u_id" value="${loginUser.u_id }">
							<button type="submit" class="btn btn-warning" style="width:100%;">게시글 등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>