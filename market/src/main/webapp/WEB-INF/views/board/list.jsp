<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.container{
	min-width: 1140px;
	max-width: 2000px;
}
.contents-box{
	padding: 20px;
	min-width: 1100px;
}
.display-link a{
	color: black;
	text-decoration: none;
}
.table th{
	text-align: center;
}
/* 검색창 */
.search-contents{
	position: relative;
	height: 100px;
	padding-top: 30px;
}
.search-contents .search-text{
	position: absolute;
	right: 360px;
	top: 20px;
}
.search-text img{
	width: 150px;
	height: 50px;
}
.search-contents .search-input{
	position: absolute;
	right: 50px;
}
.search-input .input{
	width: 300px;
	height: 35px;
}
.search-contents .search-img{
	position: absolute;
	right: 0;
}
#type{
	margin-top: 16px;
}
/* 페이지 선택창 */
.page-select-contents{
	height: 50px;
	position: relative;
	padding: 0 0 0 10px;
}
.list-select-box{
	width: 300px;
	margin: 0;
	display: inline-block;
}
.list-select-box select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
}
.page-view{
	position: absolute;
	left: 0;
	top: 26px;
}
.page-view select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
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
select, input{
	border-radius: 5pt;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//검색 아이콘 클릭 시
	$('#search-icon').click(function(){
		if($('#search').val() == ""){
			alert('검색값을 입력해 주세요.');
			return false;
		}
		$('#search-form').submit();
	});
	
	//게시글 개수 선택 시
	$('select[name=perPageNum]').change(function(){
		$('#search-form').submit(); 
	});
	
});		//레디
</script>
</head>
<div style="min-height: 660px;">
	<div class="board-list">
		<div class="board-list-contents">
		<!-- 검색창 -->
			<div class="search">
				<form action="" method="get" id="search-form">
					<div class="search-contents clearfix">
						<div class="search-text">
							<select name="type" id="type"> 
								<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if> >작성자</option>
								<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if> >제목</option>
							</select>
						</div>
						<div class="search-input">
							<input class="input" name="search" id="search" value="${pageMaker.criteria.search}">
						</div>
						<div class="search-img">
							<i class="fas fa-search img" style="font-size: 40px;" id="search-icon"></i>
						</div>
						<div class="page-view float-left">
							<select name="perPageNum" id="perPageNum">
								<option value="10" <c:if test="${pageMaker.criteria.perPageNum eq 10}">selected</c:if> >10개씩 보기</option>
								<option value="20" <c:if test="${pageMaker.criteria.perPageNum eq 20}">selected</c:if> >20개씩 보기</option>
								<option value="30" <c:if test="${pageMaker.criteria.perPageNum eq 30}">selected</c:if> >30개씩 보기</option>
								<option value="50" <c:if test="${pageMaker.criteria.perPageNum eq 50}">selected</c:if> >50개씩 보기</option>							
							</select>					
						</div>	
					</div>
				</form>
			</div>
			<table class="table board-table">
				<!-- 테이블 타이틀 -->
				<tr class="table-title">
					<th width="10%" class="">번호</th>
					<th width="10%" class="">작성자</th>
					<th width="35%" class="">제목</th>
					<th width="15%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
				<!-- 테이블 컨텐츠 -->
				<c:if test="${boardList ne null}">
					<c:forEach items="${boardList}" var="board">
						<tr class="table-contents">
							<th>${board.no}</th>
							<th>${board.writer}</th>
							<th class="display-link"><a href="<%=request.getContextPath()%>/board/display?board_no=${board.no}">${board.title}</a></th>
							<th>${board.time}</th>
							<th>${board.views}</th>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<ul class="pagination" style="justify-content: center;">
			    <c:if test="${pageMaker.prev}">	<!-- 이전 버튼(boolean 값이 true면 보여준다) -->
			        <li class="page-item">
			            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">Previous</a>
			        </li>							<!-- 현재 페이지의 스타트 페이지에서 -1을 뺀 값을 페이지로 결정 -->
			    </c:if>
			    <!-- 페이지네이션 목록 -->																<!-- var xxx = 반복문의 i 역할 -->
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">	<!-- begin/end를 통해 시작과 끝을 지정하고 반복 -->
			        <c:if test="${pageMaker.criteria.page == index}">	<!-- uri의 페이지 번호가 index와 같다면 active를 추가-->
				        <li class="page-item active">
				            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>	<!-- 숫자를 찍는 역할 -->
				        </li>
			        </c:if>
			        <c:if test="${pageMaker.criteria.page != index}">	<!-- uri의 페이지 번호가 index와 다르다면 -->
				        <li class="page-item">								<!-- index : 반복문의 i같은 역할로 증감연산 -->
				            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>	<!-- 숫자를 찍는 역할 -->
				        </li>
			        </c:if>
			    </c:forEach>
			    <c:if test="${pageMaker.next}">	<!-- 다음버튼(boolean 값이 true면 보여준다) -->
			        <li class="page-item">
			            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">Next</a>
			        </li>
			    </c:if>
			</ul>
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