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
.views-page{

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
	border: 1px solid gray;
}
.category .category-contents{
	position: relative;
	height: 50px;
}
.category-contents .category-box{
	position : relative;
	width: 300px;
	height: 50px;
	padding-top: 5px;
	border-right: 1px solid gray;
}
.category-box .category-menu{
	position: absolute;
	left: 5px;
	font-size: 40px;
}
.category-box .category-text{
	position: absolute;
	left: 55px;
	margin: 4px 0 0 0;
}
.category-box .down-arrow{
	position: absolute;
	left: 260px;
	font-size: 40px;
}  
.down-arrow:hover{
	cursor: pointer;
}
/* 상품정보 */
.items{
	min-height: 450px;
	display: block;
}
.items-contents{

}
.items-contents .items-box{

}
.items-ul{
	margin: 0;
}
.items-box li{
	float:left;
	width: calc( 100% / 3 );
	height: 200px;
	border: 1px solid gray;
}
.items-li .img-box{
	height: 160px;
}
.items-li h5{
	margin: 5px 0 0 5px;
	color: black;
}
.img-box img{
	width: 368px;
	height: 160px;
}
/* 하단 */
.page-bottom{
	min-height: 100px;
}
/* 히든 숨김 페이지 */
.hidden-page{
	z-index: 10;
	min-height: 300px; 
	position: absolute; 
	width: 100%;
	background-color: white;
	top : 152px;
}
.hidden-page .hidden-li{
	float:left;
	width : calc( 100% / 5);
	height : 200px; 
	border : 1px solid gray;
}
.category-ul .category-li{
	text-align: center;
}
.category-li a{
	color: black;
}

/* 공통 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//카테고리 내림 아이콘 클릭 시
	$('.down-arrow').click(function(){
		$('.hidden-page').toggleClass('display-none');
	});
	
	//검색 아이콘 클릭 시
	$('#search-icon').click(function(){
		if($('#search').val() == ""){
			alert('검색값을 입력해 주세요.');
			return false;
		}
		$('#search-form').submit();
	});
	
});		//레디
</script>
</head>
	<div style="min-height: 1000px; position: relative;">
		<div class="views-page">
			<div class="search">
				<div class="search-contents">
					<form method="get" action="<%=request.getContextPath()%>/items/list" id="search-form">
						<div class="search-text">
							<img src="<%=request.getContextPath()%>/resources/images/search-text.jpg">
						</div>
						<div class="search-input">
							<input type="hidden" name="type" value="1">
							<input class="input" name="search" id="search" value="${pageMaker.criteria.search}">
						</div>
						<div class="search-img">
							<i class="fas fa-search img" style="font-size: 40px;" id="search-icon"></i>
						</div>
					</form>
				</div>
			</div>
			<div class="category">
				<div class="category-contents">
					<div class="category-box">
						<h3 class="category-text">전체 카테고리</h3>
						<i class="fas fa-chevron-down down-arrow"></i>
					</div>
				</div>
			</div>
			<div class="items">
				<div class="items-contents">
					<div class="items-box">
						<ul class="items-ul clearfix">
							<c:forEach items="${itemList}" var="item">
								<li class="items-li">
									<div class="img-box">
										<img src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
									</div>
									<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
										<h5 style="display: inline-block;">${item.title}</h5>
										<h5 style="float: right;">${item.price}원</h5>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="page-bottom">
			
			</div>
		</div>
		<!-- 히든 숨김 페이지 -->
		<div class="hidden-page clearfix display-none">
			<div class="hidden-contents clearfix">
				<ul class="clearfix" style="margin: 0;">
					<c:forEach items="${categoryKind}" var="kind">
						<li class="hidden-li">
							<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
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
