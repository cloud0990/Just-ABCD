<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<title>HOME : CHAT</title>
<script type="text/javascript">

let sock = new SockJS("http://localhost:9090/chat/main/echo");

$(function(){
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	$("#chat_btn").click(function() {
		sendMessage();
		$("#message").val("");
	});
	$("#end_btn").click(function() {
		onClose();
	});
});

function sendMessage() {
	var msg = $("#message").val();
	if(msg == "") msg = "메세지 없음";
	sock.send(msg);
}
function onMessage(data) {
	var datas = data.data;
	$("#message_area").append('${sessionVo.user_nm}' + " 님" + "<br>" + " : " + datas + "<br/>");
//  	var user_id = data.userId;
//  	var message = data.message;
// 	$("#message_area").append(user_id + "<br/>" + message);
}
function onClose(data) {
	$("#message").val("");
	$("#message_area").append("<br>" + '${sessionVo.user_nm}' + " 님께서 퇴장하셨습니다.<br>");
}
</script>
<style type="text/css">
#chat_btn, #end_btn {
	font-size:15px;
	font-weight: 700;
}
</style>
</head>
<body>

<form method="post">
	<div style="width: 500px; margin:auto; margin-top: 100px; border:1px solid gray; border-radius: 5px;">
		<textarea class="form-control input-sm" id="message" style="width:100%; resize: none;"></textarea>
		<div style="margin-left:367px; margin-bottom: 30px;">
			<button type="button" class='btn btn-default btn-sm' id="chat_btn">전송</button>
			<button type="button" class='btn btn-default btn-sm' id="end_btn">종료</button>
		</div>
		<div style="border: 1px solid gray; width:100%; height:300px; border-radius:5px;">
			<div id="message_area" style="padding:20px; overflow: auto; overflow-x:hidden;"></div>
		</div>
	</div>
</form>

</body>
</html>