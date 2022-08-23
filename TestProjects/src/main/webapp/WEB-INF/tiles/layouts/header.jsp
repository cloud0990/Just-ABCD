<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sessionVo" value="${sessionScope.S_USER}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootStrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<!-- select2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script> -->
<!-- jQuery Ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/assets/common/ajaxCommon.js"></script>
<script src="/assets/common/jquery.form.js"></script>
<!-- jgGrid -->
<script src="/assets/plugin/js/jqgrid/grid.locale-en.min.js"></script>
<script src="/assets/plugin/js/jqgrid/jquery.jqGrid.min.js"></script>

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