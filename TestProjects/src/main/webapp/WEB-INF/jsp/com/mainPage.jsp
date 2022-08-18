<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/assets/plugin/js/jqgrid/grid.locale-en.min.js"></script>
<script src="/assets/plugin/js/jqgrid/jquery.jqGrid.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/main/selectUserList",
	    //caption:'회원목록',
		loadtext:"로딩 중..",
		datatype:"json",
		mtype:"POST",
		height:400,
		width:700,
		//autowidth:true, : width와 동시 사용불가
		colNames:['번호', '아이디', '비밀번호', '닉네임'],
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
	    	var time = $("#mainGrid").jqGrid('getGridParam', 'totaltime');
	    	$("#load_time").html("Render time : " + time + "초");
	    }
	});
});
</script>
<script type="text/javascript">
$(function(){
	$("#logoutBtn").click(function(){
		location.href="/logout";
	});
});
$(function(){
	$("#loginhistBtn").click(function(){
		location.href="/loginhist";		
	});
});
</script>
</head>
<body>

<div style="width:700px; margin-left:500px; margin-top:100px;">
<h4>접속자 : ${sessionVo.uNm}</h4>
<p id="load_time"></p><br>
	<button type="button" class="btn btn-primary btn-block mb-4" id="logoutBtn" style="width:100px; display:inline-block;">logout</button>
	<button type="button" class="btn btn-primary btn-block mb-4" id="loginhistBtn" style="width:100px; display:inline-block;">history</button>
	<p><a href="/board/main">게시판 홈</a></p>
<hr>
	<div class="tableWrap">
		<table id="mainGrid"></table>
		<div id="page_user_list"></div>
	</div>
</div>

</body>
</html>