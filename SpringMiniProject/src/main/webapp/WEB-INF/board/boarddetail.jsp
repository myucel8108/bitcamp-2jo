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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    span.likes {
    	cursor: pointer;
    }
    
    span.day{
    	color: #333;
    	float: right;
    	font-size: 13px;
    }
    
    span.writer{
    	color: red;
    	border: 1px solid red;
    	border-radius: 40px;
    	margin-left: 5px;
    	font-size: 0.8em;
    	padding: 3px;
    }
    
    .adel{
    	color: red;
    	cursor: pointer;
    	margin-left: 5px;
    }
    
    div.alist pre{
    	text-indent: 10px;
    	color: gray;
    }
    
    div.alist img{
    	width: 40px;
    	height: 40px;
    	cursor: pointer;
    	border: 1px solid gray;
    	border-radius: 10px;
    }
    
    </style>
    <script type="text/javascript">
    	var num = ${dto.num};
    	$(function() {
			console.log("num=" + num);
			
			list(); //처음 시작 시 댓글 출력
			
			//댓글 삭제 이벤트
			$(document).on('click','.adel',function(){
				var a = confirm("정말 삭제하시겠습니까?");
				var idx = $(".adel").attr("idx")
				
				if(a){
					$.ajax({
						type: "get",
						url : "../answer/delete",
						data : {"idx":idx},
						success : function(res) {
							alert("삭제완료");
							location.reload();
						}
					});
				}				
			});
    	});
    	
    	function list() {
			var loginok = '${sessionScope.loginok}';
			var loginid = '${sessionScope.loginid}'; //로그인한 사람의 아이디
			var writerid = '${dto.id}'; //글쓴 사람의 아이디

    		var s="";
    	      $.ajax({
    	         type: "get",
    	         url: "../answer/list",
    	         dataType: "json",
    	         data:{"num":num},
    	         success:function(res){
    	            $("b.banswer").text(res.length); //댓글 갯수 출력
    	            $.each(res,function(i,elt){
    	               s+="<div>"+elt.name;
    	               if(elt.photo!='no'){
    	            	   s+="<a href='../upload/" + elt.photo + "' target='_new'>";
    	            	   s+="<img src='../upload/" + elt.photo + "'>";
    	            	   s+="</a>";
    	               }
    	               
    	               if(writerid==elt.id){
    	                   s+="<span class='writer'>작성자</span>";
    	               }
    	               
    	               s+="<br>";
    	               s+="<pre>"+elt.message;
    	               s+="<span class='day'>"+elt.writeday+"&nbsp;";
    	               
    	               if(loginok=='yes' && loginid==elt.id){
    	            	   s+='<i class="fa fa-close adel" style="font-size:17px" idx='+elt.idx+'></i>';
    	               }
    	               
    	               s+="</pre></span></div>";
    	            })
    	            $("div.alist").html(s);
    	         }
    	      })
    	}
    </script>
</head>
<body>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
				<h2><b>${dto.subject}</b></h2>
				<c:if test="${memphoto!='no'}"> <!-- 탈퇴한 회원은 사진 안나옴 -->
					<img src="../upload/${memphoto}" width="60" height="60" class="rounded-circle" 
					align="left" onerror="this.src='../image/noimage.jpg'" hspace="20">
				</c:if>				
				<b>${dto.name}(${dto.id})</b><br>
				<span style="color: #ccc; font-size: 13px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp;${dto.readcount} <!-- 조회수 증가 -->
				</span>
			</td>
		</tr>
		<tr height="300" valign="top">
			<td>
				<pre>${dto.content}</pre>
				<br><br>
				<c:if test="${dto.photo!='no'}">
					<c:forTokens var="photo" items="${dto.photo}" delims=",">
						<img src="../upload/${photo}" width="250" class="img-thumbnail" 
						onerror="this.style.display='none'"> <!-- 해당폴더에 없는 사진 안보이게 처리 -->
					</c:forTokens>
				</c:if>
				<br><br>
				<span class="likes">
					<i class='far fa-heart'></i>&nbsp;
					좋아요 <b>${dto.likes}</b>
				</span>
				&nbsp;&nbsp;
				<i class='far fa-comment-dots'></i>
				&nbsp;<b class="banswer">0</b>
				
				<br>
				<div class="alist">
					댓글목록
				</div>
				<c:if test="${sessionScope.loginok!=null}">
					<div class="aform">
						<form id="aform">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="id" value="${sessionScope.loginid}">
							<input type="hidden" name="name" value="${sessionScope.loginname}">
							
							<input type="file" id="upload" style="display: none;">
							<button type="button" class="btn btn-info btn-sm" id="btnphoto">사진</button>
							<img src="" id="aphoto" width="50" height="50" onerror="this.style.display='none'">
							<br>
							<div class="input-group">
								<textarea name="message" id="message" style="width: 400px; height: 60px;" 
								class="form-control"></textarea>
								<button type="button" class="btn btn-secondary btn-sm" id="btnasave">등록</button>
							</div>
						</form>
					</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='form'">새글</button>
			
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
			
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			
			<!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
			<c:if test="${sessionScope.loginok!=null && sessionScope.loginid==dto.id}">
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
			
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
			</c:if>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		//하트 클릭 시 빨간 하트 / 빈 하트 번갈아 나오게 하기
		$("span.likes").click(function() {
			//alert($(this).find("i").attr("class"));
			var heart = $(this).find("i").attr("class");
			if(heart=='far fa-heart') {
				$(this).find("i").attr("class", "fas fa-heart").css("color", "red");
			} else {
				$(this).find("i").attr("class", "far fa-heart").css("color", "black");
			}
			
			//ajax 이용해서 좋아요수 증가 후 출력
			var num = ${dto.num};
			console.log(num);
			$.ajax({
				type: "get",
				url : "likes",
				dataType : "json",
				data : {"num":num},
				success : function(res) {
					$("span.likes").find("b").text(res.likes);
				}
			});
		});
		
		//사진 버튼
		$("#btnphoto").click(function() {
			$("#upload").trigger("click");
		});
		//file 태그
		$("#upload").change(function() {
			var form = new FormData();
			form.append("photo", $("#upload")[0].files[0]); //선택한 1개만 추가

			$.ajax({
				type : "post",
				dataType : "json",
				url : "../answer/updatephoto",
				processData : false,
				contentType : false,
				data : form,
				success : function(res) {
					console.log(res.aphoto);
					
					$("#aphoto").attr("src", "../upload/" + res.aphoto);
					$("#aphoto").css("display","inline-block");
				}
			});
		});
		
		//댓글저장
		$("#btnasave").click(function() {
			var fdata = $("#aform").serialize(); //form 태그 안의 name을 쿼리 스트링 형태로 읽어온다
			//alert(fdata);
			$.ajax({
				type: "post",
				url : "../answer/insert",
				dataType : "text",
				data : fdata,
				success : function(res) {
					list(); //댓글 목록을 다시 db에서 가져와서 출력
					
					//입력값과 사진 안보이게 처리
					$("#message").val("");
					$("#aphoto").attr("src", "").css("display", "none");
				}
			});
		});
	</script>	
</body>
</html>















