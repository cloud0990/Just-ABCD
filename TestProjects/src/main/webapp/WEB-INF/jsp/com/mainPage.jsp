<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/main/selectUserList",
	    //caption:'회원목록',
		loadtext:"로딩 중..",
		datatype:"json",
		mtype:"POST",
		height:200,
		//width:700,
		autowidth:true, //width와 동시 사용불가
		shrinkToFit: true,
		colNames:['회원번호', '아이디', '비밀번호', '닉네임'],
		colModel: [
					{name:'uIdx', index:'uIdx', align:"left"},
					{name:'uId',  index:'uId',  align:"left"},
					{name:'uPwd', index:'uPwd', align:"left"},
					{name:'uNm',  index:'uNm',  align:"left"}
	              ],
	    rowNum: 5,
	    rowList: [5, 10, 15],
	    rownumbers: true,
	    pager : '#page_user_list',
	    pgbuttons: true,
	    viewrecords: true,
	    onSelectRow: function(index) { //index = 선택된 row의 index
	    	alert('row index=' + index);
	    },
	    gridComplete: function() {
	    	//load time 가져오기
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
		<div class="widget-body" style="padding:50px;">
			<fieldset>
				<div class="form-group" style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;User List</span></label>
					<!-- <label class="control-labelcol-md-1" id="load_time"></label> -->
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<fieldset>		
				<div class="row" id="tableWrap">
					<table id="mainGrid"></table>
					<div id="page_user_list"></div>
				</div>
			</fieldset>	
		</div>
	</div>
</div>

</body>
</html>