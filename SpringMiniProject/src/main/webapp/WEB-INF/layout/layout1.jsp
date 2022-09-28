<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring5 + Tiles3 + Mybatis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">    
    div.mainlayout1 div.main{
    	border: 1px solid gray;
    }

    #header {
    	font-weight: bold;
    	width: 100%;
    	height: 130px;
    	line-height: 130px;
    	background-color: white;
    	display: flex;
    	justify-content: center;
    }
    
    #menu {
    	width: 100%;
    	height: 130px;
    	display: flex;
    	justify-content: center;
    }
    
    #info {
    	float: left;
    	width: 20%;
    	height: 700px;
    	color: gray;
    	padding-top: 200px;
    	text-align: center;
    }
    
    #main {
    	float: right;
    	width: 80%;
    	height: 700px;
    }
    
    a:link a:visited {
    	text-decoration: none;
    }
    
    a:hover {
    	cursor: pointer;
    }
    </style>
</head>
<body>
<!--인포 변경예정-->
	<div class="mainlayout1">
		<div class="main" id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div class="main" id="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div class="main" id="info">
			<tiles:insertAttribute name="info"/>
		</div>
		<div class="main" id="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
</body>
</html>