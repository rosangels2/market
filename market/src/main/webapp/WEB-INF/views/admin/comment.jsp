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
/* 메뉴 */
.menu-box{
	min-height: 100px;
	padding: 30px 0;
}
.menu-contents div{
	float: left;
	border: 1px solid gray;
	margin-right: 20px;
	cursor: pointer;
}
.table-title{
	text-align: center; 
}
.table-title th{
}
.th-last{
}
.table-contents th{
	text-align: center;
}
.bottom-box{
	min-height: 100px;
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

/* 공통 */
.background-gray{
	background-color: gray;
}
.display-none{
	display: none;
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
	
	//댓글 삭제 클릭 시
	$('.comment-delete').click(function(){
		var box = $(this).parent();
		var no = $(this).siblings().first().text();
		var test = confirm('정말로 삭제하시겠습니까?');
		if(!test){
			return;
		}else{		//삭제 확인 시
			$.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:no,
		        url:"<%=request.getContextPath()%>/admin/deleteComment",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		        	if(data){
		        		box.remove();
		        	}else{
		        		alert("요청이 실패했습니다.");
		        	}
		        }
		  });
		}
	});
	
});		//레디

</script>
</head>
<div style="min-height: 1000px;">
	<div class="board-box">
		<div class="board-contents">
			<!-- 검색창 -->
			<div class="search">
				<form action="" method="get" id="search-form">
					<div class="search-contents clearfix">
						<div class="search-text">
							<select name="type" id="type"> 
								<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if> >ID</option>
								<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if> >내용</option>
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
			<!-- 댓글 관리 -->
			<div class="comment-board">
				<div class="comment-contents">
					<table class="table">
						<tr class="table-title">
							<th width="10%">번호</th>
							<th width="10%">작성자</th>
							<th width="50%">내용</th>
							<th width="20%">등록일</th>
							<th width="10%">관리</th>	
						</tr>
						<c:forEach items="${commentList}" var="comment">
							<tr class="table-contents">
								<th>${comment.no}</th>
								<th>${comment.writer}</th>
								<th>${comment.contents}</th>							
								<th>${comment.time}</th>
								<th class="comment-delete">삭제</th>
							</tr>
						</c:forEach>
					</table>	
					<ul class="pagination" style="justify-content: center;">
					    <c:if test="${pageMaker.prev}">	<!-- 이전 버튼(boolean 값이 true면 보여준다) -->
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/admin/comment?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">Previous</a>
					        </li>							<!-- 현재 페이지의 스타트 페이지에서 -1을 뺀 값을 페이지로 결정 -->
					    </c:if>
					    <!-- 페이지네이션 목록 -->																<!-- var xxx = 반복문의 i 역할 -->
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">	<!-- begin/end를 통해 시작과 끝을 지정하고 반복 -->
					        <c:if test="${pageMaker.criteria.page == index}">	<!-- uri의 페이지 번호가 index와 같다면 active를 추가-->
						        <li class="page-item active">
						            <a class="page-link" href="<%=request.getContextPath()%>/admin/comment?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>	<!-- 숫자를 찍는 역할 -->
						        </li>
					        </c:if>
					        <c:if test="${pageMaker.criteria.page != index}">	<!-- uri의 페이지 번호가 index와 다르다면 -->
						        <li class="page-item">								<!-- index : 반복문의 i같은 역할로 증감연산 -->
						            <a class="page-link" href="<%=request.getContextPath()%>/admin/comment?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>	<!-- 숫자를 찍는 역할 -->
						        </li>
					        </c:if>
					    </c:forEach>
					    <c:if test="${pageMaker.next}">	<!-- 다음버튼(boolean 값이 true면 보여준다) -->
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/admin/comment?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">Next</a>
					        </li>
					    </c:if>
					</ul>												
				</div>				
			</div>
		</div>	<!-- 보드 컨텐츠 끝 -->
		<!-- 하단  -->
		<div class="bottom">
			<div class="bottom-box">
			
			</div>
		</div>
	</div>
</div>
</html>