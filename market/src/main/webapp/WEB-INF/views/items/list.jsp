<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
*{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
ul{
	list-style: none;
	display: block;
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
/* 카테고리창 */
.category{

}
.category .category-contents{
	position: relative;
	height: 50px;
	padding: 0 0 0 10px;
	margin-bottom: 10px;
}
.category-contents .category-box{
	position : relative;
	border: 1px solid gray;
	width: 300px;
	height: 50px;
	padding-top: 5px;
}
.category-box .category-menu{
	position: absolute;
	left: 5px;
	font-size: 40px;
}
.category-box .category-text{
	position: absolute;
	left: 65px;
	margin: 4px 0 0 0;
}
.category-box .down-arrow{
	position: absolute;
	left: 260px;
	font-size: 40px;
}
.selected-category-box{
	position: relative;
	width: 250px;
	height: 50px;
	padding: 10px 10px;
	/* 선택된 카테고리창 숨김 */
	display: none;
}
.selected-category-box .category-text{
	margin: 0;
	width: 200px;
}
.selected-category-box i{
	position: absolute;
	font-size: 50px;
	top: 0;
	right: 0;
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
	right: 29px;
	top: 0px;
}
.page-view select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
}
/* 상품 리스트 */
.item-list-contents{
	min-height : 400px;
}
.item-contents{
	height: 150px;
	border-bottom: 1px solid gray;
	padding: 10px 10px;
}
.item-contents div{
	float: left;
}
.item-contents .item-img{
	width: 300px;
	height: 130px;
	margin-right: 50px;	
}
.item-contents .item-info{
	width: 180px;
	height: 130px;
	position: relative;
}
.item-info div{
	text-align: center;
	height: calc( 100% / 2 );
	width: 100%;
	padding-top: 15px;
}
.item-info h3{
	margin: 0;
}
.item-link a{
	color: black;
}
.item-img img{
	width: 300px;
	height: 130px;
}
/* 페이지네이션 */
.pagination{
	margin-top: 15px;
}

/* 하단 페이지 */
.bottom-contents{
	height: 200px;
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
	
	//상품 보기 변경 시
	$('#type').change(function(){
		$('#search-form').submit(); 
	});
	
});		//레디
</script>
</head>
	<div style="min-height: 1000px; position: relative;">
		<div class="views-page">
			<form method="get" action="<%=request.getContextPath()%>/items/list" id="search-form">
				<!-- 검색창 -->
				<div class="search">
					<div class="search-contents">
						<div class="search-text"><img src="<%=request.getContextPath()%>/resources/images/search-text.jpg"></div>
						<div class="search-input">
							<input class="input" name="search" id="search" value="${pageMaker.criteria.search}">
						</div>
						<div class="search-img">
							<i class="fas fa-search img" style="font-size: 40px;" id="search-icon"></i>
						</div>
					</div>
				</div>
				<!-- 카테고리창 -->
				<div class="category">
					<div class="category-contents clearfix">
						<div class="category-box float-left">
							<i class="fas fa-bars category-menu"></i>
							<h3 class="category-text">전체 카테고리</h3>
							<i class="fas fa-chevron-down down-arrow"></i>
						</div>
						<div class="selected-category-box float-left">
							<h3 class="category-text">현재 카테고리</h3>
							<i class="fas fa-times float-right"></i>
						</div>
					</div>
				</div>
				<!-- 페이지 선택창  -->
				<div class="page-select">
					<div class="page-select-contents">
						<div class="list-select-box">
							<select name="type" id="type">
								<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if> >최신 순으로 보기</option>
								<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if> >추천 많은 순으로 보기</option>
								<option value="3" <c:if test="${pageMaker.criteria.type eq 3}">selected</c:if> >낮은 가격 순으로 보기</option>
								<option value="4" <c:if test="${pageMaker.criteria.type eq 4}">selected</c:if> >높은 가격 순으로 보기</option>
								<option value="5" <c:if test="${pageMaker.criteria.type eq 5}">selected</c:if> >상품평 많은 순으로 보기</option>
							</select>
						</div>
						<div class="page-view">
							<select>
								<option>표시할 상품 개수</option>
								<option>10개씩 보기</option>
								<option>20개씩 보기</option>
								<option>30개씩 보기</option>
								<option>50개씩 보기</option>							
							</select>					
						</div>					
					</div>
				</div>
				<!-- 상품 목록창 -->
				<div class="item-list">
					<div class="item-list-contents">
						<c:forEach var="item" items="${itemList}">
							<div class="item-contents clearfix">
								<div class="item-img">
									<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}&id=${user.id}">
										<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
									</a>
								</div>
								<div class="item-info">
									<div><h3>상품명</h3></div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}&id=${user.id}">
											<h3>${item.title}</h3>
										</a>
									</div>
								</div>
								<div class="item-info">
									<div><h3>가격</h3></div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
											<h3>${item.price}</h3> 
										</a>
									</div>					
								</div>
								<div class="item-info">
									<div><h3>추천 수</h3></div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
											<h3>${item.commend}</h3>
										</a>
									</div>		
								</div>
								<div class="item-info">
									<div><h3>판매자</h3></div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
											<h3>${item.seller_id}</h3>
										</a>
									</div>				
								</div>
							</div>	
						</c:forEach>																		
					</div>
					<ul class="pagination" style="justify-content: center;">
					    <c:if test="${pageMaker.prev}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">Previous</a>
					        </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
					       <c:if test="${pageMaker.criteria.page == index}">
					        <li class="page-item active">	<!-- 부트스트랩 active 클래스를 호출하여 css를 적용 -->
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
					        </li>
					       </c:if>
					       <c:if test="${pageMaker.criteria.page != index}">
					        <li class="page-item">	
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
					        </li>
					       </c:if>
					    </c:forEach>
					    <c:if test="${pageMaker.next}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">Next</a>
					        </li>
					    </c:if>
					</ul>
				</div>	
				<div class="page-bottom">
					<div class="bottom-contents">
						
					</div>
				</div>
			</form>
		</div>
	</div>
</html>
