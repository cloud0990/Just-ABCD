<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : CREATE CONTENT</title>
<script type="text/javascript">
$(function(){
	$("#createBtn").click(function(){
		var bSubject = $("#view_bSubject").val().trim();
		var bContent = $("#view_bContent").val().trim();
		if(bSubject=='' || bContent=='') {
			$('input[type="text"]').css("border", "2px solid red");
			$('input[type="text"]').css("box-shadow", "0 0 3px red");
			alert('제목을 입력해주세요');
		}else {
			$.post("/board/createItem"
			, $("#frm_create_board").serialize()
			, function(data) {
				if(data.resultCode=="S000") {
					alert("게시글 작성이 완료되었습니다.\n홈 화면으로 돌아갑니다.");
					location.href='/board/main/myMain';
				}else if(data.resultCode=="S999"){
					//$("#view_bSubject").focus();
					$("#view_bSubject").attr("style", "border: 2px solid red;");
					//$("#view_bContent").focus();
					$("#view_bContent").attr("style", "border: 2px solid red;");
					return false;
				}
			});
		}
	});
});
function fn_cancel_create() {
	$("#view_bSubject").val('');
	$("#view_bContent").val('');
}
</script>
</head>
<body>

<form class="form-horizontal" id="frm_create_board" name="frm_create_board" onsubmit="return false">
	<div class="board_create" id="content" style="width:1000px; height:500px; margin:auto; margin-top:100px;">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;CREATE CONTENT</span></label>
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<fieldset>	
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">TITLE</legend>
				<div>
					<input type="text" class="form-control input-sm" id="view_bSubject" name="bSubject"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">CONTENT</legend>
				<div>
					<input type="text" class="form-control input-sm" id="view_bContent" name="bContent"/>					
				</div>
				<br>
				<div style="text-align: right;">
					<button type='button' id="createBtn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;">작성</button>		
					<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_cancel_create();">취소</button>		
				</div>
			</fieldset>	
		</div>
	</div>
</form>

</body>
</html>