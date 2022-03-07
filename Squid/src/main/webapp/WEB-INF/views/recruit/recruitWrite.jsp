<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="recruit.write" method = "post"  enctype = "multipart/form-data" name = "recruitWriteForm" onsubmit = "return recruitWrite();">
	<input type="hidden" name="token" value="${token }">
	<table class= "table table-bordered">
		<tr>
			<th>사업장 이름</th>
			<td><input name = "rt_rest_name" placeholder="사업장명(가게 이름)을 입력해 주세요."></td>
		</tr>
		<tr>
			<th>잉여 날짜</th>
			<td><input type="date" name = "rt_start_date"> <strong>~</strong> <input name ="rt_end_date"  type="date" ></td>
		</tr>
		<tr>
			<th>잉여 시간</th>
			<td><input type= "time" name = "rt_start_time"> <strong>~</strong> <input type= "time" name ="rt_end_time"></td>
		</tr>
		<tr>
			<th>시급</th>
			<td><input name = "rt_pay" placeholder ="시급을 입력해주세요.">&nbsp;원</td>
		</tr>
		<tr>
			<th>업무 설명</th>
			<td><textarea name = "rt_content" rows="10" placeholder = "업무에 대해 설명해 주세요."></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input type =  "file" name = "rt_pic"></td>
		</tr>
		<tr>
			<td align="right" colspan="2">
			<button>등록</button>&nbsp;
			<button onclick = "history.back()">목록으로</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>