<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="recruit.update" name = "recruitUpdateForm"  method = "post" enctype = "multipart/form-data" onsubmit= "return recruitUpdate();">
	<table class= "table table-bordered">
		<tr>
			<th>사업장 이름</th>
			<td><input name = "rt_rest_name"></td>
		</tr>
		<tr>
			<th>잉여 날짜</th>
			<td><input type="date" name = "rt_start_date"> <strong>~</strong> <input name ="rt_end_date"  type="date" ></td>
		</tr>
		<tr>
			<th>잉여 시간</th>
			<td><input type="time" name = "rt_start_time"> <strong>~</strong> <input type = "time" name ="rt_end_time"></td>
		</tr>
		<tr>
			<th>시급</th>
			<td><input name = "rt_pay">&nbsp;원</td>
		</tr>
		<tr>
			<th>업무 설명</th>
			<td><textarea name = "rt_content" rows = "10"></textarea></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type =  "file" name = "rt_pic"></td>
		</tr>
		<tr>
			<td colspan = "2" align="center">
				<button name = "rt_no">수정</button>&nbsp;
				<button onclick = "history.back()">뒤로가기</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>