<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sessionVo" value="${sessionScope.S_USER}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation"><i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
     <nav aria-label="breadcrumb">
	     <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="/main/view">UserList</a></li>
	        <li class="breadcrumb-item"><a href="/main/loginhist">Login History</a></li>
	        <li class="breadcrumb-item"><a href="/board/main">Board</a></li>
	        <li class="breadcrumb-item"><a href="/board/main/myMain">My Board</a></li>
	        <li class="breadcrumb-item"><a href="/board/createBoard">Write</a></li>
	        <!-- <li class="breadcrumb-item active" aria-current="page"><a href="#">Data</a></li> -->
	      </ol>
      </nav>
    </div>
    <div class="d-flex align-items-center">
<!--      <form class="d-flex input-group w-auto">
      <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon"/>
      <span class="input-group-text border-0" id="search-addon"><i class="fas fa-search" style="margin-right:10px;"></i></span>
     </form> -->
      <div class="d-flex align-items-center">
        <button type="button" class="btn btn-link px-3 me-2">USER : ${sessionVo.uNm}</button>
        <a class="btn btn-dark px-3" href="https://github.com/cloud0990" role="button" style="margin-right:5px;"><i class="fab fa-github"></i></a>
        <button type="button" class="btn btn-primary me-3" onclick="location.href='/logout';">LOGOUT</button>
      </div>
    </div>
  </div>
</nav>

</body>
</html>