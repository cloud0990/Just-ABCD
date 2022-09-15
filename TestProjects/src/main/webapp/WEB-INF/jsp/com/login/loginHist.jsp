<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : LOGIN HISTORY</title>
<script type="text/javascript">
$(function(){
	$("#srch_text").keypress(function(e){
		if(e.keyCode && e.keyCode == 13) {
			if($("#srch_text").val()=='') {
				$("#srch_log option:eq(0)").prop("selected", true);
			}
			$("#srch_btn").trigger('click'); //trigger() : 이벤트 강제 발생
		}
	});
	/* 검색필터 */
	$("#srch_btn").click(function(){
		if($("#srch_text").val()=='') {
			$("#srch_log option:eq(0)").prop("selected", true);
		}
		fn_log_srch();
	});
	
	$("#mainGrid").jqGrid({
		url:"/main/selectLoginHist",
	    loadtext:"로딩 중..",
		datatype:"json", //데이터 타입(그리드를 채우는 데이터의 형식)
		mtype:"POST", //데이터 전송방식(요청메소드 정의)
		height : 650, //'auto' 로 자동 높이 설정 가능
		width : 800,
		shrinkToFit: true,
		colNames:['번호', '닉네임', '접속 아이디', '접속여부', '접속시도일', 'log_user_ip'],
		colModel: [
					{name:'log_id',  index:'log_id',  align:"center", width:"10px"},
					{name:'log_user_nm',  index:'log_user_nm',  align:"center", width:"30px"},
					{name:'log_user_id',  index:'log_user_id',  align:"center", width:"30px"},
					{name:'log_tp_yn',  index:'log_tp_yn',  align:"center", width:"15px"},
					{name:'log_date', index:'log_date', align:"center", width:"30px"},
					{name:'log_user_ip',  index:'log_user_ip',  hidden:true}
	              ],
        pager: "#pager",
        rowNum: 25,            //한 화면에 보여줄 행 수
	    rowList: [25, 50, 75], //5개보기, 10개보기, 15개보기 선택해서 보기 가능
		viewrecords: true,
		loadComplete: function() {
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
            var allRow = $("#mainGrid").jqGrid('getGridParam', 'records');        
            if(allRow == 0 ){          
            	$("#mainGrid > tbody").append("<tr><td align='center' colspan='6' style=''>조회된 데이터가 없습니다.</td></tr>");       
           	}
		},
 		onSelectRow: function(index, row) { //index = 선택된 row의 index
 			if(index) {
 				var row = $("#mainGrid").jqGrid('getRowData', index);
 				$("#view_user_nm").val(row.log_user_nm);
 				$("#view_user_id").val(row.log_user_id);
 				$("#view_log_tp_yn").val(row.log_tp_yn);
 				$("#view_log_date").val(row.log_date);
 				$("#view_log_user_ip").val(row.log_user_ip);
 			}
	    },
	    gridComplete: function() {
	    	$("#mainGrid td").css("vertical-align", "middel");
	    } 
	});
});
/* 사용자 검색 */
function fn_log_srch() {
	$("#mainGrid").clearGridData();
	$("#mainGrid").setGridParam({
		   url:"/main/selectLoginHist"
		 , postData: {
				  srch_log: $("#srch_log").val()
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
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;사용자 로그인 기록</span></label>
				</div>
			<!-- 검색 -->
			<div class="input-group rounded" style="width:400px; float: right;">
			  <select id="srch_log" name="srch_log" style="border-radius: 3px; font-size: 13px; outline:none; border:none; margin-right:3px; width:120px;">
			  	<option value='srch_all'>전 체</option>
			  	<option value='srch_user_nm'>닉네임</option>
			  	<option value='srch_user_id'>접속 아이디</option>
			  	<option value='srch_log_tp_yn'>접속여부 [Y/N]</option>
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
<div class="user_info" id="content" style="float:right; width:710px;">
	<div class="widget-body" style="padding:30px;">
		<fieldset>
			<div style="flex:center;">
				<label><span class="widget-icon"><i class="fa fa-list-alt txt-color-white"></i>&nbsp;&nbsp;&nbsp;사용자 상세정보</span></label>
			</div>
		</fieldset>
		<hr style="margin-top:0px;">
		<fieldset>		
			<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">닉네임</legend>
			<div>
				<input class="form-control input-sm" id="view_user_nm" disabled="disabled"/>					
			</div>
			<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">아이디</legend>
			<div>
				<input class="form-control input-sm" id="view_user_id" disabled="disabled"/>					
			</div>
			<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">접속 IP</legend>
			<div>
				<input class="form-control input-sm" id="view_log_user_ip" disabled="disabled"/>					
			</div>
			
			<div style="float:left; width:130px;">
			<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">접속 성공 여부</legend>
				<input class="form-control input-sm" id="view_log_tp_yn" disabled="disabled"/>					
			</div>
			<div style="float:right; width:517px;">
			<legend style="padding-top:0px; font-size:14px; margin-bottom:5px; margin-top:15px;">접속시도일</legend>
				<input class="form-control input-sm" id="view_log_date" disabled="disabled"/>					
			</div>
		</fieldset>
	</div>
</div>

</body>
</html>