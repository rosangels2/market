<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
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
.use-text{
	margin-top: 30px;
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
	text-align: center;	
}
.table-contents th{
	text-align: center;	
}
.table-contents-th input{
	width: 90%;
	height: 35px;
}
.button-box{
	padding: 10px 33px 10px 10px;
}
.button-box button{
	float: right;
}
.bottom-contents{
	min-height: 100px;
}



/* 공통 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//쿠폰 삭제버튼 클릭 시
	$('.coupon-delete').click(function(){
		var box = $(this).parents('.coupon-list-text');
		var no = $(this).siblings('input[name=coupon_no]').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:no,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/admin/deleteCoupon",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	if(data){
	        		alert("쿠폰이 삭제 되었습니다.");
	        		box.remove();
	        	}else{
	        		alert("요청이 실패하였습니다.");	        		
	        	}
	        }
	  	});
	});
	
	//쿠폰 등록 버튼 클릭 시
	$('#add-coupon').click(function(){
		var title = $('.register-box input[name=title]').val();
		var discount = $('.register-box input[name=discount]').val();
		var period = $('.register-box input[name=period]').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"title": title, "discount": discount, "period": period},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/admin/addCoupon",
	        dataType:"json",
	        //contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	if(data.coupon != null){
	        		alert("쿠폰이 등록 되었습니다.");
	        		var str = '<tr class="coupon-list-text"><th>'+data.coupon.no+'</th><th>'+data.coupon.title+'</th><th>'+data.coupon.discount+'원</th><th>'+data.coupon.period+'</th><th><button class="coupon-delete">삭제</button><input type="hidden" name="coupon_no" value="'+data.coupon.no+'"></th></tr>';
	        		$('.use-coupon-list .table-title').after(str);
	        		$('.table-contents input').val("");
	        	}else{
	        		alert("요청이 실패하였습니다.");	        		
	        	}
	        }
	  	});
	});
	
	
	
});		//레디
</script>
</head>
<div style="min-height: 1000px;">
	<div class="contents">
		<div class="contents-box">
			<div class="up">
				<div class="coupon-bag">
					<div class="coupon-bag-contents">
						<div class="use-text">
							<h2>현재 유효 쿠폰</h2>
						</div>
						<div class="use-coupon-list">
							<table class="table">
								<!-- 테이블 타이틀 -->
								<tr class="table-title">
									<th width="10%">번호</th>
									<th width="20%" class="">쿠폰명</th>
									<th width="25%" class="">할인 금액</th>
									<th width="30%" class="">유효 기간</th>
									<th width="10%">관리</th>
								</tr>
								<!-- 테이블 컨텐츠 -->
								<c:if test="${couponList ne null}">
									<c:forEach items="${couponList}" var="coupon">
										<tr class="coupon-list-text">
											<th>${coupon.no}</th>
											<th>${coupon.title}</th>
											<th>${coupon.discount}원</th>
											<th>${coupon.period}</th>
											<th>
												<button class="coupon-delete">삭제</button>
												<input type="hidden" name="coupon_no" value="${coupon.no}">
											</th>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
					</div>
				</div>
				<div class="register-box">
					<div class="use-text">
						<h2>쿠폰 등록하기</h2>
					</div>
					<table class="table">
						<tr class="table-title">
							<th width="40%">쿠폰명</th>
							<th width="20%">할인 금액</th>
							<th width="40%">유효 기간</th>
						</tr>
						<tr class="table-contents">
							<th class="table-contents-th">
								<input name="title">
							</th>
							<th class="table-contents-th">
								<input name="discount">
							</th>
							<th class="table-contents-th">
								<input name="period">
							</th>
						</tr>
					</table>			
				</div>	
				<div class="button-box clearfix">
					<button id="add-coupon">
						<h4>등록하기</h4>
					</button>
				</div>	
			</div>
			<!-- 하단 페이지 -->
			<div class="bottom">
				<div class="bottom-contents">
				
				</div>
			</div>
		</div>
	</div>
</div>
</html>