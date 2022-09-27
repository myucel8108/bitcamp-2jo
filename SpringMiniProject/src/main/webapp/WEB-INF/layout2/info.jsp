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
    <link
        href="https://fonts.googleapis.com/css2?family=Dongle&family=Jua&family=Nanum+Gothic&family=Nanum+Pen+Script&family=Single+Day&display=swap"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
    *{
    	font-family: 'Jua';
    }
    img {
    	width: 200px;
    	height: 200px;
    	border-radius: 100%;
    }
    
    .infobox{
    	display: flex;
    }
    
    .info {
    }
    </style>
</head>
<body>	
	<c:set var="root" value="<%=request.getContextPath()%>"/> <!-- 자기 주소 얻어오기 -->
	<div class="infobox" align="center">
		<figure class="info">
			<img src="${root}/image/seoul2.jpg">		
		</figure>
		<figcaption>
			<b>개 산책 시키는 사람</b>
		</figcaption>
	</div>
</body>
</html>