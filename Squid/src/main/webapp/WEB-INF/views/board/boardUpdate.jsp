<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	    <form action="board.update" method="post" name = "boardUpdateForm" onsubmit="return boardUpdate();"  style="width : 80%; margin: 0 auto;">
			<table class = "table">
				<tr>
					<td colspan="2">
						<div>
							<h4>자유게시판</h4>
						</div>
					</td>
				</tr>
				<tr>
					<td width="10%" style="vertical-align: middle; border-top: solid 3px black; font-weight: bold">제목</td>
					<td style = " border-top: solid 3px black;"><input type="text" class="form-control" id="exampleFormControlInput1" name="b_title" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td width="10%" style="vertical-align: middle; font-weight: bold">작성자</td>
					<td><input class="form-control" type="text" value="${loginUser.u_id }" aria-label="readonly input example" readonly></td>
				</tr>
				<tr>
					<td colspan="2" ><textarea class="form-control" id="exampleFormControlTextarea1"  placeholder="내용을 입력해주세요" name="b_content" rows="15"></textarea></td>
				</tr>
			</table>
	        <div class="mb-3" align="right">
			     <button type="submit" class="btn btn-secondary" value = "${param.b_no }" name = "b_no">수정하기</button>
			     <button type="button" class="btn btn-light" onclick = "location.href ='board.go'">목록으로</button>
	        </div>       
    </form>
		
</body>
</html>