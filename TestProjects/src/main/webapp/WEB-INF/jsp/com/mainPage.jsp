<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : USER</title>
<style type="text/css">
input:focus{
	-webkit-box-shadow: none;
	box-shadow:none;
	outline:2px solid #d50000;
}
</style>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/main/selectUserList",
		loadtext:"로딩 중..",
		datatype:"json",
		mtype:"POST",
		height:'auto',
		width:800,
		shrinkToFit: true,
		colNames:['회원번호', '아이디', '비밀번호', '닉네임', ''],
		colModel: [
					{name:'uIdx', index:'uIdx', align:"center", width:"30px"},
					{name:'uId',  index:'uId',  align:"center", width:"70px"},
					{name:'uPwd', index:'uPwd', align:"center", width:"70px"},
					{name:'uNm',  index:'uNm',  align:"center", width:"70px"},
					{name:'empty',  index:'empty',  align:"center", formatter:formatOpt, width:40 }
	              ],
	    rowNum: 30,
	    rowList: [30, 60, 90],
	    rownumbers: true,
	    pager : '#pager',
	    viewrecords: true,
		loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) { //index = 선택된 row의 index
 			$("#view_uIdx").val('');
 			if(index) {
 				var row = $("#mainGrid").jqGrid('getRowData', index);
 				$("#view_uIdx").val(row.uIdx);
 				$("#view_uId").val(row.uId);
 				$("#view_uPwd").val(row.uPwd);
 				$("#view_uNm").val(row.uNm);
 			}
	    },
	    gridComplete: function() {
	    	$("#mainGrid td").css("vertical-align", "middel");
	    } 
	});
});

//cellvalue : format 지정값
//options : Element 포함하는 객체 (rowId=row의 id, colModel=colModel배열의 컬럼 속성 객체)
//rowObject : datatype 옵션에 정의된 형식으로 표현된 row 데이터
function formatOpt(cellvalue, options, rowObject) {
	var str = "";
	str += "<div class=\"btn-group\">";
	str += "<button type='button' class='btn btn-default btn-sm' style='padding:2px 10px 2px; border:1px solid gray; z-index:1;' onclick=\"javascript:fn_update_allow()\">수정</button>";
	str += "<button type='button' class='btn btn-default btn-sm' style='padding:2px 10px 2px; border:1px solid gray; z-index:1;' onclick=\"javascript:fn_user_delete('" + rowObject.uIdx + "')\">삭제</button>";
	str += "</div>"
	return str;
}

/* 사용자 수정 */
function fn_user_update(uIdx) {
	callAjax("/main/updateUser", $("#frm_update_user").serialize(), fn_update_result);
}
function fn_update_result(data) {
	if(data.resultCode=="S000") {
		//swal("성공", "작업을 성공적으로 수행하였습니다.", "success");							
		alert("수정을 완료하였습니다.");
		fn_update_cancel();
		$("#mainGrid").setGridParam({url:"/main/selectUserList", page:1, datatype:"json"}).trigger("reloadGrid");					
	}else {
		//swal("실패", "작업수행에 실패하였습니다.", "warning");
		alert("작업수행에 실패하였습니다.");
	}
}

function fn_update_allow() {
	$("#updateCancel_btn").show();
	$("#view_uId").prop("readonly", false);
	$("#view_uPwd").prop("readonly", false);
	$("#view_uNm").prop("readonly", false);
}

function fn_update_cancel() {
	$("#view_uId").prop("readonly", true);
	$("#view_uPwd").prop("readonly", true);
	$("#view_uNm").prop("readonly", true);
	$("#updateCancel_btn").hide();
}

/* 사용자 삭제 */
function fn_user_delete(uIdx) {
	ConfirmDialogToAjax("delete" //text
		, "/main/deleteUser"     //target
		, "uIdx=" + uIdx         //form
		, function(data) {       //callback
			var resultCode = data.resultCode;
			if(resultCode=="S000") {
				alert("삭제가 완료되었습니다.");
				$("#mainGrid").setGridParam({url:"/main/selectUserList", page:1, datatype:"json"}).trigger("reloadGrid");					
			}else {
				alert("작업수행에 실패하였습니다.");
			}
		}		
	);
}
</script>
</head>
<body>
<div id="content" style="float:left;">
	<div role="content">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div class="form-group" style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;USERS</span></label>
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<fieldset>		
				<div class="row" id="tableWrap">
					<table id="mainGrid"></table>
					<div id="pager"></div>
				</div>
			</fieldset>	
		</div>
	</div>
</div>
<form class="form-horizontal" id="frm_update_user" name="frm_update_user" onsubmit="return false">
	<div class="user_info" id="content" style="float:right; width:730px; height:500px;">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;USER DETAIL</span></label>
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<input type="hidden" id="view_uIdx" name="uIdx">
			<fieldset>		
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">ID</legend>
				<div>
					<input class="form-control input-sm" id="view_uId" name="uId" readonly="readonly"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">Password</legend>
				<div>
					<input class="form-control input-sm" id="view_uPwd" name="uPwd" readonly="readonly"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">Nickname</legend>
				<div>
					<input class="form-control input-sm" id="view_uNm" name="uNm" readonly="readonly"/>					
				</div>
				<br>
				<div id="updateCancel_btn" style="text-align: right; display:none; clear:both;">
					<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_user_update($('#view_uidx').val())">수정</button>		
					<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_update_cancel();">취소</button>		
				</div>
			</fieldset>	
		</div>
	</div>
</form>

</body>
</html>