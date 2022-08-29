<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login History</title>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/main/selectLoginHist",
	    //caption:'로그인기록',
	    loadtext:"로딩 중..",
		datatype:"json", //데이터 타입(그리드를 채우는 데이터의 형식)
		mtype:"POST", //데이터 전송방식(요청메소드 정의)
		height : 650, //'auto' 로 자동 높이 설정 가능
		width : 1530,
		shrinkToFit: true,
		//autowidth: true,
		rownumbers: true,
		colNames:['아이디', 'IP', '접속일자'],
		colModel: [
					{name:'uId',    index:'uId',    align:"center"},
					{name:'ip',     index:'ip',     align:"center"},
					{name:'logDate',index:'logDate',align:"center"},
	              ],
        pager: "#pager",
        rowNum: 25,            //한 화면에 보여줄 행 수
	    rowList: [25, 50, 75], //5개보기, 10개보기, 15개보기 선택해서 보기 가능
		viewrecords: true,
		pgbuttons: true,
		//pagerpos: 'center',
		//gridComplete: function(){
			//$("#mainGrid").css("vertical-align", "middle");
			//랜더링 시간 구하기
			//var time = $("#mainGrid").jqGrid('getGridParam', 'totaltime');
			//$("#load_time").html("Render time : " + time + "초");
		//},
		loadComplete: function() {
			//initPage("#mainGrid", "pager", true, "TOT");
			//$("#mainGrid").removeClass('ui-state-default jqgrid-rownum');
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		}
	});
	//$("#mainGrid").setGridParam({url:"/main/selectLoginHist", page:1}).trigger("reloadGrid");
});
</script>
</head>
<body>

<div id="content">
	<div role="content">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div class="form-group" style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;LOGIN HISTORY</span></label>
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

</body>
</html>