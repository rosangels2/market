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
/* 상단 박스 */
.up-contents{

}
/* 배송지 박스 */
.delivery-box{
	float: left;
	width: 60%;
	min-height: 400px;
}
.delivery-menu{
	position: relative;
}
.delivery-menu div{
	border: 1px solid gray;
	border-bottom: none;
	padding: 5px 10px;
}
.delivery-info{ 
	padding: 10px;
	border: 1px solid gray;
}
.name-box{
	margin: 10px 0 8px 0; 
}  
.name-box input{
	margin-left: 54px;
}
.phone-box input{
	margin-left: 30px;
}
.address-box{
	margin: 10px 0 20px 0;
}
.address-box input{
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
}
.info-text h1{
	text-align: center;
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

/* 하단 박스 */
.down-contents{
	position: relative;
}
/* 결제 수단 선택 창 */
.pay-box{
	margin-top: 50px;
	float: left;
	width: 60%;
	min-height: 400px;
	border: 1px solid gray;
}
.pay-menu{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
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
	margin-top: 82px;
	float: left;
	width: 40%;
	min-height: 400px;
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
.last-set input{
	text-align: right;
}


/* 숨김 페이지 */
.hidden-contents{
	position: absolute;
	min-height: 100px;
	width: 90%;
	border: 1px solid gray;
	z-index: 10;
	top: 50px;
	background-color: white;
}
.table-title{
	
}
.table-title th{
	text-align: center;
}
.table-contents th{
	text-align: center;
}
.coupon-cancel{
	margin: 20px 0;
	padding: 10px 59px 10px 10px;
}
.coupon-cancel .cancel{
	margin-right: 40px;  
}  


/* 배송지 목록 숨김창 */
.delivery-menu .delivery-list{
	position: absolute;
	top: 0;
	min-width: 600px;
	min-height: 200px;
	z-index: 20;
	border: 1px solid gray;
	background-color: white; 
}
.addressList-cancel{
	float: right;
	margin: 20px;
}


/* 공통 */
.background-gray{
	background-color: gray;
}
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
var discount; 
var delivery_code = 0;
var name = "${user.name}";
var phone = "${user.phone}";
var address = "${user.address}";

$(document).ready(function(){
	if($('#total_price').val() < 30000){
		$('#delivery_price').val(3000);
		var t = $('#total_price').val();
		$('#last_price').val(parseInt(t)+3000); 
	}else{
		$('#delivery_price').val(0);
		$('#last_price').val($('#total_price').val());
	}
	
	$('.coupon-price button').click(function(){
		$('.hidden-contents').removeClass('display-none');
	});
	
	$('.coupon-cancel button').click(function(){
		$('.hidden-contents').addClass('display-none');
	});
	
	$('.coupon-use').click(function(){
		var t = $('#total_price').val();
		var a = $(this).siblings('#coupon-discount').val();
		$('input[name=coupon_no]').val($(this).siblings('.coupon_no').val());
		if($('#total_price').val() < 30000){
			$('#delivery_price').val(3000);
			$('#coupon_price').val(parseInt(a));
			$('#last_price').val(parseInt(t)+3000-parseInt(a)); 
			$('.hidden-contents').addClass('display-none');
		}else{
			$('#delivery_price').val(0);
			$('#coupon_price').val(parseInt(a));
			$('#last_price').val(parseInt(t)-parseInt(a)); 
			$('.hidden-contents').addClass('display-none');
		}
	});

	$('.coupon-cancel .cancel').click(function(){
		$('.hidden-contents').addClass('display-none');
		if($('#total_price').val() < 30000){
			$('#delivery_price').val(3000);
			var t = $('#total_price').val();
			$('#last_price').val(parseInt(t)+3000); 
			$('#coupon_price').val("");
		}else{
			$('#delivery_price').val(0);
			$('#last_price').val($('#total_price').val());
			$('#coupon_price').val(0);
		}
	});
	

	$('.delivery-menu .my').click(function(){
		$('.name-box input').val(name);
		$('.phone-box input').val(phone);
		$('.address input[name=address]').val(address);
		$(this).siblings().removeClass('background-gray');
		$(this).addClass('background-gray');
		delivery_code = 0;
		$('input[name=delivery_code]').val(0);
	});
	
	$('.delivery-menu .new').click(function(){
		$('.name-box input').val("");
		$('.phone-box input').val("");
		$('.address input[name=address]').val("");
		$(this).siblings().removeClass('background-gray');
		$(this).addClass('background-gray');
		delivery_code = 1;
		$('input[name=delivery_code]').val(1);
	});
	
	$('.delivery-menu .list').click(function(){
		$('.delivery-list').removeClass('display-none');
	});
	
	$('#addressList-cancel').click(function(){
		$('.delivery-list').addClass('display-none');
	});
	
	$('.address-select').click(function(){
		var name = $(this).parent().siblings('.list-name').html();
		var phone = $(this).parent().siblings('.list-phone').html();
		var address = $(this).parent().siblings('.list-address').html();
		$('.name-box input[name=name]').val(name);
		$('.phone-box input[name=phone]').val(phone);
		$('.address-box input[name=address]').val(address);
		$('.delivery-list').addClass('display-none');
		delivery_code = 0;
		$('input[name=delivery_code]').val(0);
		var s = $(this).siblings('.address-no').val();
		$('input[name=address_no]').val(s);
	}); 
	
	$('#request-select').change(function(){
		if($(this).val() == 0){
			$('.message-box input[name=request]').val("요청 사항 없음");
		}else if($(this).val() == 1){
			$('.message-box input[name=request]').val("배송 전, 연락 바랍니다");
		}else if($(this).val() == 2){
			$('.message-box input[name=request]').val("부재 시, 경비실에 맡겨 주세요");
		}else if($(this).val() == 3){
			$('.message-box input[name=request]').val("부재 시, 문 앞에 놔주세요");
		}else if($(this).val() == 4){
			$('.message-box input[name=request]').val("");
		}
	});
	
	$('#order').click(function(){
		if($('.name-box input[name=name]').val() == ""){
			return false;
		}
		if($('.phone-box input[name=phone]').val() == ""){
			return false;
		}
		if($('.address-box input[name=address]').val() == ""){
			return false;
		}
		if($('.message-box input[name=request]').val() == ""){
			return false;
		}
		$('#order-form').submit();
	});
	

});	//레디

</script>
</head>
<div style="min-height: 1000px;">
	<div class="view-page">
		<form method="post" action="<%=request.getContextPath()%>/items/orderRequest" id="order-form">
			<!-- 상단 박스 -->
			<div class="up-contents">
				<div class="up-box clearfix">
					<!-- 배송지 정보 -->
					<div class="delivery-box">
						<div class="delivery-text">
							<h1>배송지 선택</h1>
						</div>
						<div class="delivery-menu clearfix">
							<div class="my float-left background-gray">
								<h4>내 배송지</h4>
							</div>
							<div class="new float-left">
								<h4>새로운 배송지</h4>
							</div>
							<div class="list float-left">
								<h4>배송지 목록</h4>
							</div>
							<input type="hidden" name="delivery_code" value="0"> 
							<input type="hidden" name="id" value="${user.id}">
							<!-- 배송지 목록 창 -->  
							<div class="delivery-list display-none">
								<input type="hidden" name="address_no" value="0">
								<div class="delivery-list-box clearfix">
									<table class="table" style="border:none;">
										<tr class="table-title">
											<th width="15%">이름</th>
											<th width="25%">연락처</th>
											<th width="45%">주소</th>
											<th width="15%">선택</th>
										</tr>
										<c:forEach items="${addressList}" var="list">
											<tr class="table-contents">
												<th class="list-name">${list.name}</th>
												<th class="list-phone">${list.phone}</th>
												<th class="list-address">${list.address}</th>
												<th>
													<input type="hidden" value="${list.no}" class="address-no">
													<button type="button" class="address-select">선택</button>
												</th>
											</tr> 
										</c:forEach>
									</table>
									<button type="button" class="addressList-cancel" id="addressList-cancel">취소</button>
								</div>
							</div>
						</div>
						<div class="delivery-info">
							<div class="name-box clearfix">
								<h4 class="float-left">이름</h4>
								<input class="float-left" value="${user.name}" name="name">
							</div>
							<div class="phone-box clearfix">
								<h4 class="float-left">연락처</h4>
								<input class="float-left" value="${user.phone}" name="phone">							
							</div>
							<div class="address-box">
								<h3>주소</h3>
								<div class="zib-code clearfix display-none">
									<h5 class="float-left">우편번호</h5>
									<input class="float-left"> 
								</div>
								<div class="address">
									<h5>상세 주소</h5>
									<input  class="address-input" value="${user.address}" name="address">
								</div>
							</div>
							<div class="request-box">
								<h4>배송 시 요청 사항</h4>
								<select id="request-select">
									<option value="0">요청 사항 없음</option>
									<option value="1">배송 전, 연락 바랍니다</option>
									<option value="2">부재 시, 경비실에 맡겨 주세요</option>
									<option value="3">부재 시, 문 앞에 놔주세요</option>
									<option value="4">직접 입력</option>
								</select>							
							</div>
							<div class="message-box">
								<input name="request" value="요청 사항 없음">
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
								<c:forEach items="${optionList}" var="order">
									<div class="info-set">
										<input type="hidden" value="${order.item_no}" name="item_no">
										<input type="hidden" value="${order.no}" name="option_no">
										<div class="item-name clearfix">
											<input class="float-right" value="${order.select}" name="select">
											<h4 class="float-right">선택 상품</h4>
										</div>
										<div class="item-option clearfix">
											<input class="float-right" value="${order.detail}" name="detail">
											<h4 class="float-right">세부 옵션</h4>
										</div>
										<div class="item-count clearfix">
											<input class="float-right" value="${order.stock}" name="count">
											<h4 class="float-right">수량</h4>
										</div>
										<div class="item-price clearfix">
											<input class="float-right" value="${order.price}" name="price">
											<h4 class="float-right">가격</h4>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- 상품 정보 묶음 -->
							<div class="info-total">
								<div class="total-box clearfix">
									<div class="float-right">
										<h4>건</h4>
									</div>
									<div class="float-right">
										<h4>${orderCount}</h4>
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
									<input class="float-right" value="${total_price}" id="total_price" name="total_price">
									<h5 class="float-right">상품 가격</h5>
								</div>
								<div class="delivery-price clearfix">
									<input class="float-right" id="delivery_price" name="delivery_price">
									<h5 class="float-right">배송비</h5>
								</div>
								<div class="coupon-price clearfix">
									<input class="float-right" value="0" id="coupon_price" name="discount">
									<button type="button" class="float-right">쿠폰</button>
								</div> 
								<div class="total-price clearfix" style="margin-top: 50px;">
									<input class="float-right" id="last_price" name="last_price">
									<h5 class="float-right">결제 예정액</h5>
								</div>
							</div>
							<div class="button-box">
								<button type="button" id="order">
									<h1>주문하기</h1>
								</button>
							</div>
						</div>
					</div>
					<!-- 쿠폰 창 -->
					<div class="hidden-contents display-none">
						<input type="hidden" value="" name="coupon_no">
						<div class="hidden-box">
							<table class="table table-box">
								<tr class="table table-title">
									<th width="20%" class="order-date-border">쿠폰명</th>
									<th width="25%" class="item-info-border">할인 금액</th>
									<th width="30%" class="order-status-border">유효 기간</th>
									<th width="15%">쿠폰 선택</th>
								</tr>
								<c:forEach items="${cVo}" var="coupon">
									<tr class="table-contents">
										<th>${coupon.title}</th>
										<th>${coupon.discount}</th>
										<th>${coupon.period}</th>
										<th>
											<input type="hidden" value="${coupon.no}" class="coupon_no">
											<button type="button" class="coupon-use">사용</button>
											<input type="hidden" value="${coupon.discount}" id="coupon-discount">
										</th>
									</tr>
								</c:forEach>
							</table>
							<div class="coupon-cancel clearfix">
								<button type="button" class="float-right return">취소</button>
								<button type="button" class="float-right cancel">쿠폰 적용 취소</button>							
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</html>