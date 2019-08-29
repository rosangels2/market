<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.contents-box{
	padding: 20px;
}
/* 상단 */
.register-contents{
	min-height: 200px;
}
.title{
	margin: 10px 0;
	padding: 10px;
}
.input-box{
	margin: 10px 0;
	padding: 10px;
}
.input-box div{
	float: left;
	margin-right: 20px;
}
.button-box{
	padding-top: 36px; 
}
.button-box button{
	float: right; 
}
/* 하단 */
.list-contents{
	min-height: 200px;
}
.table-title{
	text-align: center;
	border-bottom: 1px solid gray;
}
.table-contents{
	text-align: center;
}
/* 공통 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#finish-button').click(function(){
		if($('input[name=delivery_no]').val() == ""){
			return false;
		}
		$('#finish').submit();
	});
});
</script>
</head>
<div style="min-height: 1000px;">
	<div class="contents">
		<div class="contents-box">
			<div class="register-box">
				<div class="register-contents">
					<div class="title">
						<h2>배송 완료 등록</h2>
					</div>
					<form method="post" id="finish" action="">
						<div class="input-box clearfix">
							<div class="deliverer">
								<h4>배송자</h4>
								<input name="deliverer1" value="${user.name}">
							</div>
							<div class="phone">
								<h4>연락처</h4>
								<input name="phone1" value="${user.phone}">
							</div>
							<div class="delivery_no">
								<h4>배송번호</h4>
								<input name="delivery_no">
							</div>
							<div class="button-box clearfix">
								<button id="finish-button">배송 완료</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="list-box">
				<div class="list-contents">
					<table class="table">
						<tr class="table-title">
							<th width="10%">배송 번호</th>
							<th width="10%">주문 번호</th>
							<th width="40%">물품명</th>
							<th width="20%">출발지</th>
							<th width="20%">도착지</th>
						</tr>
						<c:forEach items="${delivererList}" var="list">
							<tr class="table-contents">
								<th>${list.no}</th>
								<th>${list.buy_no}</th>
								<th>${list.contents}</th>
								<th>${list.start}</th>
								<th>${list.end}</th>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</html>