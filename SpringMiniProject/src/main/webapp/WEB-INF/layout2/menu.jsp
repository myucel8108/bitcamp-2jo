<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
    *{
    	font-family: 'IBM Plex Sans KR';
    }
    
    .menu{
    	font-size: 30px;
    	text-align: center;
    	word-spacing: 40px;
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    
    div.menu>a {
    	text-decoration: none;
    	color: gray;
    }
    
    </style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/> <!-- 자기 주소 얻어오기 -->
	<div class="menu">
		<a href="${root}/">Home</a>
		&nbsp;&nbsp;
		<a href="${root}/board/list">게시판</a>
		&nbsp;&nbsp;
		<a href="${root}/member/list">회원가입</a>
		&nbsp;&nbsp;
		<a href="${root}/help/map">구글맵</a>
	</div>
</body>
</html>






















