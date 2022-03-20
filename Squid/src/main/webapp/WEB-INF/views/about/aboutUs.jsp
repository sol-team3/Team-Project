<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
</script>
<style>
.aboutTeam:hover {
	cursor: pointer;
}
.a {
	border: 1px solid #FFD365;
	border-radius: 10px;
	background: white;
	width: 250px;
	height: 230px;
	margin: 0 30px;;
	margin-top: 40px;
	box-shadow: 5px 5px #FFD365;
	text-align: center;
	float: left;
	
}

.b {
	border: 1px solid #FFD365;
	border-radius: 10px;
	background: white;
	width: 480px;
	height: 230px;
	margin: 0 30px;
	margin-top: 40px;
	box-shadow: 5px 5px #FFD365;
	text-align: center;
	float: left;
}

.c {
	border: 5px dotted #FFD365;
	border-radius: 50%;
	background: white;
	width: 200px;
	height: 200px;
	margin-top: 40px;
	margin-left: 100px;
	text-align: center;
	float: left;
}

h5 {
	font-weight: bold;
}
</style>
<body>
<div id="aboutUs" style="background: #FFFBE9; height: 2500px;">
<!-- About Us -->
	<!-- Our Mission -->
		<div id="mission" style="background: #FFD365; height: 250px; margin-top: 15px;">
			<div class="container">
				<div class="row">
					<div class="mission text-center mt-5 aboutUsTitle" style="font-weight: bold; font-size: 25pt;">
						프로젝트 목표
					</div>
				</div>
				<div class="row">
					<div class="missionDetail text-center" style="margin-top: 20px; font-size: 12pt;">
						<a style="font-weight: bold;">"</a> 단기 근무의 구인/구직 서비스를 제공함으로써 <p>고용불안의 문제점에 도움이 되고자 <a style="color:#D67D3E; font-weight: bold;">오징어 프로젝트</a>를 추진하게 되었습니다. <a style="font-weight: bold;">"</a> <p>
						<button type="button" id="idChk" class="btn btn-outline-warning my-1 searchAddr" style="color: #D67D3E;" onclick="window.open('https://github.com/sol-team3/Team-Project')">GitHub</button>
					</div>
				<div style="margin-left: 47%">
				</div>
				</div>
			</div>
		</div>
	<!-- //Our Mission -->

	<!-- Team -->	
		<div id="team" style="margin-top: 50px;">
			<div class="container">
				<div class="row text-center">
				  <div class="col-sm-4">
				    <div class="card aboutTeam">
				      <div class="card-body">
				      	<div id="squidImg" style="width: 100px; width: 150px; margin-left: 25%;"><img alt="팀원사진" src="resources/img/squid.png" style="width: 100%;"></div>
				        <h5 class="card-title">오준석</h5>
						  <button class="btn btn-outline-warning my-1 searchAddr" style="color: #D67D3E" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">리더 오징어</button>
				      </div>
				    </div>
				  </div>
				  <div class="col-sm-4">
				    <div class="card aboutTeam">
				      <div class="card-body">
				      	<div style="width: 100px; width: 150px; margin-left: 25%;"><img alt="팀원사진" src="resources/img/squid.png" style="width: 100%;"></div>
				        <h5 class="card-title">노솔리</h5>
						  <button class="btn btn-outline-warning my-1 searchAddr" style="color: #D67D3E" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">팀원 오징어</button>
				      </div>
				    </div>
				  </div>
				  <div class="col-sm-4">
				    <div class="card aboutTeam">
				      <div class="card-body">
				        <div style="width: 100px; width: 150px; margin-left: 25%;"><img alt="팀원사진" src="resources/img/squid.png" style="width: 100%;"></div>
				        <h5 class="card-title">이태림</h5>
						  <button class="btn btn-outline-warning my-1 searchAddr" style="color: #D67D3E" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">팀원 오징어</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 자기소개 -->
					<!-- 준석 -->
					<div class="collapse" id="collapseExample">
						<div id="TeamWrap">
								<div class="container">
									<div class="row">
										<div class="col-md-8 mx-auto">
											<div class="card" style="width: 500px;">
												<h4 style="text-align: center; font-weight: bold; color: #D67D3E">오징어 프로젝트</h4>
													<table class="table table-border" style="vertical-align: middle">
														<tr>
															<td style="width: 30%;">
																<img src="resources/squid/junseok.png" width="120px;">
															</td>
															<td style="width: 70%;">
																<table style="text-align: left; width: 100%;">
																	<tr>
																		<td colspan="2" style="font-weight: bold; font-size: 14pt;">오 준 석</td>
																	</tr>
																	<tr> <td colspan="2"></td> </tr>
																	<tr>
																		<td style="width: 20%;">직급 : </td>
																		<td align="left">리더 오징어</td>
																	</tr>
																	<tr>
																		<td style="width: 20%;">역할 : </td>
																		<td align="left">ㅇㅇ</td>
																	</tr>
																	<tr>
																		<td colspan="2" style="text-align: right;">
																			<button type="button" id="idChk" class="btn btn-outline-warning my-1 searchAddr" onclick="window.open('https://github.com/oh971021')">GitHub</button>							
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
					<!-- //준석 -->
					<!-- 솔리 -->
					<div class="collapse" id="collapseExample2">
						<div id="TeamWrap">
								<div class="container">
									<div class="row">
										<div class="col-md-8 mx-auto">
											<div class="card" style="width: 500px;">
												<h4 style="text-align: center; font-weight: bold; color: #D67D3E">오징어 프로젝트</h4>
													<table class="table table-border" style="vertical-align: middle">
														<tr>
															<td style="width: 30%;">
																<img src="resources/squid/solri.jpg" width="120px;">
															</td>
															<td style="width: 70%;">
																<table style="text-align: left; width: 100%;">
																	<tr>
																		<td colspan="2" style="font-weight: bold; font-size: 14pt;">노 솔 리</td>
																	</tr>
																	<tr> <td colspan="2"></td> </tr>
																	<tr>
																		<td style="width: 20%;">직급 : </td>
																		<td align="left">팀원 오징어</td>
																	</tr>
																	<tr>
																		<td style="width: 20%;">역할 : </td>
																		<td align="left">ㅇㅇ</td>
																	</tr>
																	<tr>
																		<td colspan="2" style="text-align: right;">
																			<button type="button" id="idChk" class="btn btn-outline-warning my-1 searchAddr" onclick="window.open('https://github.com/soljjang777')">GitHub</button>							
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
					<!-- //솔리 -->
					<!-- 태림 -->
					<div class="collapse" id="collapseExample3">
						<div id="TeamWrap">
								<div class="container">
									<div class="row">
										<div class="col-md-8 mx-auto">
											<div class="card" style="width: 500px;">
												<h4 style="text-align: center; font-weight: bold; color: #D67D3E">오징어 프로젝트</h4>
													<table class="table table-border" style="vertical-align: middle">
														<tr>
															<td style="width: 30%;">
																<img src="resources/squid/tearim.jpg" width="120px;">
															</td>
															<td style="width: 70%;">
																<table style="text-align: left; width: 100%;">
																	<tr>
																		<td colspan="2" style="font-weight: bold; font-size: 14pt;">이 태 림</td>
																	</tr>
																	<tr> <td colspan="2"></td> </tr>
																	<tr>
																		<td style="width: 20%;">직급 : </td>
																		<td align="left">팀원 오징어</td>
																	</tr>
																	<tr>
																		<td style="width: 20%;">역할 : </td>
																		<td align="left">ㅇㅇ</td>
																	</tr>
																	<tr>
																		<td colspan="2" style="text-align: right;">
																			<button type="button" id="idChk" class="btn btn-outline-warning my-1 searchAddr" onclick="window.open('https://github.com/itaeee')">GitHub</button>							
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
					<!-- //태림 -->
				<!-- //자기소개 -->
			</div>
		</div>
	<!-- //Team -->	

	<!-- About -->	
		<div id="about" style="clear:both;">
			<div class="container">
				<div class="row">
					<div class="about text-center mt-5 aboutUsTitle" style="font-weight: bold; font-size: 18pt;">
						프로젝트 개요
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="aboutDetail text-center">
						<a style="color:#D67D3E; font-weight: bold; font-size: 17pt;">오징어</a>는  <a style="font-weight: bold; font-size: 15pt;">"</a><a style="color:#D67D3E; font-weight: bold; font-size: 17pt;">오</a>늘의 <a style="color:#D67D3E; font-weight: bold; font-size: 17pt;">징</a>검다리로 <a style="color:#D67D3E; font-weight: bold; font-size: 17pt;">어</a>우러지다라<a style="font-weight: bold; font-size: 15pt;">"</a>는 의미로<p> 아르바이트, 일용근로 형태의 구직자와 구인자의 징검다리가 되어주는<p> 역할을 하는 서비스를 하고자 본 프로젝트의 타이틀을 오징어로 정하게 되었습니다.
					</div>
				</div>
			</div>
		</div>
	<!-- //About -->
		
	<!-- Problem -->
	<div id="problem"  style="margin-top: 100px;">
		<div class="container">
			<div style="font-weight: bold; font-size: 18pt; text-align: center;">실생활 문제점 및 현상</div>	
				<div style="margin-left: 15%; width: 930px;">	
				 <div class="a" id="problem1_Div">
				 	<p align="center" style="font-weight: bold; margin-top: 70px;">최저임금 임상</p> 
				 	<a style="color:#D67D3E; font-weight: bold;">5.1%↑</a>
				 </div> 
				 <div class="a" id="problem2_Div">
					 <p align="center" style="font-weight: bold; margin-top: 70px;">코로나 이후 알바구직난 심화</p> 
					 <a>작년보다 어렵다</a> <a style="color:#D67D3E; font-weight: bold;">83.5%</a>
				 </div>
				 <div class="a" id="problem3_div">
				 	<p align="center" style="font-weight: bold; margin-top: 70px;">고용원 있는 자영업자 비율</p> 
				 	<a>2018년 비교</a><a style="color:#D67D3E; font-weight: bold;"> 7.2%↓</a>
				 </div> 				
				</div> 
		</div> <!-- //container(Problem) -->
	</div>
	<!-- //Problem -->
	
	<!-- 화살표 -->
	<div style="width: 200px; margin: 0 auto; margin-top: 300px;">
		<img src="resources/img/화살표.png" width="100%">
	</div>
	<!-- //화살표 -->
	
	<!-- Phenomenon -->
	<div id="phenomenon">
		<div class="container">
			<div style="margin-left: 8%; width: 1100px;">
				<div class="b" id="phenomenon1_Div">
				 	<p align="center" style="font-weight: bold; margin-top: 70px; font-size: 25pt;">고용주</p> 
				 	<a style="color:#D67D3E; font-weight: bold;">인건비, 주휴수당 부담</a>
				</div> 
				<div class="b" id="phenomenon2_Div">
				 	<p align="center" style="font-weight: bold; margin-top: 70px; font-size: 25pt;">근로자</p> 
				 	<a style="color:#D67D3E; font-weight: bold;">고용환경 불안으로 생계유지의 문제점</a>
				 </div> 
			 </div>
		</div>
	</div>
	<!-- //Phenomenon -->
	
	<!-- solution -->
	<div style="clear: both; margin-top: 360px;">
		<div class="container" style="margin-top: 200px;">
				<div class="row">
					<div class="mission text-center mt-5 aboutUsTitle" style="font-weight: bold; font-size: 25pt;">솔루션</div>
						<div class="mission text-center mt-5 aboutUsTitle" style="font-weight: bold;">단기 아르바이트 구인/구직 활동 서비스 제공</div>
						<div class="c" id="solution1_Div">
					 		<p align="center" style="font-weight: bold; margin-top: 70px;">학업과 단기아르바이트 병행</p> 
					 	</div> 
					 	<div class="c" id="solution2_Div">
						 	<p align="center" style="font-weight: bold; margin-top: 70px;">투잡족 사회인</p> 
					 	</div>
					 	<div class="c" id="solution3_div">
					 	<p align="center" style="font-weight: bold; margin-top: 70px;">취미형 부업희망자</p> 
					 	</div> 				
					 	<div class="c" id="solution4_div">
					 	<p align="center" style="font-weight: bold; margin-top: 70px;">일용 근로, 단기 아르바이트 고용주</p> 
					 	</div> 		
				</div>
			</div>	
	</div>
	<!-- //solution -->
<!-- //About Us -->

</div>
</body>
</html>