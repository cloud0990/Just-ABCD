<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : USERS</title>
<style type="text/css">
input:focus{
	-webkit-box-shadow: none;
	box-shadow:none;
	outline:2px solid #d50000;
}
</style>
<script type="text/javascript">
$(function(){
	$("#srch_user_text").keypress(function(e){
		if(e.keyCode && e.keyCode == 13) {
			if($("#srch_user_text").val()=='') {
				$("#srch_user option:eq(0)").prop("selected", true);
			}
			$("#srch_user_btn").trigger('click'); //trigger() : 이벤트 강제 발생
		}
	});
	/* 검색필터 */
	$("#srch_user_btn").click(function(){
		if($("#srch_user_text").val()=='') {
			$("#srch_user option:eq(0)").prop("selected", true);
		}
		fn_user_srch();
	});
	
	/* 메인 그리드 */
	$("#mainGrid").jqGrid({
		url:"/main/selectUserList",
		loadtext:"로딩 중..",
		datatype:"json",
		mtype:"POST",
		height:'auto',
		width:1000,
		shrinkToFit: true,
		colNames:['회원번호', '닉네임', '아이디', '비밀번호', '가입일', '수정일' ,''],
		colModel: [
					{name:'user_idx', index:'user_idx', align:"center", width:"30px"},
					{name:'user_nm',  index:'user_nm',  align:"center", width:"50px"},
					{name:'user_id',  index:'user_id',  align:"center", width:"60px"},
					{name:'user_pwd', index:'user_pwd', align:"center", width:"60px"},
					{name:'user_date', index:'user_date', align:"center", width:"60px"},
					{name:'upd_date', index:'upd_date', align:"center", width:"60px"},
					{name:'empty',  index:'empty',  align:"center", formatter:formatOpt, width:40 }
	              ],
	    rowNum: 25,
	    rowList: [25, 50, 75],
	    rownumbers: true,
	    pager : '#pager',
	    viewrecords: true,
		loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		},
 		onSelectRow: function(index, row) { //index = 선택된 row의 index
 			$("#view_user_idx").val('');
 			if(index) {
 				var row = $("#mainGrid").jqGrid('getRowData', index);
 				$("#view_user_idx").val(row.user_idx);
 				$("#view_user_id").val(row.user_id);
 				$("#view_user_pwd").val(row.user_pwd);
 				$("#view_user_nm").val(row.user_nm);
 				$("#view_user_date").val(row.user_date);
 				$("#view_upd_date").val(row.upd_date);
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
	str += "<button type='button' class='btn btn-default btn-sm' style='padding:2px 10px 2px; border:1px solid gray; z-index:1;' onclick=\"javascript:fn_user_delete('" + rowObject.user_idx + "')\">삭제</button>";
	str += "</div>"
	return str;
}

/* 사용자 수정 */
function fn_user_update(user_idx) {
	if(!confirm("수정하시겠습니까?")) return;
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
	$("#view_user_id").prop("disabled", false);
	$("#view_user_pwd").prop("disabled", false);
	$("#view_user_nm").prop("disabled", false);
}
function fn_update_cancel() {
	$("#view_user_id").prop("disabled", true);
	$("#view_user_pwd").prop("disabled", true);
	$("#view_user_nm").prop("disabled", true);
	$("#updateCancel_btn").hide();
}

/* 사용자 삭제 */
function fn_user_delete(user_idx) {
	ConfirmAjax("delete"         //text
		, "/main/deleteUser"             //target
		, "user_idx=" + user_idx         //form
		, function(data) {               //callback
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

/* 사용자 검색 */
function fn_user_srch() {
	$("#mainGrid").clearGridData();
	$("#mainGrid").setGridParam({
		   url:"/main/selectUserList"
		 , postData: {
				  srch_user: $("#srch_user").val()
		   		, srch_user_text : $("#srch_user_text").val()	
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
				<div class="form-group" style="flex:center;">
					<label style="float:left;"><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;사용자</span></label>
				</div>
				<!-- 검색 -->
				<div class="input-group rounded" style="width:500px; float: right;">
				  <select id="srch_user" name="srch_user" style="border-radius: 3px; font-size: 13px; outline:none; border:none; margin-right:3px; width:100px;">
				  	<option value='srch_all'>전 체</option>
				  	<option value='srch_user_nm'>닉네임</option>
				  	<option value='srch_user_id'>아이디</option>
				  </select>
				  <input type="search" id="srch_user_text" name="srch_user_text" class="form-control rounded" placeholder="검색" aria-label="Search" aria-describedby="search-addon"/>
				  <button type="button" class="btn btn-default btn-sm" style="padding:2px 10px 2px; box-shadow: none;" id="srch_user_btn">
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
<form class="form-horizontal" id="frm_update_user" name="frm_update_user" onsubmit="return false">
	<div class="user_info" id="content" style="float:right; width:530px;">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;사용자 상세정보</span></label>
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<input type="hidden" id="view_user_idx" name="user_idx">
			<fieldset>		
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">닉네임</legend>
				<div>
					<input class="form-control input-sm" id="view_user_nm" name="user_nm" disabled="disabled"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">아이디</legend>
				<div>
					<input class="form-control input-sm" id="view_user_id" name="user_id" disabled="disabled"/>					
				</div>
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">비밀번호</legend>
				<div>
					<input class="form-control input-sm" id="view_user_pwd" name="user_pwd" disabled="disabled"/>					
				</div>
				<div style="float:left; width:232px;">
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">가입일</legend>
					<input class="form-control input-sm" id="view_user_date" disabled="disabled"/>					
				</div>
				<div style="float:right; width:234px;">
				<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">수정일</legend>
					<input class="form-control input-sm" id="view_upd_date" disabled="disabled"/>					
				</div>
			</fieldset>
			<!-- 수정 삭제 버튼 -->	
			<div id="updateCancel_btn" style="margin-top: 30px; text-align: right; display:none; clear:both;">
				<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_user_update($('#view_user_idx').val())">수정</button>		
				<button type='button' class='btn btn-default btn-sm' style="padding:2px 10px 2px; font-size: 15px;" onclick="fn_update_cancel();">취소</button>		
			</div>
		</div>
	</div>
</form>

</body>
</html>