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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style type="text/css">
    </style>
</head>
<body>	
	<c:set var="root" value="<%=request.getContextPath()%>"/> <!-- 자기 주소 얻어오기 -->
	
	<!-- 로그인 안한 상태에서는 기본 사진이 나오도록 한다 -->
	<c:if test="${sessionScope.loginok==null}">
		<img src="${root}/image/seoul2.jpg" width="130" height="130" class="rounded-circle">
	</c:if>
	
	<!-- 로그인한 상태에서는 로그인한 멤버의 사진이 나오도록 한다 -->	
	<c:if test="${sessionScope.loginok!=null}">
		<img src="${root}/upload/${sessionScope.loginphoto}" width="130" height="130" class="rounded-circle">
	</c:if>
	
	<br><br>
	<i class="material-icons" style="font-size:16px;">person_outline</i>&nbsp;이름<br>	
	<i class="material-icons" style="font-size:16px;">phone_iphone</i>&nbsp;010-8685-9930<br>
	<i class="material-icons" style="font-size:16px;">email</i>&nbsp;90_kh@naver.com<br>
	<i class='fab fa-instagram' style='font-size:16px'></i>&nbsp;jxnmin
</body>
</html>