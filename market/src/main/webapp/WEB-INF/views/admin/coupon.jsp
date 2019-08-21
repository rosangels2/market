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
</style>
<script type="text/javascript">

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
									<th width="20%" class="">쿠폰명</th>
									<th width="25%" class="">할인 금액</th>
									<th width="30%" class="">유효 기간</th>
									<th width="15%">관리</th>
								</tr>
								<!-- 테이블 컨텐츠 -->
								<tr class="coupon-list-text">
									<th>놓칠 수 없는 기회</th>
									<th>5000원</th>
									<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
									<th>
										<button>삭제</button>
									</th>
								</tr>
								<tr class="coupon-list-text">
									<th>놓칠 수 없는 기회</th>
									<th>5000원</th>
									<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
									<th>
										<button>삭제</button>
									</th>
								</tr>
								<tr class="coupon-list-text">
									<th>놓칠 수 없는 기회</th>
									<th>5000원</th>
									<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
									<th>
										<button>삭제</button>
									</th>
								</tr>
								<tr class="coupon-list-text">
									<th>놓칠 수 없는 기회</th>
									<th>5000원</th>
									<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
									<th>
										<button>삭제</button>
									</th>
								</tr>
								<tr class="coupon-list-text">
									<th>놓칠 수 없는 기회</th>
									<th>5000원</th>
									<th>yyyy-mm-dd ~ yyyy-mm-dd</th>
									<th>
										<button>삭제</button>
									</th>
								</tr>
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
								<input>
							</th>
							<th class="table-contents-th">
								<input>
							</th>
							<th class="table-contents-th">
								<input>
							</th>
						</tr>
					</table>			
				</div>	
				<div class="button-box clearfix">
					<button>
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