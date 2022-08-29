<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 홈 : 내 게시글</title>
</head>
<body>
<div style="margin-left:300px; margin-top: 50px;">
<form>
<table style="margin-left:50px; width:1000px;">
	<tr>
		<th>게시글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일자</th>
		<th></th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5" align="center" style="padding:50px;"><font color="red">작성한 게시글이 없습니다.</font></td>
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
				<td><input type="button" onclick="updateItem(this.form)" value="수정"></td>
			</tr>
		</c:forEach>
	</c:if>	
</table>
</form>
</div>
</body>
</html>