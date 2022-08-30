<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : MY CONTENT</title>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/board/main/selectMyBoard",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:'auto',
		width:1530,
		shrinkToFit: true,
		rownumbers: true,
		colNames:['게시글 번호', '제목', '내용', '작성일자', ''],
		colModel:[
					{name:'bIdx', index:'bIdx', align:"center", width:"40px"},
					{name:'bSubject', index:'bSubject', align:"center"},
					{name:'bContent', index:'bContent', align:"center"},
					{name:'bDate', index:'bDate', align:"center"},
					{name:'empty', index:'empty', align:"center", formatter:formatOpt, width:60}
				 ],
		pager : "#pager",
	    rowNum  : 10,
		rowList : [10, 20, 30],
		loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) {
 			$("#view_bIdx").val('');
 			if(index) {
 				var row = $("#mainGrid").jqGrid('getRowData', index);
 				$("#view_bIdx").val(row.bIdx);
 				$("#view_uIdx").val(row.uIdx);
 				$("#view_bSubject").val(row.bSubject);
 				$("#view_bContent").val(row.bContent);
 			}
	    }
	});
});


function formatOpt(cellvalue, options, rowObject) {
	var str = "";
	str += "<div class=\"btn-group\">";
	str += "<button type='button' class='btn btn-default btn-sm' style='padding:2px 10px 2px; border:1px solid gray; z-index:1;' onclick=\"javascript:fn_update_allow()\">수정</button>";
	str += "<button type='button' class='btn btn-default btn-sm' style='padding:2px 10px 2px; border:1px solid gray; z-index:1;' onclick=\"javascript:fn_board_delete('" + rowObject.bIdx + "')\">삭제</button>";
	str += "</div>"
	return str;
}

/* 게시글 수정 */
function fn_board_update(bIdx) {
	callAjax("/board/updateItem", $("#frm_update_board").serialize(), fn_update_result);
}
function fn_update_result(data) {
	if(data.resultCode=="S000") {
		alert("수정을 완료하였습니다.");
		fn_update_cancel();
		$("#mainGrid").setGridParam({url:"/board/main/selectAllBoard", page:1, datatype:"json"}).trigger("reloadGrid");					
	}else {
		alert("작업수행에 실패하였습니다.");
	}
}
/* 게시글 삭제 */
function fn_board_delete(bIdx) {
	ConfirmDialogToAjax("delete" 
		, "/board/deleteItem"     
		, "bIdx=" + bIdx         
		, function(data) {       
			if(data.resultCode=="S000") {
				$("#mainGrid").setGridParam({url:"/board/main/selectAllBoard", page:1, datatype:"json"}).trigger("reloadGrid");					
			}else {
				alert("작업수행에 실패하였습니다.");
			}
		}		
	);
}
function fn_update_allow() {
	$("#updateCancel_btn").show();
	$("#view_bSubject").prop("readonly", false);
	$("#view_bContent").prop("readonly", false);
}
function fn_update_cancel() {
	$("#view_bSubject").prop("readonly", true);
	$("#view_bContent").prop("readonly", true);
	$("#updateCancel_btn").hide();
}
</script>
</head>
<body>
<div id="content">
	<div role="content">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div class="form-group" style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;MY CONTENTS</span></label>
					<!-- <label class="control-labelcol-md-1" id="load_time"></label> -->
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
<form class="form-horizontal" id="frm_update_board" name="frm_update_board" onsubmit="return false">
	<div class="board_info" id="content" style="width:1000px; height:500px; margin:auto;">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;CONTENT DETAIL</span></label>
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<input type="hidden" id="view_bIdx" name="bIdx">
			<input type="hidden" id="view_uIdx" name="uIdx">
			<fieldset>	
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">TITLE</legend>
				<div>
					<input class="form-control input-sm" id="view_bSubject" name="bSubject" readonly="readonly"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">CONTENT</legend>
				<div>
					<input class="form-control input-sm" id="view_bContent" name="bContent" readonly="readonly"/>					
				</div>
				<br>
				<div id="updateCancel_btn" style="text-align: right; display:none;">
					<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_board_update($('#view_bidx').val())">수정</button>		
					<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_update_cancel();">취소</button>		
				</div>
			</fieldset>	
		</div>
	</div>
</form>

</body>
</html>