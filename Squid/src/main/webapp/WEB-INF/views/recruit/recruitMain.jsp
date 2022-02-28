<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="recruitWrap">
		<div class="container">
			<div class="row mt-5">
				<div class="col col-md-12">
					<form class="d-flex form-group" action="recruit.search">
						<div class="card w-100 text-center">
						  	<div class="card-body">
								<table class="table table-bordered">
									<tr>
										<th scope="row" style="width: 15%;"><select class="form-control text-center">
											<option value="1">제목+내용
											<option value="2">지역
											<option value="3">작성자
										</select></th>
										<td colspan="2" style="width: 95%;"><input class="form-control"></td>
									</tr>
									<tr>
										<th scope="row" style="width: 15%; vertical-align : middle;">잉여 날짜</th>
										<td style="width: 42.5%;"><input type="date" class="form-control"></td>
										<td style="width: 42.5%;"><input type="date" class="form-control"></td>
									</tr>
									<tr>
										<th scope="row" style="width: 10%; vertical-align : middle;">잉여 시간</th>
										<td style="width: 42.5%;"><input type="time" class="form-control"></td>
										<td style="width: 42.5%;"><input type="time" class="form-control"></td>
									</tr>
								</table>
					 	 	</div>
						  	<div class="card-body text-muted text-center">
						    	<button class="btn btn-outline-warning">상세 검색</button>
						    	<button class="btn btn-outline-warning">초기화</button>
						  	</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col">1</div>
				<div class="col">1</div>
				<div class="col">1</div>
				<div class="col">1</div>
			</div>
			<div class="row">
				<div class="col">1</div>
				<div class="col">1</div>
				<div class="col">1</div>
				<div class="col">1</div>
			</div>
		</div>
	</div>
</body>
</html>