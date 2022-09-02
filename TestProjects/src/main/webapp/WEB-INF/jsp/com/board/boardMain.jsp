<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : MAIN CONTENTS</title>
<style type="text/css">
input:button {
	margin-top:0px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#view_b_content").keypress(function(e){
		if(e.keyCode && e.keyCode == 13) {
			$("#update_btn").trigger('click'); //trigger() : 이벤트 강제 발생
		}
	});
	$("#srch_text").keypress(function(e){
		if(e.keyCode && e.keyCode == 13) {
			if($("#srch_text").val()=='') {
				$("#srch_user_board option:eq(0)").prop("selected", true);
				//$("#srch_user_board").val("srch_all").prop("selected", true); //value==srch_all 인 option 선택
			}
			$("#srch_btn").trigger('click'); //trigger() : 이벤트 강제 발생
		}
	});
	/* 검색필터 */
	$("#srch_btn").click(function(){
		if($("#srch_text").val()=='') {
			$("#srch_user_board option:eq(0)").prop("selected", true);
		}
		fn_user_board_srch();
	});
	
	$("#mainGrid").jqGrid({
		url:"/board/main/selectAllBoard",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:650,
		width:830,
		pagerpos:'center',
		shrinkToFit: true,
		colNames:['번호', '작성자', '제목', '내용', '', 'b_date', 'b_upd_date'],
		colModel:[
					{name:'board_id', index:'board_id', align:"center", width:"30px"},
					{name:'user_nm', index:'user_nm', align:"center", width:"60px"},
					{name:'b_subject', index:'b_subject', align:"center"},
					{name:'b_content', index:'b_content', align:"center"},
					{name:'empty', index:'empty', align:"center", formatter:formatOpt, width:60},
					{name:'b_date', index:'b_date', hidden:true},
					{name:'b_upd_date', index:'b_upd_date', hidden:true}
				 ],
		pager : "#pager",
	    rowNum  : 20,
		rowList : [20, 40, 60],
		loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) {
 			if(index) {
 				$("#view_board_id").val('');
 				var row = $("#mainGrid").jqGrid('getRowData', index);
 				$("#view_board_id").val(row.board_id);
 				$("#view_user_nm").val(row.user_nm);
 				$("#view_b_subject").val(row.b_subject);
 				$("#view_b_content").val(row.b_content);
 				$("#view_b_date").val(row.b_date);
 				$("#view_b_upd_date").val(row.b_upd_date);
 			}
	    }
	});
});

function formatOpt(cellvalue, options, rowObject) {
	var str = "";
	str += "<div class=\"btn-group\">";
	str += "<button type='button' class='btn btn-light sm-1' style='padding:2px 10px 2px; z-index:1;' onclick=\"javascript:fn_update_allow('" + rowObject.user_idx + "')\">수정</button>";
	str += "<button type='button' class='btn btn-light sm-1' style='padding:2px 10px 2px; z-index:1;' onclick=\"javascript:fn_board_delete('" + rowObject.board_id + "','" + rowObject.user_idx + "')\">삭제</button>";
	str += "</div>"
	return str;
}

/* 게시글 수정 */
function fn_board_update(board_id) {
	if($("#view_b_subject").val()=='') {
		alert("제목을 입력해주세요.");
		$("#view_b_subject").focus();
		return;
	}
	if($("#view_b_content").val()=='') {
		alert("내용을 입력해주세요.");
		$("#view_b_content").focus();
		return;
	}
	
	if(!confirm("수정하시겠습니까?")) return;
	callAjax("/board/updateItem", $("#frm_update_board").serialize(), fn_update_result);
}
/* 게시글 수정 callback fn */
function fn_update_result(data) {
	if(data.resultCode=="S000") {
		alert("수정을 완료하였습니다.");
		
		fn_update_cancel();
		
		$("#mainGrid").setGridParam({url:"/board/main/selectAllBoard", page:1, datatype:"json"}).trigger("reloadGrid");		
		
		$("#view_b_subject").attr("disabled", "disabled");
		$("#view_b_content").attr("disabled", "disabled");
		
		$("#view_user_nm").val('');
		$("#view_b_subject").val('');
		$("#view_b_content").val('');
		$("#view_b_date").val('');
		$("#view_b_upd_date").val('');
	}else {
		alert("작업수행에 실패하였습니다.");
	}
}
/* 게시글 삭제 */
function fn_board_delete(board_id, user_idx) {
	if('${sessionVo.user_idx}' != user_idx) {
		alert('본인의 게시글만 삭제할 수 있습니다.');
		return;
	}
	ConfirmAjax("delete"
		, "/board/deleteItem"     
		, "board_id=" + board_id         
		, function(data) {       
			if(data.resultCode=="S000") {
				$("#mainGrid").setGridParam({url:"/board/main/selectAllBoard", page:1, datatype:"json"}).trigger("reloadGrid");	
				
				$("#view_b_subject").attr("disabled", "disabled");
				$("#view_b_content").attr("disabled", "disabled");
				
				$("#view_user_nm").val('');
				$("#view_b_subject").val('');
				$("#view_b_content").val('');
				$("#view_b_date").val('');
				$("#view_b_upd_date").val('');
			}else {
				alert("작업수행에 실패하였습니다.");
			}
		}		
	);
}
/* 수정 버튼 */
function fn_update_allow(user_idx) {
	if('${sessionVo.user_idx}' != user_idx) {
		alert('본인의 게시글만 수정할 수 있습니다.');
		return;
	}
	$("#updateCancel_btn").show();
	
//	$("#view_b_subject").prop("disabled", false);
//	$("#view_b_content").prop("disabled", false);
	$("#view_b_subject").removeAttr("disabled");
	$("#view_b_content").removeAttr("disabled");
}
/* 수정 취소 버튼 */
function fn_update_cancel() {
	//$("#view_b_subject").prop("disabled", true);
	//$("#view_b_content").prop("disabled", true);
	$("#view_b_subject").attr("disabled", "disabled");
	$("#view_b_content").attr("disabled", "disabled");

	$("#updateCancel_btn").hide();
}
/* 검색 */
function fn_user_board_srch() {
	$("#mainGrid").clearGridData();
	$("#mainGrid").setGridParam({
		   url:"/board/main/selectAllBoard"
		 , postData: {
				  srch_user_board: $("#srch_user_board").val()
		   		, srch_text : $("#srch_text").val()	
		   }
		 , datatype:"json"
	}).trigger('reloadGrid');
}
</script>
</head>
<body>

<div id="content" style="float:left;">
	<div role="content">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div class="form-group" style="flex:center; float:left;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;게시글</span></label>
				</div>
				<!-- 검색 -->
				<div class="input-group rounded" style="width:500px; float: right;">
				  <select id="srch_user_board" name="srch_user_board" style="border-radius: 3px; font-size: 13px; outline:none; border:none; margin-right:3px; width:100px;">
				  	<option value='srch_all'>전 체</option>
				  	<option value='srch_user_nm'>작성자</option>
				  	<option value='srch_b_subject'>제 목</option>
				  	<option value='srch_b_content'>내 용</option>
				  </select>
				  <input type="search" id="srch_text" name="srch_text" class="form-control rounded" placeholder="검색" aria-label="Search" aria-describedby="search-addon"/>
				  <button type="button" class="btn btn-default btn-sm" style="padding:2px 10px 2px; box-shadow: none;" id="srch_btn">
				 	 <span class="input-group-text border-0" id="search-addon"><i class="fas fa-search"></i></span>
				  </button>
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
	<div class="board_info" id="content" style="width:680px; float:right;">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;게시글 상세정보</span></label>
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<input type="hidden" id="view_board_id" name="board_id">
			<fieldset>	
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">작성자</legend>
				<div style="width:200px; text-align: left;">
					<input class="form-control input-sm" id="view_user_nm" disabled="disabled"/>					
				</div>	
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">제목</legend>
				<div>
					<input type="text" class="form-control input-sm" id="view_b_subject" name="b_subject" disabled="disabled"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">내용</legend>
				<div>
					<input type="text" class="form-control input-sm" id="view_b_content" name="b_content" disabled="disabled"/>					
				</div>
				<div style="float:left; width:310px;">
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">작성일</legend>
					<input class="form-control input-sm" id="view_b_date" disabled="disabled"/>					
				</div>
				<div style="float:left; width:310px;">
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">수정일</legend>
					<input class="form-control input-sm" id="view_b_upd_date" disabled="disabled"/>					
				</div>
			</fieldset>	
			<br>
			<div id="updateCancel_btn" style="text-align: right; display:none;">
				<button type='button' id="update_btn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_board_update($('#view_board_id').val())">수정</button>		
				<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_update_cancel();">취소</button>		
			</div>
		</div>
	</div>
</form>

</body>
</html>