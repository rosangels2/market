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
/* 메뉴 바 */
.nav-bar{
	position: fixed;
	float: left;
	width: 130px;
	min-height: 400px;
}
.nav-box{
    border-radius: 7pt;
	height: calc( 100% / 9 );
	text-align: center;
	padding: 15px 0 10px 0;
}
.nav-box:hover{
	cursor: pointer;
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
.buy-agree:hover{
	cursor: pointer;
}
.buy-cancel:hover{
	cursor: pointer;
}
.buy-return:hover{
	cursor: pointer;
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
	margin-top: 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #dee2e6;
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
	padding: 7px 10px 0 10px;
}
.item-img-box img{
	width: 264px;
	height: 130px;
}
.wishlist-delete{
	margin-top: 50px;
	border: none;
	background-color: white;
}
.wishlist-box input{
	text-align: center;
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
	padding-bottom: 15px;
    border-bottom: 1px solid #dee2e6;
}
.bag-box input{
	border: none;
	text-align: center; 
}
.bag-info-box{
	position: relative;
	height: 150px;
	width: 634px; 
	padding: 10px;
}
.bag-info-box div{
	width: 100%;
	height: calc( 100% / 3 );
}
.bag-price-box{
	padding-right: 50px;
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
	padding: 15px 10px 20px 10px;
	margin-top: 20px;
}
.order-box button{
	width: 150px;
	float: right;
} 
.order-price-box{
	margin-left: 150px;
	height: 70px;
	float: left;
	padding: 20px 10px;
}
.order-price-box input{
	float: left;
	margin: 0 10px;
}
.checkbox-box{
	padding: 60px 0 0 10px;
}
.bag-checkbox{
	width: 20px;
	height: 20px;
}
#bag-checkAll{
	margin: 20px 20px 20px 0;
	width: 25px;
	height: 25px;
}
.bag-contents button{
	border: none;
	background-color: white;
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
.get-coupon:hover{
	cursor: pointer;
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
.ask-title:hover{
	cursor: pointer;
}
.ask-board .table-contents{
	text-align: center;
}
.board-box-contents{
	min-height: 200px;
}
.board-set{
	border: 1px solid gray;
	border-top: none;
	border-radius: 5pt;
}
.board-set .set-top div{
	float: left;
	text-align: center;
	border-right: 1px solid gray;
	border-bottom: none;
	height: 30px;
}
.board-set .set-bottom{ 
	min-height: 50px;
	border-top: 1px solid gray;
	padding: 5px;
}
.board-set .reply-box{
	position: relative;
	min-height: 100px;
	border-top: 1px solid gray;
}
.reply-box input{
	min-height: 100px;
	width: 100%;
	border: none;
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
	background-color: #dee2e6;
}
select, input{
	border-radius: 5pt;
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
	
	//구매 확정 클릭 시
	$('.buy-agree').click(function(){
		var s = confirm("구매 확정을 진행하시겠습니까?");
		var no = $(this).parents('.table-contents').find('.buy-no').text();
		var id = $('input[name=id]').val();
		var a = $(this).parents('.table-contents').find('.buy-state');
		if(s){
			$.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"id": id, "no": no},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/buyAgree",
		        dataType:"json",
		        //contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						a.html("구매확정");
					}
		        }
			 });
		}else{
			alert("no");
		}
	});
	
	//구매 취소 클릭 시
	$('.buy-cancel').click(function(){
		var s = confirm("구매 취소를 진행하시겠습니까?");
		var no = $(this).parents('.table-contents').find('.buy-no').text();
		var id = $('input[name=id]').val();
		var a = $(this).parents('.table-contents').find('.buy-state');
		if(s){
			$.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"id": id, "no": no},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/buyCancel",
		        dataType:"json",
		        //contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						a.html("취소요청");
					}
		        }
			 });
		}else{
			alert("no");
		}
	});
	
	//교환/반품 클릭 시
	$('.buy-return').click(function(){
		var s = confirm("반품/교환을 진행하시겠습니까?");
		var no = $(this).parents('.table-contents').find('.buy-no').text();
		var id = $('input[name=id]').val();
		var a = $(this).parents('.table-contents').find('.buy-state');
		if(s){
			$.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"id": id, "no": no},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/buyReturn",
		        dataType:"json",
		        //contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						a.html("교환/반품요청");
					}
		        }
			 });
		}else{
			alert("no");
		}
	});
	
	//내 정보 수정 정규표현식
	$("#modify").validate({
        rules: {
        	oldPassword: {
        		required : true,
                minlength : 8,
                maxlength : 12,
                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/	//영문 또는 숫자만 사용 가능하며 각각 1개 이상 사용
                //	   /^(?=.*[a-zA-Z])(?=.*[!@#$%^*-])(?=.*[0-9]).{8,12}$/		특수문자, 영문, 숫자를 1개씩 포함
                // 	   /^\w*(\d[A-z]|[A-z]\d)\w*$/ 영어숫자 포함
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
	
	//장바구니 삭제 시
	$('.bag-delete').click(function(){
		var parents = $(this).parents('.bag-box');
		var s = confirm('정말로 삭제하시곘습니까?');
		var no = $(this).parents('.bag-box').find('input[name=bag_no]').val();
		var id = $('input[name=id]').val();
		if(s){
			$.ajax({
		        async:false,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"no": no, "id": id},
		        url:"<%=request.getContextPath()%>/deleteBag",
		        dataType:"json",
		       //contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						alert("장바구니를 삭제합니다.");
						parents.remove();
					}else{
						alert("요청에 실패했습니다.");
					}
		        }
		    });
		}
	});
	
	//장바구니 수정 시
	$('.bag-modify').click(function(){
		var q = $(this).parents('.bag-box').find('input[name=price]').val();	//기존 가격
		var a = $(this).parents('.bag-box').find('input[name=count]').val();	//바뀐 수량
		var s = $(this).parents('.bag-box').find('input[name=original_price]').val();	//개당 가격
		var d = parseInt(a*s);	//수량 * 개당 가격
		var f = parseInt(d-q);	//바뀐 가격 - 원래 가격
		var g = parseInt($('input[name=total_price]').val());		//최종 가격
		$(this).parents('.bag-box').find('input[name=price]').val(parseInt(a*s));
		if($(this).parents('.bag-box').find('.bag-checkbox').prop("checked")){
			$('input[name=total_price]').val(g+f);
		}
	});
	
	//장바구니 체크 시
	$('.bag-checkbox').change(function(){
		if($(this).prop("checked")){	//체크한 경우
			$(this).parents('.bag-box').find('input[name=bag_check]').val(1);
			var a = true;
			$('.bag-checkbox').each(function(){		//현재 체크박스 상태들을 확인
				var s = $(this).prop("checked");
				if(!s){
					a = false;
				}
			});
			if(a){	//체크박스가 전부 체크됐으면
				$('#bag-checkAll').prop("checked", true);	//전체 선택 체크박스를 체크로 변경 
			}
		}else{	//체크를 해제한 경우
			$(this).parents('.bag-box').find('input[name=bag_check]').val(0);
			$('#bag-checkAll').prop("checked", false);
		}
		var delivery = parseInt(2500);
		var total = 0;
		$('.bag-box').each(function(){
			if($(this).find('.bag-checkbox').prop("checked")){
				var s = parseInt($(this).find('input[name=price]').val());
				total += s;
			}
		});
		if(total > 0 && total < 30000){
			total += delivery;
		}
		$('input[name=total_price]').val(total);
	});
	
	//장바구니 전체 선택 시
	$('#bag-checkAll').click(function(){
		var delivery = parseInt(2500);
		if($(this).prop("checked")){	//체크한 경우
			$('.bag-checkbox').prop("checked", true);
			$('.bag-box').find('input[name=bag_check]').val(1);
			var total = 0;
			$('.bag-box').each(function(){
				var s = parseInt($(this).find('input[name=price]').val());
				total += s;
			});
			if(total > 0 && total < 30000){
				total += delivery;
			}
			$('input[name=total_price]').val(total);
		}else{	//체크를 해제한 경우
			$('.bag-checkbox').prop("checked", false);
			$('.bag-box').find('input[name=bag_check]').val(0);
			$('input[name=total_price]').val(0);
		}
	});
	
	//장바구니 선택 삭제 시
	$('#check-delete').click(function(){
		var list = '';
		$('.bag-checkbox').each(function(){		//장바구니 페이지에서 지우기
			if($(this).prop("checked")){
				list += $(this).parents('.bag-box').find('input[name=bag_no]').val()+'&';
				$(this).parents('.bag-box').remove();
			}
		});
		$.ajax({
	        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:list,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/checkDeleteBag",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
				if(data){
					var total = 0;
					$('.bag-box').each(function(){
						$(this).find('.bag-checkbox').prop("checked", true);
						$('#bag-checkAll').prop("checked", true);
						var s = parseInt($(this).find('input[name=price]').val());
						total += s;
					});
					if(total > 0 && total < 30000){
						total += delivery;
					}
					$('input[name=total_price]').val(total);
				}else{
					
				}
	        }
	 	});
		
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
	
	//문의글 제목 클릭 시
	$('.board-set .ask-title').click(function(){
		$(this).parent().siblings('.set-bottom').toggleClass('display-none');
		if($(this).siblings('.ask-state').text() == '답변완료'){
			$(this).parent().siblings('.reply-box').toggleClass('display-none');	
		}
	});
	
	//판매자 신청 정규표현식
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
				<c:if test="${user.grade ne 'admin'}"> 
					<div class="nav-box seller-request" value="seller-request">
						<h6>판매자 신청</h6>
					</div>
				</c:if>
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
													<h6>주문 번호</h6><a href="<%=request.getContextPath()%>/items/myBuy?no=${buy.no}" class="buy-no">${buy.no}</a>
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
													<h5>
														<a href="<%=request.getContextPath()%>/items/myBuy?no=${buy.no}" class="buy-state">${buy.state}</a>
													</h5>
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
									<button class="btn btn-dark float-right" style="margin-bottom: 20px;" id="modify-ok">입력완료</button>
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
									<div class="bag-box clearfix">
										<input type="hidden" name="bag_check" value="1">
										<input type="hidden" name="bag_no" value="${bag.no}">
										<input type="hidden" name="item_no" value="${bag.item_no}">
										<input type="hidden" name="option_no" value="${bag.option_no}">
										<div class="checkbox-box clearfix float-left">
											<input type="checkbox" class="bag-checkbox" checked>
										</div>
										<div class="bag-img-box float-left clearfix">
											<div class="item-img-box clearfix">
												<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${bag.image}">
											</div>
										</div>
										<div class="bag-info-box float-left clearfix">
											<div class="info">
												상품명<input readonly name="select" value="${bag.select}" style="width:250px;">
												옵션명<input readonly name="detail" value="${bag.detail}" style="width:250px;">
											</div>
											<div class="count">
												수량<input name="count" value="${bag.count}" style="margin: 0 100px 0 20px; border: 1px solid gray;">
												가격<input readonly name="price" value="${bag.price}">
												<input type="hidden" name="original_price" value="${bag.price/bag.count}">
											</div>
											<div class="button-box clearfix">
												<button type="button" class="bag-delete" style="float:right">삭제하기</button>
												<button type="button" class="bag-modify" style="float:right; margin-right: 20px;">수정하기</button>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 장바구니 주문 창 -->
								<div class="order-box clearfix">
									<input type="checkbox" id="bag-checkAll" class="float-left" checked>
									<button type="button" class="float-left" id="check-delete" style="margin: 10px 0 0 0;"><h3>선택 삭제</h3></button>
									<div class="order-price-box clearfix">
										<h4 class="float-left" style="margin: 0 10px;">상품 가격 합계</h4>
										<input name="total_price" value="${total_price}" readonly style="text-align: center;">
									</div>
									<button style="margin: 10px -10px 0 0;"><h3>주문하기</h3></button>
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
										<c:if test="${coupon ne null}">
											<tr class="coupon-list-text">
												<th>${coupon.title}<input type="hidden" value="${coupon.no}"></th>
												<th>${coupon.discount}원</th>
												<th>${coupon.period}</th>
												<th>${coupon.state}</th>
											</tr>
										</c:if>
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
								<!-- 내 문의 보기 -->
								<div class="board-box-contents-my">
									<div class="board-set ask-title1" style="border-top: 1px solid gray;" id="ask-title1">
										<div class="set-top clearfix">
											<div style="width: 10%;">문의 번호</div>
											<div style="width: 10%;">문의 유형</div>
											<div style="width: 30%;">제목</div>
											<div style="width: 15%;">작성자</div>
											<div style="width: 25%;">작성일</div>
											<div style="width: 10%; border-right: none;">상태</div>
										</div>
									</div>
									<c:if test="${user ne null}">
										<c:forEach items="${myAskList}" var="myAsk">
											<div class="board-set">
												<div class="set-top clearfix">
													<div style="width: 10%;">${myAsk.no}</div>
													<div style="width: 10%;">${myAsk.category}</div>
													<div class="ask-title" style="width: 30%;">${myAsk.title}</div>
													<div style="width: 15%;">${myAsk.writer}</div>
													<div style="width: 25%;">${myAsk.time}</div>
													<div class="ask-state" style="width: 10%; border-right: none;">${myAsk.state}</div>
												</div>
												<div class="set-bottom display-none">
													${myAsk.contents}
												</div>
												<div class="reply-box display-none">
													<h5>답변 내용</h5>
													<c:forEach items="${replyList}" var="reply">
														<c:if test="${myAsk.no eq reply.board_no}">
															${reply.contents}
														</c:if>
													</c:forEach>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
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