<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.contents-box div{
	margin-top: 30px;
}
.contents-box input{
	margin-left: 30px;
	font-size: 25px;
}
.title-box input{
	width: 80%;
	margin-left: 58px;
}
.writer-box input{
	width: 300px;
}
.register-date-box input{
	width: 300px;
}
.view-count-box input{
	width: 300px;
}
.contents .box{
	min-height: 200px;
	border: 1px solid gray;
}
.board-contents-box{
	position: relative;
}
.board-contents-box input{
	margin: 0;
	width: 100%;
	min-height: 200px; 
}
.button-box button{
	width:150px;
	text-align: center;
	float: right;
}
select, input{
	border-radius: 5pt;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 1000px;">
	<div class="board-display">
		<div class="display-contents">
			<div class="display-box">
				<form action="<%=request.getContextPath()%>/admin/boardModify" method="post" id="modify-form">
					<div class="contents-box">
						<div class="title-box clearfix">
							<h3 class="float-left">제목</h3>
							<input type="hidden" value="${bVo.no}" name="no"> 
							<input type="hidden" name="category" value="공지사항">
							<input class="float-left" name="title" value="${bVo.title}" >
						</div>
						<div class="writer-box clearfix">
							<h3 class="float-left">작성자</h3>
							<input class="float-left" name="writer" value="${bVo.writer}" readonly>
						</div>
						<div class="board-contents">
							<h3>내용</h3>
							<div class="board-contents-box">
								<input name="contents" value="${bVo.contents}" >
							</div>
						</div>
						<div class="button-box clearfix">
						<c:if test="${user.grade eq 'admin'}">
							<button>
									<h4>수정 완료</h4>
							</button>
						</c:if>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</html>