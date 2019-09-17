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
/* 배송자 등록 */
.register-contents{
	min-height: 200px;
}
.title{
	margin: 10px 0;
	padding: 10px;
}
.input-box{
	margin: 10px 0;
	padding: 10px;
}
.input-box div{
	float: left;
	margin-right: 20px;
}
.button-box{
	padding-top: 36px; 
}
.button-box button{
	float: right; 
}
/* 배송 목록 */
.list-contents{
	min-height: 200px;
}
.table{
	min-height: 200px;
}
.table-title{
	text-align: center;
	border-bottom: 1px solid gray;
}
.table-contents{
	text-align: center;
}
/* 하단 */
.bottom{
	min-height: 100px;
}
/* 공통 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#register-button').click(function(){
		if($('input[name=company]').val() == "" || $('input[name=delivery_no]').val() == ""){
			return false;
		}
		$('#register-form').submit();
	});
	
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
<div style="min-height: 1000px;">
	<div class="contents clearfix">
		<div class="contents-box clearfix">
			<!-- 배송자 등록 -->
			<div class="register-box">
				<div class="register-contents">
					<div class="title">
						<h2>배송자 등록</h2>
					</div>
					<form method="post" id="register-form" action="">
						<div class="input-box clearfix">
							<div class="deliverer">
								<h4>배송자</h4>
								<input name="deliverer" value="${user.name}">
							</div>
							<div class="phone">
								<h4>연락처</h4>
								<input name="phone" value="${user.phone}">
							</div>
							<div class="company">
								<h4>회사명</h4>
								<input name="company">
							</div>
							<div class="delivery_no">
								<h4>배송번호</h4>
								<input name="delivery_no">
							</div>
							<div class="button-box clearfix">
								<button type="button" id="register-button">등록하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- 검색창 -->
			<div class="search">
				<form action="" method="get" id="search-form">
					<div class="search-contents clearfix">
						<div class="search-text">
							<select name="type" id="type"> 
								<option value="1">출발지</option>
								<option value="2">도착지</option>
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
			<!-- 주문 정보 목록 -->
			<div class="list-box">
				<div class="list-contents">
					<table class="table">
						<tr class="table-title">
							<th width="10%">배송 번호</th>
							<th width="10%">주문 번호</th>
							<th width="40%">물품명</th>
							<th width="20%">출발지</th>
							<th width="20%">도착지</th>
						</tr>
						<c:forEach items="${deliveryList}" var="delivery">
							<tr class="table-contents">
								<th>${delivery.no}</th>
								<th>${delivery.buy_no}</th>
								<th>${delivery.contents}</th>
								<th>${delivery.start}</th>
								<th>${delivery.end}</th>
							</tr>
						</c:forEach>
					</table>
					<ul class="pagination" style="justify-content: center;">
					    <c:if test="${pageMaker.prev}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/delivery/register?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.criteria.perPageNum}">Previous</a>
					        </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
					       <c:if test="${pageMaker.criteria.page == index}">
					        <li class="page-item active">	<!-- 부트스트랩 active 클래스를 호출하여 css를 적용 -->
					            <a class="page-link" href="<%=request.getContextPath()%>/delivery/register?page=${index}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>
					        </li>
					       </c:if>
					       <c:if test="${pageMaker.criteria.page != index}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/delivery/register?page=${index}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>
					        </li>
					       </c:if>
					    </c:forEach>
					    <c:if test="${pageMaker.next}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/delivery/register?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.criteria.perPageNum}">Next</a>
					        </li>
					    </c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<div class="bottom"></div>
</div>
</html>