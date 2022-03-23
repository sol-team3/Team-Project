<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="recruitWriteWrap" style="margin-top: 70px;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 mx-auto">
					<div class="card">
						<form action="recruit.update" method="get" onsubmit="return recruitCheck();">
							<h4 style="text-align: center;">채용공고 수정</h4>
							<table class="table table-border">
								<tr>
									<th>상호명</th>
									<td colspan="2"><input class="form-control" name="rt_rest_name" value="${recruit.rt_rest_name }" required></td>
								</tr>
								<tr>
									<th>상호등록</th>
									<td colspan="2"><input type="text" class="form-control" name="rt_rest_img" id="restImg" value="${recruit.rt_rest_img }" readonly></td>
								</tr>
								<tr>
									<th>글제목</th>
									<td colspan="2"><input class="form-control" name="rt_title" value="${recruit.rt_title }" required></td>
								</tr>
								<tr>
									<th>연령</th>
									<td colspan="2">
										<input type="checkbox" class="btn-check" id="btn-age-check1" autocomplete="off" name="rt_con_age" value="10대">
										<label class="btn btn-outline-warning checkbox-label" for="btn-age-check1">10대</label>
										<input type="checkbox" class="btn-check" id="btn-age-check2" autocomplete="off" name="rt_con_age" value="20대">
										<label class="btn btn-outline-warning checkbox-label" for="btn-age-check2">20대</label>
										<input type="checkbox" class="btn-check" id="btn-age-check3" autocomplete="off" name="rt_con_age" value="30대">
										<label class="btn btn-outline-warning checkbox-label" for="btn-age-check3">30대</label>
										<input type="checkbox" class="btn-check" id="btn-age-check4" autocomplete="off" name="rt_con_age" value="40대">
										<label class="btn btn-outline-warning checkbox-label" for="btn-age-check4">40대</label>
										<input type="checkbox" class="btn-check" id="btn-age-check5" autocomplete="off" name="rt_con_age" value="50대">
										<label class="btn btn-outline-warning checkbox-label" for="btn-age-check5">50대</label>
										<input type="checkbox" class="btn-check" id="btn-age-check6" autocomplete="off" name="rt_con_age" value="60대">
										<label class="btn btn-outline-warning checkbox-label" for="btn-age-check6">60대</label>
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
									<td colspan="2"><input class="form-control" name="rt_pay" value="${recruit.rt_pay}" required></td>
								</tr>
								<tr>
									<th>근무기간</th>
									<td class="rtDate"><input type="text" name="rt_start_date" id="startDate" class="form-control" value="<fmt:formatDate value="${recruit.rt_start_date}" type="date" pattern="MM/dd/yyyy"/>" readonly></td>
									<td class="rtDate"><input type="text" name="rt_end_date" id="endDate" class="form-control" value="<fmt:formatDate value="${recruit.rt_end_date}" type="date" pattern="MM/dd/yyyy"/>" readonly></td>
								</tr>
								<tr>
									<th>근무시간</th>
									<td class="rtTime"><input type="time" name="rt_start_time" id="startTime" class="form-control" value="${recruit.rt_start_time}" required></td>
									<td class="rtTime"><input type="time" name="rt_end_time" id="endTime" class="form-control" value="${recruit.rt_end_time}" required></td>
								</tr>
								<tr>
									<th>업직종</th>
									<td colspan="2"><input class="form-control" name="rt_rest_type" value="${recruit.rt_rest_type }" required></td>
								</tr>
								<tr>
									<th>고용형태</th>
									<td colspan="2"><input class="form-control" name="rt_con_type" value="${recruit.rt_con_type }" required></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="2"><textarea rows="10" class="form-control" name="rt_content" required>${recruit.rt_content }</textarea></td>
								</tr>
							</table>
							<input type="hidden" name="rt_u_id" value="${loginUser.u_id }">
							<input type="hidden" name="rt_no" value="${recruit.rt_no}">
							<input type="hidden" value="${token }" name="token">
							<button type="submit" class="btn btn-warning" style="width:100%;">게시글 수정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>