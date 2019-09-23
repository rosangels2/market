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
	margin-bottom: 20px;
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
}
.category-box .category-menu{
	float: left;
	font-size: 40px;
}
.category-box .category-text{
	position: absolute;
	left: 5px;
	margin: 4px 0 0 0;
}
.category-box .down-arrow{
	position: absolute;
	left: 260px;
	font-size: 40px;
}  
.category-text:hover{
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
	min-height: 400px;
}
.items-li:hover{

}
.items-li .img-box{
	min-height: 310px;
	padding: 5px;
}
.items-li h5,
.items-li h6{
	margin: 5px 0 0 5px;
	color: black;
}
.img-box img{
	width: 350px;
	height: 300px;  
}
/* 더보기 */
.more-box{
	height: 35px;
	margin: 30px 0;
}
.more-view:hover{
	cursor: pointer;
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
	top : 170px;  
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

/* 공통 */
.display-none{
	display: none;
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
</style>
<script type="text/javascript">
var view = 6;

$(document).ready(function(){
	
	//카테고리 내림 아이콘 클릭 시
	$('.category-text').click(function(){
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
	
	//더보기 클릭 시
	$('.more-view').click(function(){
		var no = $('#view').val();
		id = $('#id').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:no,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/moreView",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	if(data.more != null){
	        		var str = "";
	        		for(i=0; i<data.more.length; i++){
	        			console.log("data.more["+i+"].no : " + data.more[i].no);
	        			str += '<li class="items-li d1"><div class="img-box d"><img src="<%=request.getContextPath()%>/resources/uploadFiles'+data.more[i].file+'"></div><a href="<%=request.getContextPath()%>/items/detail?item_no='+data.more[i].no+'&id='+id+'"><h5 style="text-align: center; font-style: italic;">'+data.more[i].title+'</h5><h6 style="text-align: center; font-style: oblique;">'+data.more[i].price+'원</h6></a></li>';
	        		}
	        		$('.items-ul').append(str);
	        		console.log("data.no : " + data.no);
	        		$('#view').val(data.no);
	        	}else{
	        		alert("이미지가 없습니다.");
	        	}
	        }
	 	 });
	});
	
});		//레디
</script>
</head>
	<div style="min-height: 1000px; position: relative;">
		<input type="hidden" value="${user.id}" id="id">
		<div class="views-page">
			<div class="search">
				<div class="search-contents">
					<form method="get" action="<%=request.getContextPath()%>/items/list" id="search-form">
						<div class="search-text">
							<img src="<%=request.getContextPath()%>/resources/images/search-text.jpg">
						</div>
						<div class="search-input">
							<input type="hidden" name="type" value="1">
							<input class="input" name="search" id="search" value="${pageMaker.criteria.search}" style="border-radius: 5pt;">
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
					</div>
				</div>
			</div>
			<div class="items">
				<div class="items-contents">
					<div class="items-box">
						<ul class="items-ul clearfix">
							<c:forEach items="${itemList}" var="item">
								<li class="items-li d1">
									<div style="overflow: hidden;">
										<div class="img-box d">
											<img src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
										</div>
									</div>
									<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}&id=${user.id}">
										<h5 style="text-align: center; font-style: italic;">${item.title}</h5>
										<h6 style="text-align: center; font-style: oblique;">${item.price}원</h6> 
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- 처음 보여줄 이미지 개수 -->
			<input type="hidden" id="view" value="6">
			<div class="more-box"> 
				<h2 class="more-view" style="display:block; width: 202px; margin: 0 auto;">이미지 더보기</h2>
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
