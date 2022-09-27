<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style>
        a{
        	text-decoration: none;
        }
        
        .menu{
        	padding-left: 0px;
        }
	
        ul li{
        	list-style: none;
        }
        
        li.main{
        	float: left;
        	text-align: center;
        	margin: auto;
        }
        
        li.main>a{
            display: block;
            color: #333;
            font-weight: bold;
    		width: 180px;
        }
 
        li.main>a:hover{
            cursor: pointer;
        }
 
        ul.submenu{
            font-size: 14px;
            padding-left: 0px;
        }
 
        ul.submenu>li{
            width: 180px;
            height: 20px;
            color: #333;
        }
 
        ul.submenu>li:hover{
            color:#ff720b;
            cursor: pointer;
        }
    </style>
    <script>
        $(function(){
            $("li.main>a").hover(function(){
                $(this).css("color","orange");
            },function(){
                $(this).css("color","black");
            });
 
            //서브메뉴는 처음에 안보이게 처리
            $("ul.submenu").hide();
 
            //메인제목에 마우스를 올리면 서브메뉴가 보이고 벗어나면 사라지게 하기
            $("li.main>a").mouseover(function(){
                //$(this).next().slideDown();//방법 1
                $(this).siblings().slideDown('fast');//방법 2
                $(this).parent().siblings().find("ul.submenu").slideUp('fast');
            });
 
            //메인 제목 클릭시 서브메뉴가 나타낫다 사라졌다 하기
            $("li.main>a").click(function(){
                $(this).siblings().slideToggle('fast');
            });
 
            $("ul.submenu").hover(function(){
                $(this).slideDown();
            },function(){
                $(this).slideUp();
            });
       });
    </script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/> <!-- 자기 주소 얻어오기 -->
	<div style="display: flex; justify-content: center;">
	    <ul class="menu">
	        <!--1번째 메뉴-->
	        <li class="main">
	            <a class="test">비트캠프안내</a>
	            <ul class="submenu">
	                <li><a href="${root}/">메인페이지</a></li>
	                <li><a href="${root}/help/map">찾아오시는 길</a></li>                
	            </ul>
	        </li>
	 
	        <!--2번째 메뉴-->
	        <li class="main">
	            <a class="test">회원전용</a>
	            <ul class="submenu">
	                <li><a href="${root}/member/list">회원목록</a></li>
	                <li><a href="${root}/member/form">회원가입</a></li>
	                <li></li>
	            </ul>
	        </li>
	 
	         <!--3번째 메뉴-->
	         <li class="main">
	            <a class="test">게시판</a>
	            <ul class="submenu">
	                <li><a href="${root}/board/list">게시판목록</a></li>
	                <li><a href="${root}/board/form">글쓰기</a></li>
	            </ul>
	        </li>
	    </ul>
	</div>
</body>
</html>

