<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 홈</title>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/board/main/selectAllBoard",
		//caption:"전체 게시글",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:650,
		width:1530,
		//autowidth: true,
		shrinkToFit: true,
		rownumbers: true,
		colNames:['게시글 번호', '제목', '내용', '작성자', '작성일자'],
		colModel:[
					{name:'bIdx', index:'bIdx', align:"center"},
					{name:'bSubject', index:'bSubject', align:"center"},
					{name:'bContent', index:'bContent', align:"center"},
					{name:'uNm', index:'uNm', align:"center"},
					{name:'bDate', index:'bDate', align:"center"}
				 ],
		pager : "#pager",
	    rowNum  : 10,
		rowList : [10, 20, 30],
		gridComplete: function() {
			//var time = $("#mainGrid").jqGrid('getGridParam', 'totaltime');
			//$("#load_time").html("Render time : " + time + "초");		
		},
		loadComplete: function() {
			//initPage("tableWrap", "page_login_hist", true, "TOT");
			//$(".tableWrap").removeClass('ui-state-default jqgrid-rownum');
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		}
	});
});
</script>
</head>
<body>

<div id="content">
	<div role="content">
		<div class="widget-body" style="padding:30px;">
			<fieldset>
				<div class="form-group" style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;CONTENT LIST</span></label>
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