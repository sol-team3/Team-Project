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
<body>
<div class="chatWarp">
<div class="container">
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card chat-app">
            <div id="plist" class="people-list">
                <ul class="list-unstyled chat-list mt-2 mb-0">
	               	<c:forEach var="c" items="${chats }">         
	               		<c:forEach var="u" items="${oppns }">   
	               			<c:if test="${c.c_oppn == u.u_id }">    	
		                    	<li class="clearfix action">
		                        	<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="avatar">
		                        	<div class="about">
			                            <div class="oppnUserId">${c.c_oppn }</div>
			                            <span class="oppnUserName">${u.u_name }</span>
		    	                    </div>
		                    	</li>
	                    	</c:if>
                    	</c:forEach>
                	</c:forEach>
                </ul>
            </div>
            <div class="chat">
                <div class="chat-header clearfix">
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                            </a>
                            <div class="chat-about">
                                <h6 class="m-b-0">toID, toUserImg</h6>
                            </div> -->
                        </div>
                    </div>
                </div>
                <div class="chat-history">
                    <ul class="m-b-0">
                    	<%-- <c:forEach var="c" items="${chats }">
                    		<c:if test="${c.c_toId == loginUser.u_id }">
                    			<c:if test="${c.c_fromId != loginUser.u_id }">
			                        <li class="clearfix">
			                            <div class="message-data" style="text-align: right;">
			                                <span class="message-data-time"><fmt:formatDate value="${c.c_date }" type="date" pattern="MM.dd hh:mm"/></span>
			                            </div>
			                            <div class="message other-message float-right">${c.c_content }</div>
			                        </li>   
		                        </c:if>
	                        </c:if>    
	                        <c:if test="${c.c_fromId == loginUser.u_id }">
                   				<c:if test="${c.c_toId != loginUser.u_id }">
			                        <li class="clearfix">
			                            <div class="message-data">
			                                <span class="message-data-time"><fmt:formatDate value="${c.c_date }" type="date" pattern="MM.dd hh:mm"/></span>
			                            </div>
			                            <div class="message my-message">${c.c_content }</div>                                    
			                        </li> 
		                        </c:if>
	                        </c:if>            	
                    	</c:forEach> --%>
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