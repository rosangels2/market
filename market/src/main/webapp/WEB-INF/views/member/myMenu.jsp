<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<style>
.*{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
.page-contents{
	
}
/* nav bar */
.nav-bar{
	position: fixed;
	float: left;
	border: 1px solid gray;
	width: 130px;
	height: 80vh;
}
.nav-box{
	height: calc( 100% / 9 );
	border-bottom: 1px solid gray;
	text-align: center;
	padding-top: 20px;
}
/* 주문 내역 보기 */
.list-contents{
	float: right;
	width: 950px;
	min-height: 660px;
}
.list-contents .list-text{
	margin: 10px;
}
.order-date-box div{
	margin-top: 15px;
	text-align: center;
}
.order-date-border{
	border-right: 1px solid gray;
}
.item-info-border{
	border-right: 1px solid gray;
}
.order-status-border{
	border-right: 1px solid gray;
}
.table-title{
	text-align: center;
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
}
.order-list-contents .table-contents{
	border-bottom: 1px solid gray;
}
.item-info-box{
	padding: 10px;
}
.item-info-left{
	width: 40%;
	height: 100px;
}
.item-info-left img{
	width: 189px;
	height: 100px;
}
.item-info-right{
	width: 60%;
	min-height: 100px;
}
.item-info-right div{
	height: 25px;
	padding: 0 10px 0 20px;
}
.item-count input{
	margin-left: 11px;
}
.item-price input{
	margin-left: 15px;
}
.order-num input{
	width: 250px;
}
.order-status-box{
	padding: 10px;
}
.order-status-box div{
	text-align: center;
	margin-top: 20px;
}
.order-check-box div{
	text-align: center;
	margin-top: 10px;
}
/* 내 정보 보기 */
.my-info{
	padding: 20px 0;
}
/* 내 정보 수정 */
.info-modify{
	padding: 20px 0;
}
/* 위시리스트 */
.wishlist-contents{
	float: right;
	width: 950px;
	min-height: 660px;
}
.wishlist-box{
	min-height: 150px;
	border: 1px solid gray;
}
.wishlist-box div{
	text-align: center;
}
.wishlist-box input{
	margin-top: 15px;
}
.item-img-box{
	width: 30%;
	height: 150px;
	float: left;
	padding: 10px;
}
.item-name-box{
	width: 30%;
	height: 150px;
	float: left;
	padding: 10px;
}
.item-price-box{
	width: 25%;
	height: 150px;
	float: left;
	padding: 10px;
}
.button-box{
	width: 15%;
	height: 150px;
	float: left;
	padding: 10px;
}
.item-img-box img{
	width: 264px;
	height: 130px;
}
.button-box button{
	margin-top: 40px;
	width: 100px;
}
/* 장바구니 클릭 시 */
.bag-contents{
	float: right;
	width: 950px;
	min-height: 591px;
	border: 1px solid gray;
}
.bag-img-box div{
	float: left;
	text-align: center;
}
.bag-img-box input{
	margin-top: 15px;
}
.bag-box{
 border-bottom: 1px solid gray;
}
.price-set{
	padding: 5px;
}
.price-set input{
	float: left;
	margin: 0 10px;
}
.order-box{
	padding: 15px 10px 20px 10px;
}
.order-box button{
	width: 150px;
	float: right;
} 
.order-price-box{
	height: 70px;
	float: left;
	padding: 10px;
}
.order-price-box input{
	float: left;
	margin: 0 10px;
}
/* 쿠폰함 클릭 시 */
.coupon-bag-contents{
	float: right;
	width: 950px;
	min-height: 600px;
}
.have-coupon-list{
	min-height: 300px;
	border: 1px solid gray;
	border-bottom: none;
}
.use-coupon-list{
	min-height: 300px;
	border: 1px solid gray;
	border-bottom: none;
}
.coupon-bag .table-title{
	border-bottom: 1px solid gray;
}
.coupon-list-text{
	text-align: center;
	border-bottom: 1px solid gray;
}
.table-title th{
	border-bottom: 1px solid gray;
}



/* 공통 */
.display-none{
	display: none;
}
</style>
<script>

</script>
</head>
<div style="min-height: 660px;">
	<div class="view-page">
		<div class="page-contents clearfix">
			<div class="nav-bar">
				<div class="nav-box order-list">
					<h6>주문 내역</h6>
				</div>
				<div class="nav-box my-info">
					<h6>내 정보</h6>
				</div>
				<div class="nav-box info-modify">
					<h6>내 정보 수정</h6>
				</div>
				<div class="nav-box wishlist">
					<h6>위시리스트</h6>
				</div>
				<div class="nav-box bag">
					<h6>장바구니</h6>
				</div>
				<div class="nav-box coupon-bag">
					<h6>쿠폰함</h6>
				</div>
				<div class="nav-box ask">
					<h6>문의 내역</h6>
				</div>
				<div class="nav-box seller-request">
					<h6>판매자 신청</h6>
				</div>
				<div class="nav-box withdrawal" style="border-bottom: none;">
					<h6>회원 탈퇴</h6>
				</div>
			</div>
			<div class="info-page">
				<div class="info-contents clearfix">
					<!-- 주문 내역 클릭 시 -->
					<div class="order-list display-none">
						<div class="list-contents">
							<div class="list-text">
								<h2>총 주문 내역</h2>
							</div>
							<div class="order-list-contents">
								<table class="table">
									<!-- 테이블 타이틀 -->
									<tr class="table-title">
										<th width="15%" class="order-date-border">주문 날짜</th>
										<th width="50%" class="item-info-border">상품 정보</th>
										<th width="15%" class="order-status-border">주문 상태</th>
										<th width="15%">확인/취소</th>
									</tr>
									<!-- 테이블 컨텐츠 -->
									<tr class="table-contents">
										<th class="order-date-box order-date-border">
											<div class="order-date">
												<h6>yyyy-mm-dd</h6>
											</div>
											<div class="detail-link">
												<h6>주문 상세 보기</h6>
											</div>
										</th>
										<th class="item-info-box item-info-border">
											<div class="item-info-contents clearfix">
												<div class="item-info-left float-left">
													<img alt="" src="<%=request.getContextPath()%>/resources/images/광선검.png">
												</div>
												<div class="item-info-right float-left">
													<div class="item-count">수량 <input></div>
													<div class="item-price">가격<input></div>
													<div class="order-num-text">주문번호</div>
													<div class="order-num">
														<input>
													</div>
												</div>
											</div>
										</th>
										<th class="order-status-box order-status-border">
											<div class="now-text">
												<h6>현재 상황</h6>
											</div>
											<div class="status-check">
												<h6>진행 상황 조회</h6>
											</div>
										</th>
										<th class="order-check-box">
											<div class="buy-agree">
												<h6>구매 확정</h6>
											</div>
											<div class="buy-cancel">
												<h6>구매 취소</h6>
											</div>
											<div class="buy-return">
												<h6>교환/반품</h6>
											</div>
										</th>
									</tr>
									<tr class="table-contents">
										<th class="order-date-box order-date-border">
											<div class="order-date">
												<h6>yyyy-mm-dd</h6>
											</div>
											<div class="detail-link">
												<h6>주문 상세 보기</h6>
											</div>
										</th>
										<th class="item-info-box item-info-border">
											<div class="item-info-contents clearfix">
												<div class="item-info-left float-left">
													<img alt="" src="<%=request.getContextPath()%>/resources/images/남자 면티.jpg">
												</div>
												<div class="item-info-right float-left">
													<div class="item-count">수량 <input></div>
													<div class="item-price">가격<input></div>
													<div class="order-num-text">주문번호</div>
													<div class="order-num">
														<input>
													</div>
												</div>
											</div>
										</th>
										<th class="order-status-box order-status-border">
											<div class="now-text">
												<h6>현재 상황</h6>
											</div>
											<div class="status-check">
												<h6>진행 상황 조회</h6>
											</div>
										</th>
										<th class="order-check-box">
											<div class="buy-agree">
												<h6>구매 확정</h6>
											</div>
											<div class="buy-cancel">
												<h6>구매 취소</h6>
											</div>
											<div class="buy-return">
												<h6>교환/반품</h6>
											</div>
										</th>
									</tr>
									<tr class="table-contents">
										<th class="order-date-box order-date-border">
											<div class="order-date">
												<h6>yyyy-mm-dd</h6>
											</div>
											<div class="detail-link">
												<h6>주문 상세 보기</h6>
											</div>
										</th>
										<th class="item-info-box item-info-border">
											<div class="item-info-contents clearfix">
												<div class="item-info-left float-left">
													<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
												</div>
												<div class="item-info-right float-left">
													<div class="item-count">수량 <input></div>
													<div class="item-price">가격<input></div>
													<div class="order-num-text">주문번호</div>
													<div class="order-num">
														<input>
													</div>
												</div>
											</div>
										</th>
										<th class="order-status-box order-status-border">
											<div class="now-text">
												<h6>현재 상황</h6>
											</div>
											<div class="status-check">
												<h6>진행 상황 조회</h6>
											</div>
										</th>
										<th class="order-check-box">
											<div class="buy-agree">
												<h6>구매 확정</h6>
											</div>
											<div class="buy-cancel">
												<h6>구매 취소</h6>
											</div>
											<div class="buy-return">
												<h6>교환/반품</h6>
											</div>
										</th>
									</tr>
								</table>
							</div>
							<div class="bottom-contents"></div>
						</div>
					</div>
					<!-- 내 정보 클릭 시 -->
					<div class="my-info display-none">
						<div class="container offset-3 col-6 signup-box">
							<div class="offset-4"> <h1>내 정보</h1></div>
							<div class="form-group">
							<label for="usr">ID</label><br>
								<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" placeholder="ID" name="id">
								<label id="id-error" class="offset-4 col-7" for="id"></label>
							</div>
							<div class="form-group">
								<label for="email">email</label>
								<input type="text" class="form-control" id="email" placeholder="email" name="email">
							</div>
							<div class="form-group">
								<label for="name">name</label>
								<input type="text" class="form-control col-6" id="name" placeholder="name" name="name">
							</div>
							<div class="form-group">
								<label for="phone">phone</label>
								<input type="text" class="form-control" id="phone" placeholder="phone" name="phone">
							</div>
							<div class="form-group">
								<label for="address">address</label>
								<input type="text" class="form-control" id="address" placeholder="address" name="address">
							</div>
							<div class="form-group">
								<label for="point">point</label>
								<input type="text" class="form-control" id="point" placeholder="point" name="pont">
							</div>
							<div class="form-group">
								<label for="bank">bank</label>
								<input type="text" class="form-control" id="bank" placeholder="bank" name="bank">
							</div>
							<div class="form-group">
								<label for="account">account</label>
								<input type="text" class="form-control" id="account" placeholder="account" name="account">
							</div>
							<div class="form-group">
								<label for="grade">grade</label>
								<input type="text" class="form-control" id="grade" placeholder="grade" name="grade">
							</div>
						</div>					
					</div>
					<!-- 내 정보 수정 클릭 시 -->
					<div class="info-modify display-none">
						<div class="container offset-3 col-6 signup-box">
							<div class="offset-4"> <h1>내 정보 수정</h1></div>
							<div class="form-group">
							<label for="usr">ID</label><br>
								<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" placeholder="ID" name="id" readonly>
								<label id="id-error" class="offset-4 col-7" for="id"></label>
							</div>
							<div class="form-group">
								<label for="opw">password</label>
								<input type="password" class="form-control col-7" id="opw" placeholder="old password" name="opw">
							</div>							
							<div class="form-group">
								<label for="pw">password</label>
								<input type="password" class="form-control col-7" id="pw" placeholder="new password" name="pw">
							</div>
							<div class="form-group">
								<label for="pw1">password confirm</label>
								<input type="password" class="form-control col-7" id="pw1" placeholder="new password confirm" name="pw1">
							</div>							
							<div class="form-group">
								<label for="email">email</label>
								<input type="text" class="form-control" id="email" placeholder="email" name="email">
							</div>
							<div class="form-group">
								<label for="name">name</label>
								<input type="text" class="form-control col-6" id="name" placeholder="name" name="name">
							</div>
							<div class="form-group">
								<label for="phone">phone</label>
								<input type="text" class="form-control" id="phone" placeholder="phone" name="phone">
							</div>
							<div class="form-group">
								<label for="address">address</label>
								<input type="text" class="form-control" id="address" placeholder="address" name="address">
							</div>
							<div class="form-group">
								<label for="bank">bank</label>
								<input type="text" class="form-control" id="bank" placeholder="bank" name="bank">
							</div>
							<div class="form-group">
								<label for="account">account</label>
								<input type="text" class="form-control" id="account" placeholder="account" name="account">
							</div>
							<button type="button" class="btn btn-dark float-right" id="cancel" name="cancel">취소</button>
							<button type="button" class="btn btn-dark float-right" style="margin-right: 15px; margin-bottom: 20px;" id="ok" name="ok">입력완료</button>							
						</div>
					</div>
					<!-- 위시리스트 클릭 시 -->
					<div class="wishlist display-none">
						<div class="wishlist-contents">
							<div class="wishlist-box clearfix">
								<div class="item-img-box">
									<img alt="" src="<%=request.getContextPath()%>/resources/images/목걸이.jpg">
								</div>
								<div class="item-name-box">
									<h3>상품명</h3>
									<input>
								</div>
								<div class="item-price-box">
									<h3>가격</h3>
									<input>
								</div>
								<div class="button-box">
									<button><h3>삭제</h3></button>
								</div>
							</div>
							<div class="wishlist-box clearfix">
								<div class="item-img-box">
									<img alt="" src="<%=request.getContextPath()%>/resources/images/광선검.png">
								</div>
								<div class="item-name-box">
									<h3>상품명</h3>
									<input>
								</div>
								<div class="item-price-box">
									<h3>가격</h3>
									<input>
								</div>
								<div class="button-box">
									<button><h3>삭제</h3></button>
								</div>
							</div>
							<div class="wishlist-box clearfix">
								<div class="item-img-box">
									<img alt="" src="<%=request.getContextPath()%>/resources/images/호랑이 잠옷.jpg">
								</div>
								<div class="item-name-box">
									<h3>상품명</h3>
									<input>
								</div>
								<div class="item-price-box">
									<h3>가격</h3>
									<input>
								</div>
								<div class="button-box">
									<button><h3>삭제</h3></button>
								</div>
							</div>
						</div>
					</div>
					<!-- 장바구니 클릭 시 -->
					<div class="bag display-none">
						<div class="bag-contents">
							<div class="bag-box">
								<div class="bag-img-box clearfix">
									<div class="item-img-box">
										<img alt="" src="<%=request.getContextPath()%>/resources/images/목걸이.jpg">
									</div>
									<div class="item-name-box">
										<h3>상품명</h3>
										<input>
									</div>
									<div class="item-price-box">
										<h3>가격</h3>
										<input>
									</div>
									<div class="button-box">
										<button><h3>삭제</h3></button>
									</div>
								</div>
								<div class="bag-price-box">
									<div class="price-set clearfix">
										<h4 class="float-left" style="margin: 0 10px;">상품 가격</h4><input><h4 class="float-left">배송비</h4><input><h4 class="float-left" style="margin: 0 10px;">=</h4><input>
									</div>
								</div>
							</div>
							<div class="bag-box">
								<div class="bag-img-box clearfix">
									<div class="item-img-box">
										<img alt="" src="<%=request.getContextPath()%>/resources/images/남자 면티.jpg">
									</div>
									<div class="item-name-box">
										<h3>상품명</h3>
										<input>
									</div>
									<div class="item-price-box">
										<h3>가격</h3>
										<input>
									</div>
									<div class="button-box">
										<button><h3>삭제</h3></button>
									</div>
								</div>
								<div class="bag-price-box">
									<div class="price-set clearfix">
										<h4 class="float-left" style="margin: 0 10px;">상품 가격</h4><input><h4 class="float-left">배송비</h4><input><h4 class="float-left" style="margin: 0 10px;">=</h4><input>
									</div>
								</div>
							</div>
							<div class="bag-box">
								<div class="bag-img-box clearfix">
									<div class="item-img-box">
										<img alt="" src="<%=request.getContextPath()%>/resources/images/큐티 권총.jpg">
									</div>
									<div class="item-name-box">
										<h3>상품명</h3>
										<input>
									</div>
									<div class="item-price-box">
										<h3>가격</h3>
										<input>
									</div>
									<div class="button-box">
										<button><h3>삭제</h3></button>
									</div>
								</div>
								<div class="bag-price-box">
									<div class="price-set clearfix">
										<h4 class="float-left" style="margin: 0 10px;">상품 가격</h4><input><h4 class="float-left">배송비</h4><input><h4 class="float-left" style="margin: 0 10px;">=</h4><input>
									</div>
								</div>
							</div>
							<div class="bag-box">
								<div class="bag-img-box clearfix">
									<div class="item-img-box">
										<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
									</div>
									<div class="item-name-box">
										<h3>상품명</h3>
										<input>
									</div>
									<div class="item-price-box">
										<h3>가격</h3>
										<input>
									</div>
									<div class="button-box">
										<button><h3>삭제</h3></button>
									</div>
								</div>
								<div class="bag-price-box">
									<div class="price-set clearfix">
										<h4 class="float-left" style="margin: 0 10px;">상품 가격</h4><input><h4 class="float-left">배송비</h4><input><h4 class="float-left" style="margin: 0 10px;">=</h4><input>
									</div>
								</div>
							</div>
							<!-- 장바구니 주문 창 -->
							<div class="order-box clearfix">
								<div class="order-price-box clearfix">
									<h5 class="float-left" style="margin: 0 10px;">상품 가격 합계</h5><input><h5 class="float-left">배송비 합계</h5><input><h5 class="float-left" style="margin: 0 10px;">=</h5><input>
								</div>
								<button style="margin: 10px 44px 0 0;"><h3>주문하기</h3></button>
							</div>
						</div>
					</div>
					<!-- 쿠폰함 클릭 시 -->
					<div class="coupon-bag display-none">
						<div class="coupon-bag-contents">
							<div class="have-text">
								<h2>보유 쿠폰</h2>
							</div>
							<div class="have-coupon-list">
								<table class="table">
									<!-- 테이블 타이틀 -->
									<tr class="table-title">
										<th width="20%" class="order-date-border">쿠폰명</th>
										<th width="25%" class="item-info-border">할인 금액</th>
										<th width="30%" class="order-status-border">유효 기간</th>
										<th width="15%">상태</th>
									</tr>
									<!-- 테이블 컨텐츠 -->
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용 가능</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용 가능</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용 가능</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용 가능</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용 가능</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용 가능</h6>
										</th>
									</tr>
								</table>
							</div>
							<div class="use-text">
								<h2>만료된 쿠폰</h2>
							</div>
							<div class="use-coupon-list">
								<table class="table">
									<!-- 테이블 타이틀 -->
									<tr class="table-title">
										<th width="20%" class="order-date-border">쿠폰명</th>
										<th width="25%" class="item-info-border">할인 금액</th>
										<th width="30%" class="order-status-border">유효 기간</th>
										<th width="15%">상태</th>
									</tr>
									<!-- 테이블 컨텐츠 -->
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>기간 만료</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>기간 만료</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>사용</h6>
										</th>
									</tr>
									<tr class="coupon-list-text">
										<th>
											<h6>놓칠 수 없는 기회</h6>
										</th>
										<th>
											<h6>5000원</h6>
										</th>
										<th>
											<h6>yyyy-mm-dd ~ yyyy-mm-dd</h6>
										</th>
										<th>
											<h6>기간 만료</h6>
										</th>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- 문의/답변 클릭 시 -->
					<div class="ask">
						<div class="ask-contents">
							<div>
								
							</div>
						</div>
					</div>
					<!-- 판매자 신청 클릭 시 -->
					<div class="seller-request display-none"></div>
					<!-- 회원 탈퇴 클릭 시 -->
					<div class="withdrawal display-none"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</html>