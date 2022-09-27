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
    <style type="text/css">
    </style>
</head>
<body>
	<div class="searcharea" style="width: 100%; text-align: center;">
		<!-- 검색창 -->
		<form action="list">
			<div class="input-group" style="width: 450px;">
				<select class="form-select" style="width: 150px;" name="searchcolumn">
					<option value="subject">제목</option>
					<option value="id">아이디</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="searchword" class="form-control" style="width: 140px;" 
				placeholder="검색단어" value="${param.searchword}">
				
				<button type="submit" class="btn btn-success">검색</button>
			</div>
		</form>
		
		<a href="list?searchcolumn=id&searchword=${sessionScope.loginid}">내가 쓴 글</a>
	</div>
	<div class="boardlist">
		<h3 class="alert alert-danger">총 ${totalCount}개의 글이 있습니다</h3>
		<br><br>
		<table class="table table-bordered">
			<tr style="background-color: #ddd">
				<th style="width: 50px;">번호</th>
				<th style="width: 350px;">제목</th>
				<th style="width: 80px;">작성자</th>
				<th style="width: 120px;">작성일</th>
				<th style="width: 50px;">조회</th>
				<th style="width: 50px;">좋아요</th>
			</tr>
			<c:if test="${totalCount==0}">
				<tr>
					<td colspan="6" align="center">
						<h4>등록된 글이 없습니다</h4>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${totalCount>0}">
				<c:forEach var="dto" items="${list}">
					<tr>
						<td align="center">${no}</td>
						<c:set var="no" value="${no-1}"/>
						<td>
							<!-- 답글일 경우 level 1당 2칸 띄우기 -->
							<c:forEach begin="1" end="${dto.relevel}">
								&nbsp;&nbsp;
							</c:forEach>
							<!-- 답글일 경우 답글 이미지 넣기 -->
							<c:if test="${dto.relevel>0}">
								<img src="../image/re.png">
							</c:if>
							<a href="detail?num=${dto.num}&currentPage=${currentPage}" style="color: black;">
							${dto.subject}</a>
							<c:if test="${dto.photo!='no'}"><i class='far fa-file-image'></i></c:if>
							
							<!-- 댓글이 1개 이상인 경우에 댓글 개수 출력 -->
							<c:if test="${dto.acount>0}">
								<b style="color: red;">[${dto.acount}]</b>
							</c:if>
						</td>
						<td align="center">${dto.name}</td>
						<td align="center">
							<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
						</td>
						<td align="center">${dto.readcount}</td>
						<td align="center">${dto.likes}</td>
					</tr>			
				</c:forEach>
			</c:if>
			<c:if test="${sessionScope.loginok!=null}">
				<tr>
					<td colspan="6" align="center">
						<button type="button" class="btn btn-outline-success" onclick="location.href='form'">글쓰기</button>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
	<div class="paging" style="margin-left: 200px;">
		<ul class="pagination">
			<c:if test="${startPage>1}">
				<li class="page-item"><a href="list?currentPage=${startPage-1}" class="page-link">이전</a></li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${pp==currentPage}">
					<li class="page-item active"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
				</c:if>
				<c:if test="${pp!=currentPage}">
					<li class="page-item"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage<totalPage}">
				<li class="page-item"><a href="list?currentPage=${endPage+1}" class="page-link">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>














