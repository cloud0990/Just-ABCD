<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
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
<section>
  <div class="p-5 bg-image" style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
  <div class="card mx-4 mx-md-5 shadow-5-strong" style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
    <div class="card-body py-5 px-md-5">
      <div class="row d-flex justify-content-center">
        <div class="col-lg-8"><h3 class="fw-bold mb-5" style="text-align: center;">Sign Up Now</h3>
          <form>
            <!-- Nickname input -->
            <div class="form-outline mb-4">
              <label class="form-label" for="uNm">Nickname</label>
              <input id="uNm" class="form-control" style="border:1px solid gray;" placeholder="Enter a Nickname"/>
            </div>
            <!-- Email input -->
            <div class="form-outline mb-4">
              <label class="form-label" for="uId">ID</label>
              <input id="uId" class="form-control" style="border:1px solid gray;" placeholder="Enter a Valid ID"/>
            </div>
            <!-- Password input -->
            <div class="form-outline mb-4">
              <label class="form-label" for="uPwd">Password</label>
              <input type="password" id="uPwd" class="form-control" style="border:1px solid gray;" placeholder="Enter Password"/>
            </div>
            <!-- Checkbox 
            <div class="form-check d-flex justify-content-center mb-4">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example33" checked />
              <label class="form-check-label" for="form2Example33">Subscribe to our newsletter</label>
            </div>-->
            <!-- Submit button -->
             <div class="text-center text-lg-start mt-4 pt-2">
            <button type="button" class="btn btn-primary btn-block mb-4" id="signUp" style="font-size: 15px;">SIGN UP</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Already a member? <a href="/login" class="link-danger">LOGIN</a></p>
          </div>
            <!-- Register buttons 
            <div class="text-center">
              <p>or sign up with:</p>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
              </button>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-google"></i>
              </button>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-twitter"></i>
              </button>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-github"></i>
              </button>
            </div>-->
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>