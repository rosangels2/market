<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.*{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
/* 배송지 박스 */
.delivery-box{
	float: left;
	width: 60%;
	height: 400px;
	border: 1px solid gray;
}
.delivery-menu div{
	border: 1px solid gray;
}
.delivery-info{
	border: 1px solid gray;
}
/* 상품 정보 박스 */
.order-info-box{
	float: left;
	width: 40%;
	height: 400px;
	border: 1px solid gray;
}
.display-none{
	display: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 600px;">
	<div class="view-page">
		<!-- 상단 박스 -->
		<div class="up-contents">
			<div class="up-box clearfix">
				<!-- 배송지 정보 -->
				<div class="delivery-box">
					<div class="delivery-text">
						<h1>배송지 선택</h1>
					</div>
					<div class="delivery-menu clearfix">
						<div class="current float-left">
							<h4>최근 배송지</h4>
						</div>
						<div class="new float-left">
							<h4>새로운 배송지</h4>
						</div>
						<div class="list float-left">
							<h4>배송지 목록</h4>
						</div>
					</div>
					<div class="delivery-info">
						<div class="name-box clearfix">
							<h4 class="float-left">이름</h4>
							<input class="float-left">
						</div>
						<div class="phone-box clearfix">
							<h4 class="float-left">연락처</h4>
							<input class="float-left">							
						</div>
						<div class="address-box clearfix">
							<h4>주소</h4>
							<div class="entry"></div>
						</div>
						<div class="request-box clearfix">
							
						</div>
						<div class="message-box clearfix">
							
						</div>						
					</div>
				</div>
				<!-- 주문 상품 정보 -->
				<div class="order-info-box">

				</div>
			</div>
		</div>
		<div class="down-contents">
			
		</div>
	</div>
</div>
</html>