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
	min-height: 400px;
}
.delivery-menu div{
	border: 1px solid gray;
}
.delivery-info{
	border: 1px solid gray;
	padding: 5px;
}
.name-box input{
	margin-left: 24px;
}
.address-box{
	margin-top: 20px;
}
.zib-code input{
	margin-left: 10px;
}
.address-input{
	width: 100%;
}
.request-box option{
	font-size: 30px;
}
.message-box input{
	width: 100%;
	margin-top: 5px;
}
/* 상품 정보 박스 */
.order-info-box{
	float: left;
	width: 40%;
	min-height: 300px;
	border: 1px solid gray;
}
.info-box{
	padding: 10px;
}
.info-set{
	margin-bottom: 30px;
}
.info-set div{
	margin: 10px 0;
}
.info-set input{
	margin-left: 10px;
}
.total-box div{
	margin-right: 10px;
}
/* 결제 수단 선택 창 */
.pay-box{
	float: left;
	width: 60%;
	min-height: 400px;
	border: 1px solid gray;
}
.pay-menu{
	border: 1px solid gray;
}
.pay-menu .menu-box{
	border-right: 1px solid black;
	width: 180px;
	text-align: center;
	padding: 5px;
}
.pay-choice div{
	margin: 10px 0;
	padding: 10px;
	height: 70px;
	border-bottom: 1px solid gray;
}


/* 최종 주문 정보 창 */
.total-order-box{
	float: left;
	width: 40%;
	min-height: 400px;
	border: 1px solid gray;
	border-left: none;
	padding: 10px;
}
.order-contents{
	border: 1px solid gray;
	min-height: 300px;
	padding: 5px;
}
.last-set div{
	margin: 10px 0;
}
.last-set input{
	margin: 0 10px;
}
.button-box{
	padding: 20px 52px;
}
.button-box button{
	width: 300px;
	text-align: center;
}


.display-none{
	display: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 1000px;">
	<div class="view-page">
		<!-- 상단 박스 -->
		<div class="up-contents">
			<div class="up-box">
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
						<div class="address-box">
							<h3>주소</h3>
							<div class="zib-code clearfix">
								<h5 class="float-left">우편번호</h5>
								<input class="float-left"> 
							</div>
							<div class="address">
								<h5>상세 주소</h5>
								<input  class="address-input">
							</div>
						</div>
						<div class="request-box">
							<h4>배송 시 요청 사항</h4>
							<select>
								<option>배송 시 요청 사항</option>
								<option>배송 전, 연락 바랍니다</option>
								<option>부재 시, 경비실에 맡겨 주세요</option>
								<option>부재 시, 문 앞에 놔주세요</option>
								<option>직접 입력</option>
							</select>							
						</div>
						<div class="message-box">
							<input>
						</div>						
					</div>
				</div>
				<!-- 주문 상품 정보 -->
				<div class="order-info-box">
					<div class="info-box">
						<div class="info-text">
							<h1>주문 상품 정보</h1>
						</div>
						<div class="info-box">
							<div class="info-set">
								<div class="item-name clearfix">
									<input class="float-right">
									<h4 class="float-right">상품명</h4>
								</div>
								<div class="item-option clearfix">
									<input class="float-right">
									<h4 class="float-right">세부 옵션</h4>
								</div>
								<div class="item-count clearfix">
									<input class="float-right">
									<h4 class="float-right">수량</h4>
								</div>
								<div class="item-price clearfix">
									<input class="float-right">
									<h4 class="float-right">가격</h4>
								</div>
							</div>
							<div class="info-set">
								<div class="item-name clearfix">
									<input class="float-right">
									<h4 class="float-right">상품명</h4>
								</div>
								<div class="item-option clearfix">
									<input class="float-right">
									<h4 class="float-right">세부 옵션</h4>
								</div>
								<div class="item-count clearfix">
									<input class="float-right">
									<h4 class="float-right">수량</h4>
								</div>
								<div class="item-price clearfix">
									<input class="float-right">
									<h4 class="float-right">가격</h4>
								</div>
							</div>
						</div>
						<!-- 상품 정보 묶음 -->
						<div class="info-total">
							<div class="total-box clearfix">
								<div class="float-right">
									<h4>건</h4>
								</div>
								<div class="float-right">
									<h4>X</h4>
								</div>
								<div class="float-right">
									<h4>총</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 컨텐츠 시작 -->
		<div class="down-contents">
			<div class="down-box clearfix">
				<!-- 결제 수단 선택창 -->
				<div class="pay-box">
					<div class="pay-text">
						<h1>결제 수단 선택</h1>
					</div>
					<div class="pay-menu clearfix">
						<div class="menu-box">
							<h4 style="margin: 0;">결제 수단 선택</h3>
						</div>
					</div>
					<div class="pay-choice">
						<div class="phone">
							<h2>핸드폰 결제</h2>
						</div>
						<div class="card">
							<h2>카드 결제</h2>
						</div>
						<div class="deposit">
							<h2>무통장 입금</h2>
						</div>
						<div class="transfer" style="border: none;">
							<h2>계좌이체</h2>
						</div>
					</div>
				</div>
				<!-- 최종 주문 정보창 -->
				<div class="total-order-box">
					<div class="order-text">
						<h1>최종 결제 정보</h1>
					</div>
					<div class="order-contents">
						<div class="last-set">
							<div class="item-price clearfix">
								<input class="float-right">
								<h5 class="float-right">상품 가격</h5>
							</div>
							<div class="delivery-price clearfix">
								<input class="float-right">
								<h5 class="float-right">배송비</h5>
							</div>
							<div class="coupon-price clearfix">
								<input class="float-right">
								<button class="float-right">쿠폰</button>
							</div> 
							<div class="total-price clearfix" style="margin-top: 50px;">
								<input class="float-right">
								<h5 class="float-right">결제 예정액</h5>
							</div>
						</div>
						<div class="button-box">
							<button>
								<h1>주문하기</h1>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</html>