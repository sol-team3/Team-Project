<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="job.update" name = "jobUpdateForm"  method = "post" enctype = "multipart/form-data" onsubmit= "return jobUpdate();">
	<table class= "table table-bordered">
		<tr>
			<th>사업장 이름</th>
			<td><input name = "j_rest_name"></td>
		</tr>
		<tr>
			<th>잉여 날짜</th>
			<td><input type="date" name = "j_start_date"> <strong>~</strong> <input name ="j_end_date"  type="date" ></td>
		</tr>
		<tr>
			<th>잉여 시간</th>
			<td><input type="time" name = "j_start_time"> <strong>~</strong> <input type = "time" name ="j_end_time"></td>
		</tr>
		<tr>
			<th>시급</th>
			<td><input name = "j_pay">&nbsp;원</td>
		</tr>
		<tr>
			<th>업무 설명</th>
			<td><textarea name = "j_content" rows = "10"></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input type =  "file" name = "j_pic"></td>
		</tr>
		<tr>
			<td colspan = "2" align="center">
				<button name = "j_no">수정</button>&nbsp;
				<button onclick = "history.back()">뒤로가기</button>
			</td>
		</tr>
	</table>
	</form>

</body>
</html>