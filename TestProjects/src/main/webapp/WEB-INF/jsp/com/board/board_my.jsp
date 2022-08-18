<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 홈 : 내 게시글</title>
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
function updateItem(f) {
	
	var b_idx = f.b_idx.value
	alert(b_idx);
	
}
</script>
</head>
<body>
<header>
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
<p><a href="/board/main">전체 게시글</a></p>	
<hr>
<form>
<table style="margin-left:50px; width:1000px;">
	<tr>
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일자</th>
		<th></th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5"><font color="red">작성한 게시글이 없습니다.</font></td>
		</tr>
	</c:if>
	<!-- 데이터가 있는 경우 -->
	<c:if test="${not empty list}">
		<c:forEach var="item" items="${list}">	
			<tr>
				<td>${item.bIdx}</td>
				<td>${item.uNm}</td>
				<td>${item.bSubject}</td>
				<td>${item.bContent}</td>
				<td>${item.bDate}</td>
				<td>
					<input type="button" onclick="updateItem(this.form)" value="수정">
				</td>
			</tr>
		</c:forEach>
	</c:if>	
</table>
</form>
</div>
</body>
</html>