<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script type="text/javascript">
$(function(){
	$("#login").click(function(){
		uId  = $("#uId").val();
		uPwd = $("#uPwd").val();
		if(uId=='' || uPwd=='') {
			$('input[type="text"], input[type="password"]').css("border", "2px solid red");
			$('input[type="text"], input[type="password"]').css("box-shadow", "0 0 3px red");
			alert('아이디를 입력해주세요');	
		}else {
			$.post("/checkLoginUser", {uId:uId, uPwd:uPwd},
			function(data){
				var code = data.resultCode;
				var msg  = data.resultMsg;
				if(code=='S000') {
					location.href='/main';
					alert(msg);
				} else if(code=='S999') {
					$("#uId").focus();
					$("#uId").attr("style", "border: 2px solid red;");
					$("#uPwd").focus();
					$("#uPwd").attr("style", "border: 2px solid red;");
					alert(msg);
					return false;
				}
			});
		}
	});
});	
</script>
<script type="text/javascript">
$(function(){
	//저장된 쿠키값을 가져온다. 없으면 공백
	var key = getCookie("key");
	$("#uId").val(key);
	//처음 페이지 로딩 시, ID 입력칸에 ID가 표시된 상태인 경우
	if($("#uId").val() != "") {
		$("#rememberId").attr("checked", true); //chekced 상태로 둔다. 
	}
	//체크박스에 변화가 있는 경우
	$("#rememberId").change(function(){
		if($("#rememberId").is(":checked")) {
			setCookie("key", $("#uId").val(), 7); //7일 동안 쿠키 보관
		}else { //체크 해제 시, 쿠키 삭제
			deleteCookie("key");			
		}	
	});
	//rememberId가 체크된 상태에서 ID를 입력하는 경우
	$("#uId").keyup(function(){
		if($("#rememberId").is(":checked")) {
			setCookie("key", $("#uId").val(), 7);
		}
	});
});
//쿠키저장 : 쿠키는 window.document.cookie에 저장된다.
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString()); //escape() : 한글깨짐 막기
	document.cookie = cookieName + "=" + cookieValue;
}
//쿠키삭제
function deleteCookie(cookieName) {
	var expire = new Date(); //현재시간 불러오기
	expire.setDate(expire.getDate() - 1);
	document.cookie = cookieName + "=" + "; expires=" + expire.toGMTString();
}
//쿠키가져오기
function getCookie(cookieName) {
	cookieName = cookieName + "=";
	var cookieData = document.cookie; //현재 cookie값 불러오기
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1) end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);	
}
</script>
</head>
<body>

<form>
<h3 style="text-align: center; margin-top: 100px;">로그인</h3>
<hr>
<div style=" margin:auto; margin-top:100px; width:500px;">
  <!-- 아이디 -->
  <div class="form-outline mb-4" >
    <label class="form-label" for="uId">아이디</label>
    <input type="text" id="uId" class="form-control" style="border:1px solid gray;" placeholder="Id"/>
  </div>
  <div>
    <input class="form-check-input" type="checkbox" id="rememberId" checked/>
  	<label class="form-check-label" for="user_id"> 아이디 저장</label>
  </div><br>
  <!-- 비밀번호 -->
  <div class="form-outline mb-4">
    <label class="form-label" for="uPwd">비밀번호</label>
    <input type="password" id="uPwd" class="form-control" style="border:1px solid gray;" placeholder="Password"/>
  </div>
  <!-- 로그인 -->
  <button type="button" class="btn btn-primary btn-block mb-4" id="login">로그인</button>
  <!-- 회원가입 -->
  <div class="text-center">
    <p><a href="/signUp/view">회원가입</a></p>
  </div>
</div>  
</form>

</body>
</html>