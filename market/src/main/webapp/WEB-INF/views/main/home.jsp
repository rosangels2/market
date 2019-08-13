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
	border: 1px solid gray;
}
.category .category-contents{
	position: relative;
	height: 50px;
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
	border-bottom: 1px solid gray;
}
.items-li h5{
	margin: 5px 0 0 5px;
	color: black;
}
.img-box img{
	width: 368px;
	height: 160px;
}
/* 더보기 버튼 */
.more-img-box{
	height: 60px;
}
.more-img-box .more-img{
	font-size: 60px;
	left: 500px;
}
/* 히든 숨김 페이지 */
.hidden-page{
	z-index: 10;
	min-height: 300px; 
	position: absolute; 
	width: 100%;
	background-color: white;
	top : 152px;
	/* 전체 카테고리 창 숨김 */
 	display: none; 
}
.hidden-page .hidden-li{
	float:left;
	width : calc( 100% / 5);
	height : 150px;
	border : 1px solid gray;
}
.category-ul .category-li{
	text-align: center;
}
.category-li a{
	color: black;
}
</style>
</head>
	<div style="min-height: 630px; position: relative;">
		<div class="views-page">
			<div class="search">
				<div class="search-contents">
					<div class="search-text"><img src="<%=request.getContextPath()%>/resources/images/search-text.jpg"></div>
					<div class="search-input"><input class="input"></div>
					<div class="search-img"><i class="fas fa-search img" style="font-size: 40px;"></i></div>
				</div>
			</div>
			<div class="category">
				<div class="category-contents">
					<div class="category-box">
						<i class="fas fa-bars category-menu"></i>
						<h3 class="category-text">전체 카테고리</h3>
						<i class="fas fa-chevron-down down-arrow"></i>
					</div>
				</div>
			</div>
			<div class="items">
				<div class="items-contents">
					<div class="items-box">
						<ul class="items-ul clearfix">
							<li class="items-li">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/resources/images/광선검.png">
								</div>
								<a href="#">
									<h5 style="display: inline-block;">광선검</h5>
									<h5 style="float: right;">30000원</h5>
								</a>
							</li>
							<li class="items-li">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/resources/images/남자 면티.jpg">
								</div>
								<a href="#">
									<h5 style="display: inline-block;">남자 면티</h5>
									<h5 style="float: right;">20000원</h5>
								</a>
							</li>
							<li class="items-li">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/resources/images/목걸이.jpg">
								</div>
								<a href="#">
									<h5 style="display: inline-block;">목걸이</h5>
									<h5 style="float: right;">30000원</h5>
								</a>						
							</li>
							<li class="items-li">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
								</div>
								<a href="#">
									<h5 style="display: inline-block;">블라우스</h5>
									<h5 style="float: right;">30000원</h5>
								</a>						
							</li>
							<li class="items-li">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/resources/images/큐티 권총.jpg">
								</div>
								<a href="#">
									<h5 style="display: inline-block;">큐티 권총</h5>
									<h5 style="float: right;">30000원</h5>
								</a>						
							</li>
							<li class="items-li">
								<div class="img-box">
									<img src="<%=request.getContextPath()%>/resources/images/호랑이 잠옷.jpg">
								</div>
								<a href="#">
									<h5 style="display: inline-block;">호랑이 잠옷</h5>
									<h5 style="float: right;">30000원</h5>
								</a>					
							</li>
							<li class="items-li">
								<div class="img-box">
									
								</div>
								<a href="#">
									<h5 style="display: inline-block;">블라우스</h5>
									<h5 style="float: right;">30000원</h5>
								</a>						
							</li>
							<li class="items-li">
								<div class="img-box">
									
								</div>
								<a href="#">
									<h5 style="display: inline-block;">큐티 권총</h5>
									<h5 style="float: right;">30000원</h5>
								</a>						
							</li>
							<li class="items-li">
								<div class="img-box">
									
								</div>
								<a href="#">
									<h5 style="display: inline-block;">호랑이 잠옷</h5>
									<h5 style="float: right;">30000원</h5>
								</a>					
							</li>	
						</ul>
					</div>
					<div class="more-img-box" style="text-align: center;">
						<i class="fas fa-plus-square more-img"></i>
					</div>
				</div>
			</div>
			<div class="page-bottom">
			
			</div>
		</div>
		<!-- 히든 숨김 페이지 -->
		<div class="hidden-page">
			<div class="hidden-contents">
				<ul class="clearfix" style="margin: 0;">
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>					
					<li class="hidden-li">
						<div class="hidden-li-box" style="border-bottom: 1px solid gray;">
							<h4 style="text-align: center; margin : 0;">카테고리 분류</h3>
						</div>
						<ul class="category-ul">
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
							<li class="category-li"><a href="#">카테고리 상세</a></li>
						</ul>					
					</li>														
				</ul>
			</div>
		</div>
	</div>
</html>
