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
/* 페이지 선택창 */
.page-select-contents{
	height: 50px;
	position: relative;
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
	right: 0;
	margin:20px 0 0 0;
	top: 0px;
}
.page-view select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
}
/* 상품 리스트 */
.item-list-contents{
	min-height : 600px;
}  
.item-contents{
	margin-top: 20px;
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
.item-info button{
	width: 150px;
	text-align: center;
	font-size: 30px;
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
.item-info-last{
	float: right;
}
/* 더보기 버튼 */
.more-img-box{
	margin-top: 50px;
	height: 60px;
}
.more-img-box .more-img{
	font-size: 60px;
	left: 500px;
}
/* 하단 페이지 */
.bottom-contents{
	height: 200px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.item-link').click(function(){
		location.href="<%=request.getContextPath()%>/items/detail";
	});
	$('.item-img').click(function(){
		location.href="<%=request.getContextPath()%>/items/detail";
	});
});
</script>
</head>
	<div style="min-height: 1000px; position: relative;">
		<div class="views-page">
			<!-- 페이지 선택창  -->
			<div class="page-select">
				<div class="page-select-contents">
					<div class="page-view clearfix">
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
					<div class="item-contents clearfix">
						<div class="item-img">
							<a href="#">
								<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
							</a>
						</div>
						<div class="item-info">
							<div><h3>상품명</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>
						</div>
						<div class="item-info">
							<div><h3>가격</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>					
						</div>
						<div class="item-info" style="float: right">
							<div>
								<button>수정</button>
							</div>
							<div>
								<button>삭제</button>
							</div>		
						</div>
					</div>
					<div class="item-contents clearfix">
						<div class="item-img">
							<a href="#">
								<img alt="" src="<%=request.getContextPath()%>/resources/images/광선검.png">
							</a>
						</div>
						<div class="item-info">
							<div><h3>상품명</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>
						</div>
						<div class="item-info">
							<div><h3>가격</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>				
						</div>
						<div class="item-info" style="float: right">
							<div>
								<button>수정</button>
							</div>
							<div>
								<button>삭제</button>
							</div>					
						</div>				
					</div>
					<div class="item-contents clearfix">
						<div class="item-img">
							<a href="#">
								<img alt="" src="<%=request.getContextPath()%>/resources/images/남자 면티.jpg">
							</a>
						</div>
						<div class="item-info">
							<div><h3>상품명</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>
						</div>
						<div class="item-info">
							<div><h3>가격</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>					
						</div>
						<div class="item-info" style="float: right">
							<div>
								<button>수정</button>
							</div>
							<div>
								<button>삭제</button>
							</div>					
						</div>				
					</div>
					<div class="item-contents clearfix">
						<div class="item-img">
							<a href="#">
								<img alt="" src="<%=request.getContextPath()%>/resources/images/목걸이.jpg">
							</a>
						</div>
						<div class="item-info">
							<div><h3>상품명</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>
						</div>
						<div class="item-info">
							<div><h3>가격</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>				
						</div>
						<div class="item-info" style="float: right">
							<div>
								<button>수정</button>
							</div>
							<div>
								<button>삭제</button>
							</div>					
						</div>					
					</div>
					<div class="item-contents clearfix">
						<div class="item-img">
							<a href="#">
								<img alt="" src="<%=request.getContextPath()%>/resources/images/호랑이 잠옷.jpg">
							</a>
						</div>
						<div class="item-info">
							<div><h3>상품명</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>
						</div>
						<div class="item-info">
							<div><h3>가격</h3></div>
							<div class="item-link">
								<a href="#">
									<h3>xxxxxxx</h3>
								</a>
							</div>						
						</div>
						<div class="item-info" style="float: right">
							<div>
								<button>수정</button>
							</div>
							<div>
								<button>삭제</button>
							</div>					
						</div>				
					</div>																				
				</div>
			</div>
			<div class="more-img-box" style="text-align: center;">
				<i class="fas fa-plus-square more-img"></i>
			</div>			
			<div class="page-bottom">
				<div class="bottom-contents">
					
				</div>
			</div>
		</div>
	</div>
</html>
