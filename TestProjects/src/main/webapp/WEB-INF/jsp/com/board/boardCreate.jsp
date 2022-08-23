<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 : 게시글 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/assets/plugin/js/jqgrid/grid.locale-en.min.js"></script>
<script src="/assets/plugin/js/jqgrid/jquery.jqGrid.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$("#logoutBtn").click(function(){
		location.href="/logout";		
	});
});
</script>
<script type="text/javascript">
$(function(){
	$("#createBtn").click(function(){
		var bSubject = $("#bSubject").val().trim();
		var bContent = $("#bContent").val().trim();
		var uIdx     = '${sessionVo.uIdx}';
		var uNm      = '${sessionVo.uNm}';
		if(bSubject=='' || bContent=='') {
			$('input[type="text"]').css("border", "2px solid red");
			$('input[type="text"]').css("box-shadow", "0 0 3px red");
			alert('제목을 입력해주세요');
		}else {
			$.post("/board/createItem", {bSubject:bSubject, bContent:bContent, uIdx:uIdx, uNm:uNm},
			function(data) {
				var code = data.resultCode;
				var msg  = data.resultMsg;
				if(code=="S000") {
					location.href='/board/main';
					alert(msg);
				}else if(code=="S999") {
					$("#bSubject").focus();
					$("#bSubject").attr("style", "border: 2px solid red;");
					$("#bContent").focus();
					$("#bContent").attr("style", "border: 2px solid red;");
					alert(msg);
					return false;
				}
			});
		}
	});
});
</script>
</head>
<body>
<form>
<h3 style="text-align: center; margin-top: 100px;">게시글 작성</h3>
<hr>
<div style=" margin:auto; margin-top:100px; width:700px;">
  <div class="form-outline mb-4">
    <label class="form-label" for="uId">제목</label>
    <input type="text" id="bSubject" class="form-control" style="border:1px solid gray;" placeholder="Subject"/>
  </div>

  <div class="form-outline mb-4">
    <label class="form-label" for="uId">내용</label>
    <input type="text" id="bContent" class="form-control" style="border:1px solid gray;" placeholder="Content"/>
  </div>

  <button type="button" class="btn btn-primary btn-block mb-4" id="createBtn">작성</button>
  <div class="text-center">
  	<p><a href="/board/main">게시판 홈</a></p>
  </div>
</div>  
</form>

</body>
</html>