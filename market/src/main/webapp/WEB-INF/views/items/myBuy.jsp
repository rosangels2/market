<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.contents-box{
	padding : 50px 50px;
}
/* 이미지 */
.img-box{
	min-height: 300px;
	margin-bottom: 40px;
}
.img img{
	width: 500px;
	height: 500px;
}
/* 주문 정보 */
.info-box{
	min-height: 300px;
}
.info-box div{
	margin-bottom: 20px;
}
.info-box input{
	height: 50px;
	font-size: 30px;
	width: 800px;
	border: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 1000px;">
	<div class="contents container">
		<div class="contents-box">
			<!-- 이미지 -->
			<div class="img-contents">
				<div class="img-box">
					<div class="img">
						<img src="<%=request.getContextPath()%>/resources/uploadFiles${bVo.image}">
					</div>
				</div>
			</div>
			<!-- 주문 정보 -->
			<div class="info-contents">
				<div class="info-box">
					<div>
						<h4>주문 번호</h4>
						<input readonly value="${bVo.no}">
					</div>
					<div>
						<h4>현재 주문 상태</h4>
						<input readonly value="${bVo.state}">
					</div>					
					<div>
						<h4>주문 시간</h4>
						<input readonly value="${bVo.time}">
					</div>
					<div>
						<h4>판매자명</h4>
						<input readonly value="${dVo.seller_name}">
					</div>
					<div>
						<h4>주문 내용</h4>
						<input readonly value="${dVo.contents}">
					</div>
					<div>
						<h4>주문 가격</h4>
						<input readonly value="${bVo.price}">
					</div>
					<div>
						<h4>배송 시 요청 사항</h4>
						<input readonly value="${bVo.request}">
					</div>
					<div>
						<h4>배송 출발지</h4>
						<input readonly value="${dVo.start}">
					</div>
					<div>
						<h4>배송 도착지</h4>
						<input readonly value="${dVo.end}">
					</div>
					<div>
						<h4>택배 회사명</h4>
						<input readonly value="${dVo.company}">
					</div>
					<div>
						<h4>배송자</h4>
						<input readonly value="${dVo.deliverer}">
					</div>
					<div>
						<h4>배송자 연락처</h4>
						<input readonly value="${dVo.phone}">
					</div>
					<div>
						<h4>배송 시작 시간</h4>
						<input readonly value="${start}">
					</div>
					<div>
						<h4>배송 종료 시간</h4>
						<input readonly value="${end}">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</html>