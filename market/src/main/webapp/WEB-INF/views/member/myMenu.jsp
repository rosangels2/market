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
	min-height: 1000px;
}
.list-contents .list-text{
	margin: 10px;
}
.order-date-box div{
	margin-top: 15px;
	text-align: center;
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
.item-info-right input{
	border: none;
}
.item-count input{
	margin-left: 10px;
}
.item-price input{
	margin-left: 15px;
}
.order-detail input{
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
.my-info-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
/* 내 정보 수정 */
.info-modify-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
/* 위시리스트 */
.wishlist-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
.wishlist-box{
	min-height: 150px;
	border: 1px solid gray;
	border-top: none;
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
	min-height: 1000px;
}
.bag-img-box div{
	float: left;
	text-align: center;
}
.bag-img-box input{
	margin-top: 15px;
}
.bag-box{
 border: 1px solid gray;
 border-top: none;
}
.bag-box input{
	border: none;
	text-align: center; 
}
.bag-info-box input{
	width: 300px; 
}
.bag-price-box{
	padding-right: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
} 
.bag-price-box input{
	width: 200px;
}
.price-set{
	padding: 5px;
}
.price-set input{
	float: left;
	margin: 0 10px;
}
.order-box{
	padding: 15px 10px 20px 300px;
	margin-top: 20px;
}
.order-box button{
	width: 150px;
	float: right;
} 
.order-price-box{
	height: 70px;
	float: left;
	padding: 20px 10px;
}
.order-price-box input{
	float: left;
	margin: 0 10px;
}
/* 쿠폰함 클릭 시 */
.coupon-bag-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
.give-text{
	margin-top: 30px;
}
.give-coupon-list{
	min-height: 200px;
	margin-bottom: 50px;
}
.use-coupon-list{
	min-height: 300px;
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
/* 문의 답변 클릭 시 */
.ask-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
.ask-board .table-contents{
	text-align: center;
}
/* 판매자 신청 클릭 시 */
.seller-request-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
/* 회원 탈퇴 클릭 시 */
.withdrawal-contents{
	float: right;
	width: 950px;
	min-height: 1000px;
}
.bottom-contents{
	min-height: 100px;
}


/* 공통 */
.display-none{
	display: none;
}
.background-gray{
	background-color: gray;
}
</style>
<script type="text/javascript">

var isChecked = -1;

$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "가입 양식에 맞게 입력해 주세요."
);

$(document).ready(function(){
	
	//메뉴 바
	$('.nav-bar .order-list').click(function(){
		$('.nav-bar .order-list').siblings().removeClass('background-gray');
		$('.nav-bar .order-list').addClass('background-gray');
		$('.info-contents .order-list').siblings().addClass('display-none');
		$('.info-contents .order-list').removeClass('display-none');
	});
	$('.nav-bar .my-info').click(function(){
		$('.nav-bar .my-info').siblings().removeClass('background-gray');
		$('.nav-bar .my-info').addClass('background-gray');
		$('.info-contents .my-info').siblings().addClass('display-none');
		$('.info-contents .my-info').removeClass('display-none');
	});
	$('.nav-bar .info-modify').click(function(){
		$('.nav-bar .info-modify').siblings().removeClass('background-gray');
		$('.nav-bar .info-modify').addClass('background-gray');
		$('.info-contents .info-modify').siblings().addClass('display-none');
		$('.info-contents .info-modify').removeClass('display-none');
	});
	$('.nav-bar .wishlist').click(function(){
		$('.nav-bar .wishlist').siblings().removeClass('background-gray');
		$('.nav-bar .wishlist').addClass('background-gray');
		$('.info-contents .wishlist').siblings().addClass('display-none');
		$('.info-contents .wishlist').removeClass('display-none');
	});
	$('.nav-bar .bag').click(function(){
		$('.nav-bar .bag').siblings().removeClass('background-gray');
		$('.nav-bar .bag').addClass('background-gray');
		$('.info-contents .bag').siblings().addClass('display-none');
		$('.info-contents .bag').removeClass('display-none');
	});
	$('.nav-bar .coupon-bag').click(function(){
		$('.nav-bar .coupon-bag').siblings().removeClass('background-gray');
		$('.nav-bar .coupon-bag').addClass('background-gray');
		$('.info-contents .coupon-bag').siblings().addClass('display-none');
		$('.info-contents .coupon-bag').removeClass('display-none');
	});
	$('.nav-bar .ask').click(function(){
		$('.nav-bar .ask').siblings().removeClass('background-gray');
		$('.nav-bar .ask').addClass('background-gray');
		$('.info-contents .ask').siblings().addClass('display-none');
		$('.info-contents .ask').removeClass('display-none');
	});
	$('.nav-bar .seller-request').click(function(){
		$('.nav-bar .seller-request').siblings().removeClass('background-gray');
		$('.nav-bar .seller-request').addClass('background-gray');
		$('.info-contents .seller-request').siblings().addClass('display-none');
		$('.info-contents .seller-request').removeClass('display-none');
	});
	$('.nav-bar .withdrawal').click(function(){
		$('.nav-bar .withdrawal').siblings().removeClass('background-gray');
		$('.nav-bar .withdrawal').addClass('background-gray');
		$('.info-contents .withdrawal').siblings().addClass('display-none');
		$('.info-contents .withdrawal').removeClass('display-none');
	});
	
	// /^\w*(\d[A-z]|[A-z]\d)\w*$/ 영어숫자 포함
	$("#modify").validate({
        rules: {
        	oldPassword: {
        		required : true,
                minlength : 8,
                maxlength : 12,
                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/	//영문 또는 숫자만 사용 가능하며 각각 1개 이상 사용
                //	   /^(?=.*[a-zA-Z])(?=.*[!@#$%^*-])(?=.*[0-9]).{8,12}$/		특수문자, 영문, 숫자를 1개씩 포함
        	},
            password: {
                required : true,
                minlength : 8,
                maxlength : 12,
                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/	//영문 또는 숫자만 사용 가능하며 각각 1개 이상 사용
                //	   /^(?=.*[a-zA-Z])(?=.*[!@#$%^*-])(?=.*[0-9]).{8,12}$/		특수문자, 영문, 숫자를 1개씩 포함
            },
            password1: {
                required : true,
                equalTo : password
            },
            email: {
                required : true,
                email : true	//email 형식에 맞는지 여부
            }
        },
        messages : {	//규칙체크 실패시 출력될 메시지
        	oldPassword: {
                required : "필수로 입력하세요",
                minlength : "최소 8글자 이상이어야 합니다",
                maxlength : "최대 12글자 이하여야 합니다",
                regex : "영문과 숫자를 1개씩 포함해야 합니다."
            },
            password: {
                required : "필수로 입력하세요",
                minlength : "최소 8글자 이상이어야 합니다",
                maxlength : "최대 12글자 이하여야 합니다",
                regex : "영문과 숫자를 1개씩 포함해야 합니다."
            },
            password1: {
                required : "필수로 입력하세요",
                equalTo : "비밀번호와 비밀번호 확인이 일치하지 않습니다."
            },
            email: {
                required : "필수로 입력하세요",
                email : "메일 규칙에 어긋납니다"
            }
        }
	});
	
	//내 정보 수정 비밀번호 검사
	$('#oldPassword').focus(function(){
		$('#oPwCheck').text("");
	});
	$('#oldPassword').change(function(){
		var test = $('#oldPassword').valid();
		if(!test){
			return;
		}
		var id = '${user.id}';
		var password = $('#oldPassword').val();
		$.ajax({
	        async:false,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"id": id, "password": password},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/oldPasswordCheck",
	        dataType:"json",
	        //contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
				if(!data){
					$('#oPwCheck').text("비밀번호가 일치하지 않습니다.");
					isChecked = -1;
				}else{
					$('#oPwCheck').text("");
					isChecked = 0;
				}
	        }
	    });
	});
	
	//내 정보 수정
	$('#modify-ok').click(function(){
		var test = $('#modify').valid();
		if(!test){
			alert("가입 양식에 맞지 않습니다.");
			return false;
		}
		if(isChecked == -1){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}
		$('#modify').submit();
		isChecked = -1;
	});
	
	//위시리스트 삭제
	$('.wishlist-delete').click(function(){
		var box = $(this).parents('.wishlist-box');
		var id = "${user.id}";
		var no = $(this).siblings('input[name=wishlist_no]').val();
		 $.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"id": id, "no": no},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/items/deleteWishlist",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						box.remove();
					}else{
						alert("삭제 실패하였습니다.");
					}
		        }
		 });
	});
	
	//장바구니 주문
	$('#bag-form').submit(function(){
		if($('input[name=total_price]').val() == 0){
			return false;
		}
		return true;
	});
	
	//쿠폰 받기
	$('.get-coupon').click(function(){
		var box = $(this).parents('.coupon-list-text')
		var coupon_no = $(this).siblings('.coupon_no').val();
		var id = '${user.id}';
		$.ajax({
	        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"id": id, "coupon_no": coupon_no},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/items/couponGet",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	alert(data.cVo);
				if(data.cVo != null){
					box.remove();
					var str = '<tr class="coupon-list-text"><th>'+data.cVo.title+'<input type="hidden" value="'+data.cVo.no+'"></th><th>'+data.cVo.discount+'원</th><th>'+data.cVo.period+'</th><th>'+data.cVo.state+'</th></tr>';
					$('#coupon-table').append(str);
				}else{
					alert("쿠폰 받기에 실패하였습니다.");
				}
	        }
	 	});
	});
	
	
	$("#seller-form").validate({	
        rules: {
        	license: {
        		required : true
        	},
        	password: {
        		required : true,
        		minlength : 8,
                maxlength : 12,
                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/	//영문 또는 숫자만 사용 가능하며 각각 1개 이상 사용
                //	   /^(?=.*[a-zA-Z])(?=.*[!@#$%^*-])(?=.*[0-9]).{8,12}$/		특수문자, 영문, 숫자를 1개씩 포함
        	},
        	name: {
        		required : true
        	},
        	phone: {
        		required : true
        	},
        	bank: {
        		required : true
        	},
        	account: {
        		required : true
        	},
        	place: {
        		required : true
        	}
        },
        messages : {	//규칙체크 실패시 출력될 메시지
        	license: {
                required : "필수로 입력하세요"
            },
            password: {
                required : "필수로 입력하세요",
                minlength : "최소 8글자 이상이어야 합니다",
                maxlength : "최대 12글자 이하여야 합니다",
                regex : "영문과 숫자를 1개씩 포함해야 합니다."
            },
            name: {
                required : "필수로 입력하세요"
            },
            phone: {
                required : "필수로 입력하세요"
            },
            bank: {
                required : "필수로 입력하세요"
            },
            account: {
                required : "필수로 입력하세요"
            },
            place: {
                required : "필수로 입력하세요"
            }
        }
	});
	
	//판매자 신청 비밀번호 변경 시
	$('#sPassword').focus(function(){
		$('#sPwCheck').text("");
	});
	$('#sPassword').change(function(){
		var test = $('#sPassword').valid();
		if(!test){
			return;
		}
		var id = '${user.id}';
		var password = $('#sPassword').val();
		$.ajax({
	        async:false,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"id": id, "password": password},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/oldPasswordCheck",
	        dataType:"json",
	        //contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
				if(!data){
					$('#sPwCheck').text("비밀번호가 일치하지 않습니다.");
					isChecked = -1;
				}else{
					$('#sPwCheck').text("");
					isChecked = 0;
				}
	        }
	    });
	});
	
	
	//판매자 신청 클릭 시
	$('#request-seller').click(function(){
		if(!$('#seller-form').valid()){
			return false;
		}
		if(isChecked == -1){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}
		$('#seller-form').submit();
		alert("판매자 신청에 성공하였습니다.");
		isChecked = -1;
	});
	
	
	//회원 탈퇴
	$('#withdrawal-ok').click(function(){
		var result = confirm("정말로 탈퇴하시겠습니까?"); 
		if(result){	//yes  
			$('#withdrawal-form').submit();
		}else{		//no
			return false; 
		}
	});
});		//레디

function menuClick(selecter){
	$('.nav-bar .'+selecter).click(function(){
		$('.nav-bar .'+selecter).siblings().removeClass('background-gray');
		$('.nav-bar .'+selecter).addClass('background-gray');
		$('.info-contents .'+selecter).siblings().addClass('display-none');
		$('.info-contents .'+selecter).removeClass('display-none');
	});
};

</script>
</head>
<div style="min-height: 660px;">
	<div class="view-page">
		<div class="page-contents clearfix">
			<div class="nav-bar">
				<div class="nav-box order-list background-gray" value="order-list">
					<h6>주문 내역</h6>
				</div>
				<div class="nav-box my-info" value="my-info">
					<h6>내 정보</h6>
				</div>
				<div class="nav-box info-modify" value="info-modify">
					<h6>내 정보 수정</h6>
				</div>
				<div class="nav-box wishlist" value="wishlist">
					<h6>위시리스트</h6>
				</div>
				<div class="nav-box bag" value="bag">
					<h6>장바구니</h6>
				</div>
				<div class="nav-box coupon-bag" value="coupon-bag">
					<h6>쿠폰함</h6>
				</div>
				<div class="nav-box ask" value="ask">
					<h6>문의 내역</h6>
				</div>
				<div class="nav-box seller-request" value="seller-request">
					<h6>판매자 신청</h6>
				</div>
				<div class="nav-box withdrawal" style="border-bottom: none;" value="withdrawal">
					<h6>회원 탈퇴</h6>
				</div>
			</div>
			<div class="info-page">
				<div class="info-contents clearfix">
					<!-- 주문 내역 클릭 시 -->
					<div class="order-list">
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
									<c:forEach items="${buyList}" var="buy">
										<tr class="table-contents">
											<th class="order-date-box order-date-border">
												<div class="order-date">
													<h6>${buy.time}</h6>
												</div>
												<div class="detail-link">
													<h6>주문 번호</h6><a href="<%=request.getContextPath()%>/items/myBuy?no=${buy.no}">${buy.no}</a>
												</div>
											</th>
											<th class="item-info-box item-info-border">
												<div class="item-info-contents clearfix">
													<div class="item-info-left float-left">
														<a href="<%=request.getContextPath()%>/items/detail?item_no=${buy.item_no}">
															<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${buy.image}">
														</a>
													</div>
													<div class="item-info-right float-left">
														<div class="item-count">수량 <input value="${buy.count}" readonly></div>
														<div class="item-price">가격<input value="${buy.price}" readonly></div>
														<div class="order-detail-text">주문 상세</div>
														<div class="order-detail">
															<a href="<%=request.getContextPath()%>/items/detail?item_no=${buy.item_no}">
																<input value="${buy.select} / ${buy.detail}" readonly>
															</a>
														</div>
													</div>
												</div>
											</th>
											<th class="order-status-box order-status-border">
												<div class="now-text">
													<h6>현재 상황</h6>
												</div>
												<div class="status-check">
													<h5>${buy.state}</h5>
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
									</c:forEach>
								</table>
							</div>
							<div class="bottom-contents"></div>
						</div>
					</div>
					<!-- 내 정보 클릭 시 -->
					<div class="my-info display-none">
						<div class="my-info-contents"> 
							<div class="container offset-3 col-6 signup-box">
								<div class="offset-4"> <h1>내 정보</h1></div>
								<div class="form-group">
								<label for="usr">ID</label><br>
									<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" value="${user.id}" name="id" readonly>
									<label id="id-error" class="offset-4 col-7" for="id"></label>
								</div>
								<div class="form-group">
									<label for="email">email</label>
									<input type="text" class="form-control" id="email" name="email" value="${user.email}" readonly>
								</div>
								<div class="form-group">
									<label for="name">name</label>
									<input type="text" class="form-control col-6" id="name" name="name" value="${user.name}" readonly>
								</div>
								<div class="form-group">
									<label for="phone">phone</label>
									<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" readonly>
								</div>
								<div class="form-group">
									<label for="address">address</label>
									<input type="text" class="form-control" id="address" name="address" value="${user.address}" readonly>
								</div>
								<div class="form-group">
									<label for="point">point</label>
									<input type="text" class="form-control" id="point" name="pont" value="${user.point}" readonly>
								</div>
								<div class="form-group">
									<label for="bank">bank</label>
									<input type="text" class="form-control" id="bank" name="bank" value="${user.bank}" readonly>
								</div>
								<div class="form-group">
									<label for="account">account</label>
									<input type="text" class="form-control" id="account" name="account" value="${user.account}" readonly>
								</div>
								<div class="form-group">
									<label for="grade">grade</label>
									<input type="text" class="form-control" id="grade" name="grade" value="${user.grade}" readonly>
								</div>
							</div>		
						</div>			
					</div>
					<!-- 내 정보 수정 클릭 시 -->
					<div class="info-modify display-none">
						<div class="info-modify-contents">
							<div class="container offset-3 col-6 signup-box">
								<form method="post" action="<%=request.getContextPath()%>/modify" id="modify">
									<div class="offset-4"> <h1>내 정보 수정</h1></div>
									<div class="form-group">
									<label for="usr">ID</label><br>
										<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" value="${user.id}" name="id" readonly>
										<label id="id-error" class="offset-4 col-7" for="id"></label>
									</div>
									<div class="form-group">
										<label for="oldPassword">old password</label>
										<input type="password" class="form-control col-7" id="oldPassword" placeholder="old password" name="oldPassword">
										<div id="oPwCheck"></div>
									</div>
									<div class="form-group">
										<label for="password">new password</label>
										<input type="password" class="form-control col-7" id="password" placeholder="new password" name="password">
									</div>
									<div class="form-group">
										<label for="password1">new password confirm</label>
										<input type="password" class="form-control col-7" id="password1" placeholder="new password confirm" name="password1">
									</div>							
									<div class="form-group">
										<label for="email">email</label>
										<input type="text" class="form-control" id="email" name="email" value="${user.email}">
									</div>
									<div class="form-group">
										<label for="name">name</label>
										<input type="text" class="form-control col-6" id="name" name="name" value="${user.name}">
									</div>
									<div class="form-group">
										<label for="phone">phone</label>
										<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
									</div>
									<div class="form-group">
										<label for="address">address</label>
										<input type="text" class="form-control" id="address" name="address" value="${user.address}">
									</div>
									<div class="form-group">
										<label for="bank">bank</label>
										<input type="text" class="form-control" id="bank" name="bank" value="${user.bank}">
									</div>
									<div class="form-group">
										<label for="account">account</label>
										<input type="text" class="form-control" id="account" name="account" value="${user.account}">
									</div>
									<button class="btn btn-dark float-right" style="margin-right: 15px; margin-bottom: 20px;" id="modify-ok">입력완료</button>
								</form>							
							</div>
						</div>
					</div>
					<!-- 위시리스트 클릭 시 -->
					<div class="wishlist display-none">
						<div class="wishlist-contents">
							<c:forEach items="${wishlistList}" var="wish">
								<div class="wishlist-box clearfix">
									<div class="item-img-box">
										<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${wish.image}">
									</div>
									<div class="item-name-box">
										<h3>상품명</h3>
			 							<input name="item_name" value="${wish.item_name}">
									</div>
									<div class="item-price-box">
										<h3>가격</h3>
										<input name="item_price" value="${wish.item_price}">
									</div>
									<div class="button-box">
										<button class="wishlist-delete"><h3>삭제</h3></button>
										<input type="hidden" value="${wish.no}" name="wishlist_no">
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 장바구니 클릭 시 -->
					<div class="bag display-none">
						<div class="bag-contents">
							<form method="post" action="<%=request.getContextPath()%>/items/order" id="bag-form">
								<input type="hidden" value="${user.id}" name="id">
								<c:forEach items="${bagList}" var="bag">
									<div class="bag-box">
										<input type="hidden" name="bag_no" value="${bag.no}">
										<input type="hidden" name="item_no" value="${bag.item_no}">
										<input type="hidden" name="option_no" value="${bag.option_no}">
										<div class="bag-img-box clearfix">
											<div class="item-img-box">
												<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${bag.image}">
											</div>
										</div>
										<div class="bag-info-box">
											<div class="price-set clearfix">
												<h4 class="float-left" style="margin: 0 10px;">선택 상품</h4><input readonly name="select" value="${bag.select}">
												<h4 class="float-left">세부 옵션</h4><input readonly name="detail" value="${bag.detail}">
											</div>
										</div>
										<div class="bag-price-box">
											<div class="price-set clearfix">
												<h4 class="float-left" style="margin: 0 10px;">선택 수량</h4><input style="border:1px solid gray;" name="count" value="${bag.count}">
												<h4 class="float-left">총 가격</h4><input readonly name="price" value="${bag.price}">
												<button type="button" class="float-right" id="bag-delete">
													<h5>삭제하기</h5>
												</button>
												<button type="button" class="float-right" style="margin-right: 30px;" id="bag-modify">
													<h5>수정하기</h5>
												</button>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 장바구니 주문 창 -->
								<div class="order-box clearfix">
									<div class="order-price-box clearfix">
										<h4 class="float-left" style="margin: 0 10px;">상품 가격 합계</h4>
										<input name="total_price" value="${total_price}" readonly style="text-align: center;">
									</div>
									<button style="margin: 10px 44px 0 0;"><h3>주문하기</h3></button>
								</div>
							</form>
						</div>
					</div>
					<!-- 쿠폰함 클릭 시 -->
					<div class="coupon-bag display-none">
						<div class="coupon-bag-contents">
							<div class="give-text">
								<h2>받을 수 있는 쿠폰</h2>
							</div>
							<div class="give-coupon-list">
								<table class="table">
									<!-- 테이블 타이틀 -->
									<tr class="table-title">
										<th width="20%" class="order-date-border">쿠폰명</th>
										<th width="25%" class="item-info-border">할인 금액</th>
										<th width="30%" class="order-status-border">유효 기간</th>
										<th width="15%">쿠폰 받기</th>
									</tr>
									<!-- 테이블 컨텐츠 -->
									<c:forEach items="${cList}" var="coupon1">
										<tr class="coupon-list-text">
											<th>${coupon1.title}</th>
											<th>${coupon1.discount}원</th>
											<th>${coupon1.period}</th>
											<th>
												<input type="hidden" value="${coupon1.no}" class="coupon_no">
												<a class="get-coupon">받기</a>
											</th>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="use-text">
								<h2>사용 가능한 쿠폰</h2>
							</div>
							<div class="use-coupon-list">
								<table class="table" id="coupon-table">
									<!-- 테이블 타이틀 -->
									<tr class="table-title">
										<th width="20%" class="">쿠폰명</th>
										<th width="25%" class="">할인 금액</th>
										<th width="30%" class="">유효 기간</th>
										<th width="15%">상태</th>
									</tr>
									<!-- 테이블 컨텐츠 -->
									<c:forEach items="${couponList}" var="coupon">
										<tr class="coupon-list-text">
											<th>${coupon.title}<input type="hidden" value="${coupon.no}"></th>
											<th>${coupon.discount}원</th>
											<th>${coupon.period}</th>
											<th>${coupon.state}</th>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<!-- 문의/답변 클릭 시 -->
					<div class="ask display-none">
						<div class="ask-contents">
							<div class="ask-board">
								<h2>문의/답변</h2>
								<table class="table">
									<!-- 테이블 타이틀 -->
									<tr class="table-title">
										<th width="20%" class="">문의 번호</th>
										<th width="25%" class="">제목</th>
										<th width="30%" class="">문의 날짜</th>
										<th width="15%">상태</th>
									</tr>
									<!-- 테이블 컨텐츠 -->
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
									<tr class="table-contents">
										<th>175</th>
										<th>배송 언제 되나요</th>
										<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
										<th>답변 대기</th>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- 판매자 신청 클릭 시 -->
					<div class="seller-request display-none">
						<div class="seller-request-contents">
							<form method="post" action="<%=request.getContextPath()%>/requestSeller" id="seller-form">
								<div class="container offset-3 col-6 signup-box">
									<div class="offset-4"> <h1>판매자 신청</h1></div>
									<div class="form-group">
									<label for="id">ID</label><br>
										<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" value="${user.id}" name="id" readonly>
										<label id="id-error" class="offset-4 col-7" for="id"></label>
									</div>
									<div class="form-group">
										<label for="pw">password</label>
										<input type="password" class="form-control col-7" id="sPassword" placeholder="password" name="password">
										<div id="sPwCheck"></div>
									</div>
									<c:if test="${seller ne null}">
										<div class="form-group">
										<label for="licensee">license</label><br>
											<input type="text" class="form-control col-6 float-left" id="license" style="display: inline-block;" value="${seller.license}" name="license">
											<label id="id-error" class="offset-4 col-7" for="license"></label>
										</div>		
										<div class="form-group">
											<label for="name">seller name</label>
											<input type="text" class="form-control col-6" id="name" value="${seller.name}" name="name">
										</div>
										<div class="form-group">
											<label for="phone">phone</label>
											<input type="text" class="form-control" id="phone" value="${seller.phone}" name="phone">
										</div>
										<div class="form-group">
											<label for="bank">bank</label>
											<input type="text" class="form-control" id="bank" value="${seller.bank}" name="bank">
										</div>
										<div class="form-group">
											<label for="account">account</label>
											<input type="text" class="form-control" id="account" value="${seller.account}" name="account">
										</div>
										<div class="form-group">
											<label for="address">place</label>
											<input type="text" class="form-control" id="place" value="${seller.place}" name="place">
										</div>
									</c:if>
									<c:if test="${seller eq null}">
										<div class="form-group">
										<label for="licensee">license</label><br>
											<input type="text" class="form-control col-6 float-left" id="license" style="display: inline-block;" placeholder="license" name="license">
											<label id="id-error" class="offset-4 col-7" for="license"></label>
										</div>		
										<div class="form-group">
											<label for="name">seller name</label>
											<input type="text" class="form-control col-6" id="name" placeholder="seller name" name="name">
										</div>
										<div class="form-group">
											<label for="phone">phone</label>
											<input type="text" class="form-control" id="phone" placeholder="phone" name="phone">
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
											<label for="address">place</label>
											<input type="text" class="form-control" id="place" placeholder="place" name="place">
										</div>
									</c:if>
									<button type="button" class="btn btn-dark float-right" style="margin-top: 10px;" id="request-seller">신청/수정</button>							
								</div>	
							</form>					
						</div>
					</div>
					<!-- 회원 탈퇴 클릭 시 -->
					<div class="withdrawal display-none">
						<div class="withdrawal-contents">
							<form action="<%=request.getContextPath()%>/withdrawal" method="post" id="withdrawal-form">
								<div class="container offset-3 col-6 signup-box">
									<div class="offset-3"> <h1 style="margin-top: 50px;">회원 탈퇴</h1></div>
									<div class="form-group">
									<label for="id">ID</label><br>
										<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" name="id" readonly value="${user.id}">
										<label id="id-error" class="offset-4 col-7" for="id"></label>
									</div>
									<div class="form-group">
										<label for="pw">password</label>
										<input type="password" class="form-control col-7" id="password" placeholder="password" name="password">
									</div>														
									<button type="button" class="btn btn-dark float-right" style="margin-right: 15px; margin-bottom: 20px;" id="withdrawal-ok">탈퇴하기</button>							
								</div>	
							</form>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom">
			<div class="bottom-contents">
			
			</div>
		</div>
	</div>
</div>
</html>