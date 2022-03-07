<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

    $("#sample5_address").click(function(){ 
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	var addr = data.address // 최종 주소 변수
            	
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
            }
        }).open();
    	$(this).close();
    });
</script>
</head>
<body>

<form action="job.write" method = "post"  enctype = "multipart/form-data" name = "jobWriteForm" onsubmit = "return jobWrite();">
	<input type="hidden" name="token" value="${token }">
	<table class= "table table-bordered">
		<tr>
			<th>사업장 이름</th>
			<td><input name = "j_rest_name" placeholder="사업장명(가게 이름)을 입력해 주세요."></td>
		</tr>
		<tr>
			<th>잉여 날짜</th>
			<td><input type="date" name = "j_start_date"> <strong>~</strong> <input name ="j_end_date"  type="date" ></td>
		</tr>
		<tr>
			<th>잉여 시간</th>
			<td><input type= "time" name = "j_start_time"> <strong>~</strong> <input type= "time" name ="j_end_time"></td>
		</tr>
		<tr>
			<th>시급</th>
			<td><input name = "j_pay" placeholder ="시급을 입력해주세요.">&nbsp;원</td>
		</tr>
		<tr>
			<th>업무 설명</th>
			<td><textarea name = "j_content" rows="10" placeholder = "업무에 대해 설명해 주세요."></textarea></td>
		</tr>
<!-- 		<tr>
			<th>위치</th>
			<td><input type = "text" name = "j_rest_location" id = "sample5_address" placeholder ="위치"></td>
		</tr> -->
		<tr>
			<th>파일 첨부</th>
			<td><input type =  "file" name = "j_pic"></td>
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