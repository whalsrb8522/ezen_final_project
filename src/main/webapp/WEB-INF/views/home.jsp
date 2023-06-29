<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
</head>
<body>
	<jsp:include page="./layout/header.jsp"></jsp:include>
	<h1>home</h1>
	<a href="/board_qna/register"><button type="button" class="btn btn-primary">1:1 문의</button></a> 
	<a href="/board_location/register"><button type="button" class="btn btn-primary">지역게시판 글쓰기</button></a> 
	<a href="/board_location/detail"><button type="button" class="btn btn-primary">지역게시판 detail</button></a> 
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>
