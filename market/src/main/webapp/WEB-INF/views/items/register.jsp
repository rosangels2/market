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
/* img / select 박스 */
.img-info-contents{

}
.img-info-contents .img-box{
	width: 60%;
	padding: 20px;
	float: left;
}
.img-info-contents .select-box{
	width: 40%;
	padding: 20px;
	float: left;
}
.img-box img{
	width: 620px;
	height: 555px;
}
.input-box div{
	margin-top: 10px;
}
.input-box option{
	font-size: 30px;
}
/* 옵션 텍스트 */
/* 옵션 상세 내용 */
.option-info-contents{
	border: 1px solid gray;
	padding: 20px 0;
}
.info-box{

}
.info-box input{
	float: left;
	margin: 20px 40px 0 40px;
	border: 1px solid gray;
	text-align: center;
}

/* 상품 정보 선택*/
.menu-info-box{
	min-height: 200px;
	border: 1px solid gray;
	padding: 10px;
	margin-bottom: 40px;
	position: relative;
}
.item-info .info-box img{
	width: 100%;
	height: 700px;
}
.file-box{
	padding: 20px 0;
}
.file-box input{
	width: 800px;
	margin-left: 30px;
	font-size: 25px;
}
.button-box{
	margin-top: 50px;
}
.button-box button{
	float: right;
	text-align: center;
	width: 200px;
	padding: 5px;
}
/* 하단 박스 */
.bottom-box{
	min-height: 200px;
}




/* 공통 적용 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 1000px;">
	<div class="views-page">
		<!-- 이미지 박스 -->
		<div class="img-info">
			<div class="img-info-contents clearfix">
				<div class="img-box clearfix">
					<div class="img-box-contents">
						<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
					</div>
				</div>
				<div class="input-box">
					<div class="seller">
						<h4>게시글 제목</h1>
						<input style="width: 400px; font-size: 25px;">
					</div>
					<div class="item-select">
						<h4>상품 선택</h4>
						<input style="width: 400px; font-size: 25px;">
					</div>			
					<div class="item-option">
						<h4>세부 옵션</h4>
						<input style="width: 400px; font-size: 25px;">
					</div>			
					<div class="item-stock">
						<h4>상품 재고</h4>
						<input readonly>
					</div>			
					<div class="item-price">
						<h4>가격</h4>
						<input readonly>
					</div>			
				</div>
			</div>
		</div>
		<!-- 옵션 텍스트 -->
		<div class="option-text">
			<div class="option-text-contents">
				<h1>선택 옵션</h1>
			</div>
		</div>
		<!-- 선택 옵션 정보 -->
		<div class="option-info">
			<div class="option-info-contents">
				<div class="info-box clearfix">
					<input readonly value="선택 옵션">
					<input readonly value="세부 옵션">
					<input readonly value="상품 재고">
					<input readonly value="가격">
				</div>
				<div class="info-box clearfix">
					<input readonly>
					<input readonly>
					<input readonly>
					<input readonly>
				</div>
				<div class="info-box clearfix">
					<input readonly>
					<input readonly>
					<input readonly>
					<input readonly>
				</div>
			</div>
		</div>
		<!-- 메뉴 선택 박스 -->
		<div class="contents-text">
			<h2>내용</h2>
		</div>
		<!-- 선택한 메뉴의 html -->
		<div class="menu-info">
			<div class="menu-info-contents">
				<div class="menu-info-box">
					<!-- 상품 상세 정보 -->
					<div class="item-info">
						<div class="info-box">
							<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
							<h5>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h5>
							<img alt="" src="<%=request.getContextPath()%>/resources/images/남자 면티.jpg">
						</div>
					</div>
					<div class="contents-bottom">
						<div class="bottom-box">
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="file-box clearfix">
			<h3 class="float-left">첨부파일</h3>
			<input class="float-left">
		</div>
		<div class="button-box clearfix">
			<button><h3>등록하기</h3></button>
		</div>
		<div class="bottom-box">
			<div class="bottom-contents">
			
			</div>
		</div>
	</div>
</div>
</html>