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
function readChatHistory(data) {
	$('.chatInput').css('display', 'inline');
	$('.chatContents').empty();
	$.each(data, function(i, chats){
		let date = chats.c_date;
		
		// console.log(moment(date).format("HH:mm"));
		if('${loginUser.u_id }' == chats.c_toId) {
			$('#fromUser').val(chats.c_fromId);														
			$('.chatOppnUserId').text(chats.c_fromId);
			let span1 = $("<span class='message-data-time'></span>").text(moment(date).format("MM/DD HH:mm"));							
			let div1 = $("<div class='message-data' style='text-align: right;'></div>").append(span1);
			let div2 = $("<div class='message my-message float-right'></div>").text(chats.c_content);
			let li1 = $("<li class='clearfix'></li>").append(div1, div2);
			$('.chatContents').append(li1);
		} else {
			$('#fromUser').val(chats.c_toId);							
			$('.chatOppnUserId').text(chats.c_toId);
			let span1 = $("<span class='message-data-time'></span>").text(moment(date).format("MM/DD HH:mm"));							
			let div1 = $("<div class='message-data' style='text-align: left;'></div>").append(span1);
			let div2 = $("<div class='message other-message float-left'></div>").text(chats.c_content);
			let li1 = $("<li class='clearfix'></li>").append(div1, div2);
			$('.chatContents').append(li1);
		}
		$('.chatContents').find($('li:last'))[0].scrollIntoView();
	})
}

function resetChatHistory(data) {
	$('.chatContents').empty();
	$.each(JSON.parse(data), function(i, chats){
		let date = chats.c_date;
		
		// console.log(moment(date).format("HH:mm"));
		if('${loginUser.u_id }' == chats.c_toId) {
			$('#fromUser').val(chats.c_fromId);														
			$('.chatOppnUserId').text(chats.c_fromId);
			let span1 = $("<span class='message-data-time'></span>").text(moment(date).format("MM/DD HH:mm"));							
			let div1 = $("<div class='message-data' style='text-align: right;'></div>").append(span1);
			let div2 = $("<div class='message my-message float-right'></div>").text(chats.c_content);
			let li1 = $("<li class='clearfix'></li>").append(div1, div2);
			$('.chatContents').append(li1);
		} else {
			$('#fromUser').val(chats.c_toId);							
			$('.chatOppnUserId').text(chats.c_toId);
			let span1 = $("<span class='message-data-time'></span>").text(moment(date).format("MM/DD HH:mm"));							
			let div1 = $("<div class='message-data' style='text-align: left;'></div>").append(span1);
			let div2 = $("<div class='message other-message float-left'></div>").text(chats.c_content);
			let li1 = $("<li class='clearfix'></li>").append(div1, div2);
			$('.chatContents').append(li1);
		}
		$('.chatContents').find($('li:last'))[0].scrollIntoView();
	});
};

$(function(){
	/* ------------ 채팅출력 ------------- */
	$('.oppnUser').click(function(){
		let oppnUserId = $(this).find('.aboutOppnUser').find('.oppnUserId').text();
		let myId = $(this).find('.myId').text();
		
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
		
		$.ajax({
			type: 'GET',
			url: 'chatting.print',
			dataType: 'json',
			data: {
				c_fromId: oppnUserId,
				c_toId: myId
			},
			success: function(data) { 
				readChatHistory(data);
			},
			error: function() {
				alert('error');
			}
		});
	});
	/* --------------------------------- */
	
	/* ------------ 채팅 보내기 ------------ */
	$('#submitChat').click(function(){
		let chatContent = $('#chatContent').val();
		let toUser = $('#toUser').val();
		let fromUser = $('#fromUser').val();
		let token = $('#token').val();
		
		if(chatContent == null || chatContent == "") {
			$('#chatContent').focus();
			return;
		}
		
		// console.log(chatContent);
		// console.log(toUser);
		// console.log(toUser);
		// console.log(token);
		
		$.ajax({
			type: 'GET',
			url: 'chat.submit',
			datatype: 'json',
			data: {
				c_content: chatContent,
				c_toId: toUser,
				c_fromId: fromUser,
				token: token
			},
			success: function(data){
				$('#chatContent').val("");
				$('.chatContents').empty();
				//alert('success');
				resetChatHistory(data);
			},
			error: function(){
				alert('error');
			}
		});
		
	});
	/* --------------------------------- */
});
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
                        	<img src="resources/profileImg/${oppn.u_profile }" alt="avatar" class="oppnUserImg" style="width: 50px; height: 50px;">
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
                            <span class="chatOppnUserImg"></span>
                            <div class="chat-about">
                                <h6 class="m-b-0 chatOppnUserId"><!-- toID, toUserImg --></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chat-history">
                    <ul class="m-b-0 chatContents"></ul>
                </div>
                <div class="chat-message clearfix chatInput" style="display: none;">
                    <div class="input-group mx-2">
                        <input type="text" id="chatContent" class="form-control" placeholder="Enter text here...">
                       	<input type="hidden" id="toUser" value="${loginUser.u_id }">
                       	<input type="hidden" id="fromUser" value="">                            
                       	<input type="hidden" id="token" value="${token }">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="submitChat"><i class="fa fa-send"></i></span>
                        </div> 
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