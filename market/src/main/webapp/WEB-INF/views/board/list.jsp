<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.display-link a{
	color: black;
	text-decoration: none;
}
.table th{
	text-align: center;
}
/* 하단 */
.board-bottom{
	min-height: 100px;
}
.button-contents-box{
	margin-top: 50px;
	padding: 10px;
}
.register-button{
	float: right;
	margin-right: 60px;
}

/* 공통 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 400px;">
	<div class="board-list">
		<div class="board-list-contents">
			<table class="table board-table">
				<!-- 테이블 타이틀 -->
				<tr class="table-title">
					<th width="15%" class="">번호</th>
					<th width="30%" class="">제목</th>
					<th width="15%" class="">작성자</th>
					<th width="25%">작성일</th>
					<th width="15%">조회수</th>
				</tr>
				<!-- 테이블 컨텐츠 -->
				<c:if test="${boardList ne null}">
					<c:forEach items="${boardList}" var="board">
						<tr class="table-contents">
							<th>${board.no}</th>
							<th class="display-link"><a href="<%=request.getContextPath()%>/board/display?board_no=${board.no}">${board.title}</a></th>
							<th>${board.writer}</th>
							<th>${board.time}</th>
							<th>${board.views}</th>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="button-contents">
				<div class="button-contents-box clearfix">
					<c:if test="${user.grade eq 'admin'}">
						<a href="<%=request.getContextPath()%>/admin/boardRegister">
							<button class="register-button">게시글 등록</button>
						</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="board-bottom">
		
		</div>
	</div>
</div>
</html>