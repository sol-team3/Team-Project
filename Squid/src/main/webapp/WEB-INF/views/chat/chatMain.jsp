<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	$('.oppnUser').click(function(){
		let oppnUserId = $(this).find('.aboutOppnUser').find('.oppnUserId').text();
		let myId = $(this).find('.myId').text();
		
		$.ajax({
			type: 'GET',
			url: 'chatting.print',
			data: {
				c_fromId: oppnUserId,
				c_toId: myId
			},
			success: function(result) { 
				console.log(result);
			}
		});
	});
});

function resultHTML(result){
	alert('저기찍히면'+result);
}
</script>
<body>
<div class="chatWarp">
<div class="container">
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card chat-app">
            <div id="plist" class="people-list">
                <ul class="list-unstyled chat-list mt-2 mb-0">
 	               	<c:forEach var="oppn" items="${oppnUsers }">      
               			<!-- LoginUser.u_id랑 같이 않은 것만 출력하자 -->
                    	<li class="clearfix action oppnUser">
                        	<img src="resources/img/${oppn.u_profile }" alt="avatar" class="oppnUserImg" style="width: 50px; height: 50px;">
                        	<div class="myId" style="display: none;">${loginUser.u_id }</div>
                        	<div class="aboutOppnUser">
	                            <div class="oppnUserId">${oppn.u_id }</div>
	                            <span class="oppnUserName">${oppn.u_name }</span>
    	                    </div>
                    	</li>
                   	</c:forEach>
                </ul>
            </div>
            <div class="chat">
                <div class="chat-header clearfix">
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- <img src="resources/profileImg/userprofile" alt="avatar"> -->
                            <div class="chat-about">
                                <h6 class="m-b-0 chatOppnUserId"><!-- toID, toUserImg --></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chat-history">
                    <ul class="m-b-0">
                        <li class="clearfix">
                            <div class="message-data" style="text-align: right;">
                                <%-- <span class="message-data-time"><fmt:formatDate value="03.16 14:42" type="date" pattern="MM.dd hh:mm"/></span> --%>
                            </div>
                            <!-- <div class="message other-message float-right"></div> -->
                        </li>   
                        <li class="clearfix">
                            <div class="message-data">
                                <%-- <span class="message-data-time"><fmt:formatDate value="03.16 14:42" type="date" pattern="MM.dd hh:mm"/></span> --%>
                            </div>
                            <!-- <div class="message my-message"></div> -->                                    
                        </li> 
                    </ul>
                </div>
                <div class="chat-message clearfix">
                    <div class="input-group mb-0">
                        <!-- <input type="text" class="form-control" placeholder="Enter text here...">                                    
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="height: 100%;"><i class="fa fa-send"></i></span>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>