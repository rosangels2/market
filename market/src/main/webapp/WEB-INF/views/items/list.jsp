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
.category-cancel-box{
	float: left;
	width: 30px;
	padding: 5px;
	height: 50px;
}
.category .category-contents{
	position: relative;
	height: 50px;
	padding: 0 0 0 10px;
	margin-bottom: 10px;
}
.category-contents .category-box{
	position : relative;
	width: 300px;
	height: 50px;
}
.category-box .category-text{
	position: absolute;
	left: 0;
	margin: 4px 0 0 0;
}
.selected-category-box{
	position: relative;
	min-width: 30px;
	height: 50px;
	padding: 10px 10px;
}
.selected-category-box .category-text{
	margin: 0;
	padding: 5px 0 0 20px;
	min-width: 30px;
}
.category-box .category-text:hover{
	cursor: pointer;
}
.selected-category-box i{
	position: absolute;
	top: 7px;
	right: -40px;
	font-size: 40px;
} 
.selected-category-box i:hover{
	cursor: pointer;
}
#category-cancel:hover{
	cursor: pointer;
}
/* 페이지 선택창 */
.page-select-contents{
	height: 50px;
	position: relative;
	padding: 0 0 0 10px;
	margin-bottom: 30px;
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
	min-height : 200px;  
}
.item-contents{
	height: 150px;
	padding: 10px 10px;
	margin-bottom: 20px;
}
.item-contents:hover{
	background-color: #dee2e6;
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
	min-height: 30px;  
	width: 100%;  
}
.item-info h4{
	margin: 0;
	margin-bottom: 15px;  
}
.item-info h5{
	margin: 0;
	font-style: italic;
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
/* 카테고리 히든 페이지 */
.hidden-page{
	z-index: 10;
	min-height: 300px; 
	position: absolute; 
	width: 100%;
	background-color: rgb(250, 250, 250);
	top : 152px;
	padding-left: 10px;
}
.hidden-page .hidden-li{
	float:left;
	width : calc( 100% / 5);
	height : 200px; 
}
.category-ul .category-li{
	text-align: center;
}
.category-li a{
	color: black;
}

/* 하단 페이지 */
.bottom-contents{
	height: 200px;
}

/* 공통 */
.display-none{
	display: none;
}
input, select,.page-item{
	border-radius: 5pt;
}
.d {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.d:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
  cursor: pointer; 
}
.d1 {width:325px; height:280px; overflow:hidden }
select, input{
	border-radius: 5pt;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//카테고리 내림 아이콘 클릭 시
	$('.category-box .category-text').click(function(){
		$('.hidden-page').toggleClass('display-none');
	});
	
	//카테고리 취소 클릭 시
	$('#category-cancel').click(function(){
		$('#selected-category').addClass('display-none');
		$('#category-cancel').addClass('display-none');
		$('#category').val(0);
		$('#search-form').submit();
	});
	
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
	
	//게시글 개수 선택 시
	$('select[name=perPageNum]').change(function(){
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
							<input type="hidden" name="category" id="category" value="${pageMaker.criteria.category}">
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
							<h3 class="category-text">전체 카테고리</h3>
						</div>
						<c:forEach items="${categoryList}" var="category">
							<c:if test="${pageMaker.criteria.category eq category.no}">
								<div class="selected-category-box float-left clearfix" id="selected-category">
									<h5 class="category-text" style="padding: 0;">${category.kind}/${category.detail}</h5>
								</div>
								<div class="category-cancel-box clearfix">
									<h3 id="category-cancel" style="float:left;">X</h3>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<!-- 페이지 선택창  -->
				<div class="page-select">
					<div class="page-select-contents">
						<div class="list-select-box">
							<select name="type" id="type" style="border-radius: 5pt;">
								<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if> >최신 순으로 보기</option>
								<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if> >추천 많은 순으로 보기</option>
								<option value="3" <c:if test="${pageMaker.criteria.type eq 3}">selected</c:if> >낮은 가격 순으로 보기</option>
								<option value="4" <c:if test="${pageMaker.criteria.type eq 4}">selected</c:if> >높은 가격 순으로 보기</option>
								<option value="5" <c:if test="${pageMaker.criteria.type eq 5}">selected</c:if> >상품평 많은 순으로 보기</option>
							</select>
						</div>
						<div class="page-view">
							<select name="perPageNum" id="perPageNum">
								<option value="10" <c:if test="${pageMaker.criteria.perPageNum eq 10}">selected</c:if> >10개씩 보기</option>
								<option value="20" <c:if test="${pageMaker.criteria.perPageNum eq 20}">selected</c:if> >20개씩 보기</option>
								<option value="30" <c:if test="${pageMaker.criteria.perPageNum eq 30}">selected</c:if> >30개씩 보기</option>
								<option value="50" <c:if test="${pageMaker.criteria.perPageNum eq 50}">selected</c:if> >50개씩 보기</option>							
							</select>					
						</div>					
					</div>
				</div>
				<!-- 상품 목록창 -->
				<div class="item-list">
					<div class="item-list-contents">
						<c:forEach var="item" items="${itemList}">
							<div class="item-contents clearfix">
								<div class="item-img d1">
									<div class="clearfix d">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}&id=${user.id}">
											<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
										</a>
									</div>
								</div>
								<div class="item-info">
									<div>
										<h4>상품명</h4>
									</div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}&id=${user.id}">
											<h5>${item.title}</h5>
										</a>
									</div>
								</div>
								<div class="item-info">
									<div>
										<h4>가격</h4>
									</div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
											<h5>${item.price}</h5> 
										</a>
									</div>					
								</div>
								<div class="item-info">
									<div>
										<h4>추천 수</h4>
									</div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
											<h5>${item.commend}</h5>
										</a>
									</div>		
								</div>
								<div class="item-info">
									<div>
										<h4>판매자</h4>
									</div>
									<div class="item-link">
										<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
											<h5>${item.seller_id}</h5>
										</a>
									</div>				
								</div>
							</div>	
						</c:forEach>																		
					</div>
					<ul class="pagination" style="justify-content: center; margin-top: 20px;">
					    <c:if test="${pageMaker.prev}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&category=${pageMaker.criteria.category}&perPageNum=${pageMaker.criteria.perPageNum}">Previous</a>
					        </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
					       <c:if test="${pageMaker.criteria.page == index}">
					        <li class="page-item active">	<!-- 부트스트랩 active 클래스를 호출하여 css를 적용 -->
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&category=${pageMaker.criteria.category}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>
					        </li>
					       </c:if>
					       <c:if test="${pageMaker.criteria.page != index}">
					        <li class="page-item">	
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&category=${pageMaker.criteria.category}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>
					        </li>
					       </c:if>
					    </c:forEach>
					    <c:if test="${pageMaker.next}">
					        <li class="page-item">
					            <a class="page-link" href="<%=request.getContextPath()%>/items/list?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&category=${pageMaker.criteria.category}&perPageNum=${pageMaker.criteria.perPageNum}">Next</a>
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
		<!-- 카테고리 숨김 페이지 -->
		<div class="hidden-page clearfix display-none">
			<div class="hidden-contents clearfix">
				<ul class="clearfix" style="margin: 20px 0 0 0;" >
					<c:forEach items="${categoryKind}" var="kind">
						<li class="hidden-li">
							<div class="hidden-li-box">
								<h4 style="text-align: center; margin : 0;">${kind}</h3>
							</div>
							<ul class="category-ul">
								<c:forEach items="${categoryList}" var="category">
									<c:if test="${category.kind eq kind}">
										<li class="category-li">
											<input type="hidden" name="category_no" value="${category.no}">
											<a href="<%=request.getContextPath()%>/items/list?category=${category.no}">${category.detail}</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>				
					</c:forEach>							
				</ul>
			</div>
		</div>
	</div>
</html>
