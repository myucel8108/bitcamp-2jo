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
    <style type="text/css">
    </style>
</head>
<body>
	<h2 class="alert alert-danger">총 ${totalCount}명의 회원이 있습니다</h2>
	<br>
	<table class="table table-bordered">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td style="width: 250px" align="center" rowspan="5">
					<img src="../upload/${dto.photo}" width="230px" height="250" border="1" id="showimg">
					<br>
					
					<!-- 로그인한 사람 것만 버튼이 보이도록 한다 -->			
					<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.loginid}">
						<input type="file" id="newphoto" style="display: none;" num="${dto.num}"> <!-- 사진 수정 시 호출 -->
						<button type="button" class="btn btn-info btnnewphoto">사진수정</button>
					</c:if>
				</td>
				<td style="width: 300px">회원명 : ${dto.name}</td>
				<td rowspan="5" align="center" valign="middle">
					<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.loginid}">				
						<button type="button" class="btn btn-secondary btnupdate" num="${dto.num}"
						data-bs-toggle="modal" data-bs-target="#myUpdateModal">수정</button>
						<br><br>
						<button type="button" class="btn btn-secondary btndelete" num="${dto.num}">삭제</button>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>아이디 : ${dto.loginid}</td>
			</tr>
			<tr>
				<td>이메일 : ${dto.email}</td>
			</tr>
			<tr>
				<td>핸드폰 : ${dto.hp}</td>
			</tr>
			<tr>
				<td>주소 : ${dto.address}</td>
			</tr>
		</c:forEach>
	</table>
	
		<!-- 회원수정창 -->
	<div class="modal" id="myUpdateModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 정보수정</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="input-group mb-3 input-group-sm">
	        	<span class="input-group-text">회원명</span>
	        	<input type="text" class="form-control" id="updatename">
	        </div>
	        <div class="input-group mb-3 input-group-sm">
	        	<span class="input-group-text">핸드폰</span>
	        	<input type="text" class="form-control" id="updatehp">
	        </div>
	        <div class="input-group mb-3 input-group-sm">
	        	<span class="input-group-text">이메일</span>
	        	<input type="text" class="form-control" id="updateemail">
	        </div>
	        <div class="input-group mb-3 input-group-sm">
	        	<span class="input-group-text">주소</span>
	        	<input type="text" class="form-control" id="updateaddr">
	        </div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	     	<button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnupdateok">수정</button>	      	
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript">
		$(".btnnewphoto").click(function() {
			$("#newphoto").trigger("click");
		});

		//사진 불러오면 미리보기 하기	
		$("#newphoto").change(function() {
			var num = $(this).attr("num");
			var form = new FormData();
			form.append("photo", $("#newphoto")[0].files[0]); //선택한 1개만 추가
			form.append("num", num);

			$.ajax({
				type : "post",
				dataType : "text",
				url : "updatephoto",
				processData : false,
				contentType : false,
				data : form,
				success : function(res) {
					location.reload();
				}
			});
		});
		
		//멤버 삭제
		$(".btndelete").click(function() {
			var num = $(this).attr("num");
			//alert(num);
			var ans = confirm("정말 탈퇴하시겠습니까?");
			if(ans){
				$.ajax({
					type: "get",
					url : "delete",
					dataType : "text",
					data : {"num":num},
					success : function(res) {
						alert("탈퇴했습니다");
						location.reload();
					}
				});
			}
		});
		
		//수정버튼 클릭 시 모달 다이얼로그에 데이터 넣기
		$(".btnupdate").click(function() {
			updatenum = $(this).attr("num");
			//alert(updatenum);
			$.ajax({
				type: "get",
				url : "updateform",
				dataType : "json",
				data : {"num":updatenum},
				success : function(res) {
					$("#updatename").val(res.name);
					$("#updatehp").val(res.hp);
					$("#updateemail").val(res.email);
					$("#updateaddr").val(res.address);
				}
			});
		});
		
		//수정
		$("#btnupdateok").click(function() {
			var updatename = $("#updatename").val();
			var updatehp = $("#updatehp").val();
			var updateemail = $("#updateemail").val();
			var updateaddr = $("#updateaddr").val();
			
			var data = "num=" + updatenum + "&name=" + updatename + "&hp=" + updatehp + "&email=" + updateemail + "&address=" + updateaddr;
			console.log(data);
			
			$.ajax({
				type: "post",
				url : "update",
				dataType : "text",
				data : data,
				success : function(res) {
					location.reload(); //새로고침
				}
			});
		});
	</script>
</body>
</html>




















