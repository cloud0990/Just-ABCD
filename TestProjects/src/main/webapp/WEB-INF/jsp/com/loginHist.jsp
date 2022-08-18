<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인기록 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/assets/plugin/js/jqgrid/grid.locale-en.min.js"></script>
<script src="/assets/plugin/js/jqgrid/jquery.jqGrid.min.js"></script>
<script src="/assets/common/jquery.form.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/main/selectLoginHist",
	    //caption:'로그인기록',
	    loadtext:"로딩 중..",
		datatype:"json", //데이터 타입
		mtype:"POST", //데이터 전송방식
		height:400,
		width:700,
		//autowidth: true,
		//shrinkToFit: true,
		rownumbers: true,
		gridview: true,
		colNames:['아이디', 'IP', '접속일자'],
		colModel: [
					{name:'uId',    index:'uId',    align:"left"},
					{name:'ip',     index:'ip',     align:"left"},
					{name:'logDate',index:'logDate',align:"left"},
	              ],
	    rowNum: 5,            //한 화면에 보여줄 행 수
	    rowList: [5, 10, 15], //5개보기, 10개보기, 15개보기 선택해서 보기 가능
		pager: "#page_login_hist",
		viewrecords: true,
		pgbuttons: true,
		gridComplete: function(){
			//$("#mainGrid").css("vertical-align", "middle");
			//랜더링 시간 구하기
			var time = $("#mainGrid").jqGrid('getGridParam', 'totaltime');
			$("#load_time").html("Render time : " + time + "초");
		},
		loadComplete: function() {
			//initPage("tableWrap", "page_login_hist", true, "TOT");
			//$(".tableWrap").removeClass('ui-state-default jqgrid-rownum');
		}
	});
});
</script>
</head>
<body>

<div style="width:700px; margin-left:500px; margin-top:100px;">
<h4>로그인기록</h4>
<p id="load_time"></p><br>
	<p><a href="/main">돌아가기</a></p>
<hr>
	<div class="tableWrap">
		<table id="mainGrid"></table>
		<div id="page_login_hist"></div>
	</div>
</div>

</body>
</html>