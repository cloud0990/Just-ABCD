<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$("#signUp").click(function(){
		var uId  = $("#uId").val();
		var uPwd = $("#uPwd").val();
		var uNm  = $("#uNm").val();

		if(uId=='' || uPwd=='' || uNm=='') {
			$('input[type="text"], input[type="password"]').css("border", "2px solid red");
			$('input[type="text"], input[type="password"]').css("box-shadow", "0 0 3px red");
			alert('아이디를 입력해주세요');
		}else {
			$.post("/signUp/insertUser", {uId:uId, uPwd:uPwd, uNm:uNm},
			function(data){
				var code = data.resultCode;
				var msg  = data.resultMsg;
				
				if(code='S000'){
					location.href='/login';
					alert(msg);
				}else if(code='S999'){
					$("#uId").focus();
					$("#uId").attr("style", "border: 2px solid red;");
					$("#uPwd").focus();
					$("#uPwd").attr("style", "border: 2px solid red;");					
					$("#uNm").focus();
					$("#uNm").attr("style", "border: 2px solid red;");
					alert(msg);
					return false;
				}
			});
		}
	});
}); //end : function
</script>
</head>
<body>

<form>
<h3 style="text-align: center; margin-top: 100px;">회원가입</h3>
<hr>
<div style=" margin:auto; margin-top:100px; width:500px;">
  <!-- Id input -->
  <div class="form-outline mb-4">
    <label class="form-label" for="uId">아이디</label>
    <input type="text" id="uId" class="form-control" style="border:1px solid gray;" placeholder="Id"/>
  </div>

  <!-- Password input -->
  <div class="form-outline mb-4">
    <label class="form-label" for="uId">비밀번호</label>
    <input type="password" id="uPwd" class="form-control" style="border:1px solid gray;" placeholder="Password"/>
  </div>
  
   <!-- Password input -->
  <div class="form-outline mb-4">
	<label class="form-label" for="uId">닉네임</label>
    <input type="text" id="uNm" class="form-control" style="border:1px solid gray;" placeholder="Nickname">
  </div>

  <!-- Submit button -->
  <button type="button" class="btn btn-primary btn-block mb-4" id="signUp">회원가입</button>
  <div class="text-center">
  	<p><a href="/login">로그인</a></p>
  </div>
</div>  
</form>

</body>
</html>