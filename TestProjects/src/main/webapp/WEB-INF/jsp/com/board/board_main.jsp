<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 홈</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/assets/plugin/js/jqgrid/grid.locale-en.min.js"></script>
<script src="/assets/plugin/js/jqgrid/jquery.jqGrid.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$("#logoutBtn").click(function(){
		location.href="/logout";		
	});
});
</script>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/board/main/selectAllBoard",
		caption:"전체 게시글",
		loadtext:"로딩 중...",
		datatype:"json",
		mtype:"POST",
		height:700,
		width:1000,
		colNames:['번호', '작성자', '제목', '내용', '작성일자'],
		colModel:[
					{name:'bIdx', index:'bIdx', align:"left"},
					{name:'uNm', index:'uNm', align:"left"},
					{name:'bSubject', index:'bSubject', align:"left"},
					{name:'bContent', index:'bContent', align:"left"},
					{name:'bDate', index:'bDate', align:"left"}
				 ],
		rowNum:5,
		gridComplete: function() {
			var time = $("#mainGrid").jqGrid('getGridParam', 'totaltime');
			$("#load_time").html("Render time : " + time + "초");		
		}
	});
});
</script>
</head>
<body>
<header id="header">
  <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarExample01" aria-controls="navbarExample01" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarExample01">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item active">
            <a class="nav-link" aria-current="page" href="/board/main">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/board/createBoard">글쓰기</a>
          </li>
        </ul>
          	<button type="button" class="btn btn-primary btn-block mb-4" id="logoutBtn" style="width:100px; display:inline-block;">logout</button>
      </div>
    </div>
  </nav>
</header>
<div style="margin-left:300px; width:1000px;">
<hr>
<h6>접속자 : ${sessionVo.uNm}</h6><br>
<p><a href="/board/main/myMain">내 게시글</a></p>
	<div>
		<h6 id="load_time"></h6>
	</div>
<hr>
	<div class="tableWrap" style="margin-left:50px;">
		<table id="mainGrid"></table>
	</div>
</div>
</body>
</html>