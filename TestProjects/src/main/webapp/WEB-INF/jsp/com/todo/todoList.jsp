<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : TODO LIST</title>
</head>
<script type="text/javascript">
$(function(){
	/* 로그인 엔터 이벤트 */
	$("#create_td_nm").keypress(function(e){
		if(e.keyCode && e.keyCode == 13) {
			$("#create_btn").trigger('click'); //trigger() : 이벤트 강제 발생
		}
	});
	/* 예정 리스트 */
	$("#pre_todo").jqGrid({
		url:"/todo/main/getTodoPreListRetrieve",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:280,
		width:360,
		//autowidth:true,
		shrinkToFit: true,
		colNames:['작성자', '내용', 'td_id', 'user_idx', 'td_date', 'td_upd_date'],
		colModel:[
					{name:'user_nm', index:'user_nm', align:"left", width:"70px"},
					{name:'td_nm', index:'td_nm', align:"left"},		
					{name:'td_id', index:'td_id', hidden:true},
					{name:'user_idx', index:'user_idx', hidden:true},
					{name:'td_date', index:'td_date', hidden:true},
					{name:'td_upd_date', index:'td_upd_date', hidden:true}
				 ],
		pager : "#pager_pre_list",
		pagerpos:'left',
	    rowNum  : 10,
	    loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) {
			if(index) {
				var row = $("#pre_todo").jqGrid('getRowData', index);
				$("#view_td_id").val('');
				$("#view_td_id").val(row.td_id);

				$("#view_user_nm").val(row.user_nm);
				$("#view_td_nm").val(row.td_nm);
				$("#view_td_date").val(row.td_date);
				$("#view_td_upd_date").val(row.td_upd_date);
				//$("input:radio[name='td_tp']").val('00').prop("checked", true);		
				$("#view_tp_pre").prop("checked", true);
				
				$("#view_td_nm").prop("disabled", false);
			}
	    }
	});	
	/* 진행중 리스트 */
	$("#now_todo").jqGrid({
		url:"/todo/main/getTodoNowListRetrieve",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:280,
		width:350,
		shrinkToFit: true,
		colNames:['작성자', '내용', 'td_id', 'user_idx', 'td_date', 'td_upd_date'],
		colModel:[
					{name:'user_nm', index:'user_nm', align:"left", width:"70px"},
					{name:'td_nm', index:'td_nm', align:"left"},
					{name:'td_id', index:'td_id', hidden:true},
					{name:'user_idx', index:'user_idx', hidden:true},
					{name:'td_date', index:'td_date', hidden:true},
					{name:'td_upd_date', index:'td_upd_date', hidden:true}
				 ],
		pager : "#pager_now_list",
	    rowNum  : 25,
		pagerpos:'left',
	    loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) {
			if(index) {
				var row = $("#now_todo").jqGrid('getRowData', index);
				$("#view_td_id").val('');
				$("#view_td_id").val(row.td_id);

				$("#view_user_nm").val(row.user_nm);
				$("#view_td_nm").val(row.td_nm);
				$("#view_td_date").val(row.td_date);
				$("#view_td_upd_date").val(row.td_upd_date);
				$("#view_tp_now").prop("checked", true);
				
				$("#view_td_nm").prop("disabled", false);
			}
	    }
	});	
	/* 완료 리스트 */
	$("#success_todo").jqGrid({
		url:"/todo/main/getTodoSuccessListRetrieve",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:280,
		width:350,
		shrinkToFit: true,
		colNames:['작성자', '내용', 'td_id', 'user_idx', 'td_date', 'td_upd_date'],
		colModel:[
					{name:'user_nm', index:'user_nm', align:"left", width:"70px"},
					{name:'td_nm', index:'td_nm', align:"left"},
					{name:'td_id', index:'td_id', hidden:true},
					{name:'user_idx', index:'user_idx', hidden:true},
					{name:'td_date', index:'td_date', hidden:true},
					{name:'td_upd_date', index:'td_upd_date', hidden:true}
				 ],
		pager : "#pager_success_list",
	    rowNum  : 25,
		pagerpos:'left',
	    loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) {
			if(index) {
				var row = $("#success_todo").jqGrid('getRowData', index);
				$("#view_td_id").val('');
				$("#view_td_id").val(row.td_id);

				$("#view_user_nm").val(row.user_nm);
				$("#view_td_nm").val(row.td_nm);
				$("#view_td_date").val(row.td_date);
				$("#view_td_upd_date").val(row.td_upd_date);
				$("#view_tp_success").prop("checked", true);
				
				$("#view_td_nm").prop("disabled", false);
			}
	    }
	});	
	/* 보류 리스트 */
	$("#re_todo").jqGrid({
		url:"/todo/main/getTodoRestListRetrieve",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:280,
		width:350,
		shrinkToFit: true,
		colNames:['작성자', '내용', 'td_id', 'user_idx', 'td_date', 'td_upd_date'],
		colModel:[
					{name:'user_nm', index:'user_nm', align:"left", width:"70px"},
					{name:'td_nm', index:'td_nm', align:"left"},
					{name:'td_id', index:'td_id', hidden:true},
					{name:'user_idx', index:'user_idx', hidden:true},
					{name:'td_date', index:'td_date', hidden:true},
					{name:'td_upd_date', index:'td_upd_date', hidden:true}
				 ],
		pager : "#pager_re_list",
	    rowNum  : 25,
		pagerpos:'left',
	    loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) {
			if(index) {
				var row = $("#re_todo").jqGrid('getRowData', index);
				$("#view_td_id").val('');
				$("#view_td_id").val(row.td_id);

				$("#view_user_nm").val(row.user_nm);
				$("#view_td_nm").val(row.td_nm);
				$("#view_td_date").val(row.td_date);
				$("#view_td_upd_date").val(row.td_upd_date);
				$("#view_tp_re").prop("checked", true);
				
				$("#view_td_nm").prop("disabled", false);
			}
	    }
	});	
});

/* 삭제 */
function fn_mng_delete() {
	if(!confirm("삭제하시겠습니까?")) return;
	callAjax("/todo/main/deleteTodo",  $("#frm_todo").serialize(), fn_mng_delete_result);
}
/* 수정 */
function fn_mng_update() {
	if($("#view_td_nm").val()=='') {
		$("#view_td_nm").css("border", "2px solid red");
		$("#view_td_nm").css("box-shadow", "0 0 3px red");
		alert("내용을 입력하세요.");
		return;
	}
	if(!confirm("수정하시겠습니까?")) return;
	callAjax("/todo/main/updateTodo", $("#frm_todo").serialize(), fn_mng_update_result);
}
/* 삭제 결과 callback */
function fn_mng_delete_result(data) {
	if(data.resultCode=="S000") {
		$("#pre_todo").setGridParam({url:"/todo/main/getTodoPreListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#now_todo").setGridParam({url:"/todo/main/getTodoNowListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#success_todo").setGridParam({url:"/todo/main/getTodoSuccessListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#re_todo").setGridParam({url:"/todo/main/getTodoRestListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		
		$("#view_user_nm").val('');
		$("#view_td_nm").val('');
		$("#view_td_date").val('');
		$("#view_td_upd_date").val('');
		$("input:radio[name='td_tp']").prop("checked", false);
	}else {
		alert("작업수행에 실패하였습니다.");
	}
}
/* 수정 결과 callback */
function fn_mng_update_result(data) {
	if(data.resultCode=="S000"){
		$("#pre_todo").setGridParam({url:"/todo/main/getTodoPreListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#now_todo").setGridParam({url:"/todo/main/getTodoNowListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#success_todo").setGridParam({url:"/todo/main/getTodoSuccessListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#re_todo").setGridParam({url:"/todo/main/getTodoRestListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		
		$("#view_user_nm").val('');
		$("#view_td_nm").val('');
		$("#view_td_date").val('');
		$("#view_td_upd_date").val('');
		$("input:radio[name='td_tp']").prop("checked", false);
	}else {
		alert("작업수행에 실패하였습니다.");
	}
}

/* 삽입 */
function fn_todo_create() {
	if($("#create_td_nm").val()=='') {
		alert("할 일을 입력하세요.");
		$("#create_td_nm").css("border", "2px solid red");
		$("#create_td_nm").css("box-shadow", "0 0 3px red");
		return;
	}
	if(!confirm('할 일을 등록하시겠습니까?')) return;
	
	callAjax("/todo/main/createTodo", $("#frm_todo_create").serialize(), fn_create_result);
}
/* 삽입 결과 callback */
function fn_create_result(data) {
	if(data.resultCode=="S000"){
		$("#pre_todo").setGridParam({url:"/todo/main/getTodoPreListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#now_todo").setGridParam({url:"/todo/main/getTodoNowListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#success_todo").setGridParam({url:"/todo/main/getTodoSuccessListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		$("#re_todo").setGridParam({url:"/todo/main/getTodoRestListRetrieve", page:1, datatype:"json"}).trigger("reloadGrid");
		
		$("#create_td_nm").val('');
		$("#create_tp_pre").prop("checked", true);
	}else {
		alert("작업수행에 실패하였습니다.");
	}
}

/* 취소 버튼 */
function fn_create_cancel(){
	$("#create_td_nm").val('');
	$("#create_tp_pre").prop("checked", true);
}
function fn_mng_cancel() {
	$("#view_user_nm").val('');
	$("#view_td_nm").val('');
	$("#view_td_date").val('');
	$("#view_td_upd_date").val('');
	$("input:radio[name='td_tp']").prop("checked", false);
	$("#view_td_nm").prop("disabled", true);
}
</script>
<body>
<div id="container">
	<div role="content">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div class="form-group" style="flex:center; display: inline-block; width:380px;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;할 일</span></label>
				</div>
				<div class="form-group" style="flex:center; display: inline-block; width:373px;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;진행 중</span></label>
				</div>				
				<div class="form-group" style="flex:center; display: inline-block; width:373px;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;완료</span></label>
				</div>	
				<div class="form-group" style="flex:center; display: inline-block;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;보류</span></label>
				</div>				
			</fieldset>
			<fieldset>
				<div class="row" id="table_pre" style="display: inline-block; padding:10px;">
					<table id="pre_todo" style="width:100%;"></table>
					<div id="pager_pre_list"></div>
				</div>
				<div class="row" id="table_now" style="display: inline-block; padding:10px;">
					<table id="now_todo"></table>
					<div id="pager_now_list"></div>
				</div>
				<div class="row" id="table_success" style="display: inline-block; padding:10px;">
					<table id="success_todo"></table>
					<div id="pager_success_list"></div>
				</div>
				<div class="row" id="table_re" style="display: inline-block; padding:10px;">
					<table id="re_todo"></table>
					<div id="pager_re_list"></div>
				</div>
			</fieldset>	
		</div>
	</div>
</div>
<form class="form-horizontal" id="frm_todo" name="frm_todo" onsubmit="return false">
	<div class="board_info" id="content">
		<div class="widget-body" style="margin-left:30px; float:left; width:730px;">
			<fieldset>
				<div style="flex:center; border-radius:3px; background-color:#1266F1;">
					<label style="color:white; margin-left:5px;">
						<span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;TODO MANAGEMENT</span>
					</label>
				</div>
			</fieldset>
			<input type="hidden" id="view_td_id" name="td_id"/>
			<fieldset>	
					<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">작성자</legend>
					<div>
						<input class="form-control input-sm" id="view_user_nm" name="user_nm" disabled="disabled"/>					
					</div>
					<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">내용</legend>
					<div>
						<input class="form-control input-sm" id="view_td_nm" name="td_nm" disabled="disabled"/>					
					</div>
					<div style="float:left; width:320px;">
					<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">작성일</legend>
						<input class="form-control input-sm" id="view_td_date" disabled="disabled"/>					
					</div>
					<div style="float:right; width:320px;">
					<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">수정일</legend>
						<input class="form-control input-sm" id="view_td_upd_date" disabled="disabled"/>					
					</div>
					<div style="margin-top:10px; clear:both;">
					<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">상태</legend>
						<div style="margin-right:30px; display: inline-block;">
							<input type="radio" class="form-check-input" name="td_tp" id="view_tp_pre" value="00"/>
							<label for="view_tp_pre" class="form-check-label">할 일</label>
						</div>
						<div style="margin-right:30px; display: inline-block;">
							<input type="radio" class="form-check-input" name="td_tp" id="view_tp_now" value="01"/>	
							<label for="view_tp_now" class="form-check-label">진행 중</label>
						</div>
						<div style="margin-right:30px; display: inline-block;">
							<input type="radio" class="form-check-input" name="td_tp" id="view_tp_success" value="02"/>
							<label for="view_tp_success" class="form-check-label">완료</label>
						</div>
						<div style="margin-right:30px; display: inline-block;">
							<input type="radio" class="form-check-input" name="td_tp" id="view_tp_re" value="99"/>	
							<label for="view_tp_re" class="form-check-label">보류</label>
						</div>
					</div>
			</fieldset>	
			<div id="todo_mng" style="text-align: right;">
				<button type='button' id="update_btn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_mng_update();">수정</button>		
				<button type='button' id="delete_btn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_mng_delete();">삭제</button>		
				<button type='button' id="mng_cancel_btn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_mng_cancel();">취소</button>		
			</div>
		</div>
	</div>
</form>
<form class="form-horizontal" id="frm_todo_create" name="frm_todo_create" onsubmit="return false">	
	<div class="widget-body" style="margin-right:30px; float:right; width:750px;">
		<fieldset>
			<div style="flex:center; border-radius:3px; background-color:#1266F1;">
				<label style="color: white; margin-left:5px;">
					<span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;TODO CREATE</span>
				</label>
			</div>
		</fieldset>
		<input type="hidden" id="view_user_idx" name="user_idx" value="${sessionVo.user_idx}"/>
		<input type="hidden" id="view_user_nm" name="user_nm" value="${sessionVo.user_nm}"/>
		<fieldset>	
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">작성자</legend>
				<div>
					<input class="form-control input-sm" id="create_user_nm" value="${sessionVo.user_nm}" disabled="disabled"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">할 일</legend>
				<div>
					<input class="form-control input-sm" id="create_td_nm" name="td_nm" placeholder="할 일을 입력하세요."/>					
				</div>
				<div style="margin-top:10px;">
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">상태</legend>
					<div style="margin-right:30px; display: inline-block;">
						<input type="radio" class="form-check-input" name="create_td_tp" id="create_tp_pre" value="00" checked/>
						<label for="create_tp_pre" class="form-check-label">할 일</label>
					</div>
					<div style="margin-right:30px; display: inline-block;">
						<input type="radio" class="form-check-input" name="create_td_tp" id="create_tp_now" value="01"/>	
						<label for="create_tp_now" class="form-check-label">진행 중</label>
					</div>
					<div style="margin-right:30px; display: inline-block;">
						<input type="radio" class="form-check-input" name="create_td_tp" id="create_tp_success" value="02"/>
						<label for="create_tp_success" class="form-check-label">완료</label>
					</div>
					<div style="margin-right:30px; display: inline-block;">
						<input type="radio" class="form-check-input" name="create_td_tp" id="create_tp_re" value="99"/>	
						<label for="create_tp_re" class="form-check-label">보류</label>
					</div>
				</div>
		</fieldset>	
		<div id="todo_create" style="text-align: right;">
			<button type='button' id="create_btn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_todo_create();">등록</button>		
			<button type='button' id="create_cancel_btn" class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_create_cancel();">취소</button>		
		</div>
	</div>
</form>

</body>
</html>