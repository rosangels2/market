<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.container{
	min-width: 1140px;
	max-width: 2000px;
}
.contents-box{
	padding: 20px;
	min-width: 1100px;
}
/* 검색창 */
.search-contents{
	position: relative;
	height: 100px;
	padding-top: 30px;
}
.search-contents .search-text{
	position: absolute;
	right: 360px;
	top: 20px;
}
.search-text img{
	width: 150px;
	height: 50px;
}
.search-contents .search-input{
	position: absolute;
	right: 50px;
}
.search-input .input{
	width: 300px;
	height: 35px;
}
.search-contents .search-img{
	position: absolute;
	right: 0;
}
#type{
	margin-top: 16px;
}
/* 페이지 선택창 */
.page-select-contents{
	height: 50px;
	position: relative;
	padding: 0 0 0 10px;
}
.list-select-box{
	width: 300px;
	margin: 0;
	display: inline-block;
}
.list-select-box select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
}
.page-view{
	position: absolute;
	right: 0;
	top: 26px;
}
.page-view select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
}
/* 배송자 등록 */
.register-contents{
	min-height: 50px;
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
/* 배송 목록 */
.list-contents{
	min-height: 200px;
}
.table{
	
}
.table-title{
	text-align: center;
}
.table-contents{
	text-align: center;
}
/* 하단 */
.bottom{
	min-height: 100px;
}
/* 공통 */
.display-none{
	display: none;
}
select, input{
	border-radius: 5pt;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//게시글 개수 선택 시
	$('select[name=perPageNum]').change(function(){
		$('#search-form').submit(); 
	});
	
	//취소처리 클릭 시
	$('.cancel-agree').click(function(){
		var parent = $(this).parents('.table-contents');
		var no = parent.find('.request-no').text();
		var s = confirm("취소를 진행하시겠습니까?");
		if(s){
			$.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data: no,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/items/cancelAgree",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						parent.remove();
					}else{
						alert("실패하였습니다");
					}
		        }
			 });
		}else{
			
		}
	});
	
	//교환처리 클릭 시
	$('.swap-agree').click(function(){
		var parent = $(this).parents('.table-contents');
		var no = parent.find('.request-no').text();
		var s = confirm("취소를 진행하시겠습니까?");
		if(s){
			$.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data: no,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/items/swapAgree",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						parent.remove();
					}else{
						alert("실패하였습니다");
					}
		        }
			 });
		}else{
			
		}
	});
	
	//반품처리 클릭 시
	$('.return-agree').click(function(){
		var parent = $(this).parents('.table-contents');
		var no = parent.find('.request-no').text();
		var s = confirm("취소를 진행하시겠습니까?");
		if(s){
			$.ajax({
		        async:true,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data: no,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/items/returnAgree",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						parent.remove();
					}else{
						alert("실패하였습니다");
					}
		        }
			 });
		}else{
			
		}
	});
	
});		//레디
</script>
</head>
<div style="min-height: 1000px;">
	<div class="contents clearfix">
		<div class="contents-box clearfix">
			<!-- 배송자 등록 -->
			<div class="register-box">
				<div class="register-contents">
					<div class="title">
						<h2>상품 요청 목록</h2>
					</div>
				</div>
			</div>
			<!-- 주문 정보 목록 -->
			<div class="list-box">
				<div class="list-contents">
					<table class="table">
						<tr class="table-title">
							<th width="10%">주문 번호</th>
							<th width="15%">구매자</th>
							<th width="10%">상품 번호</th>
							<th width="10%">옵션 번호</th>
							<th width="15%">수량</th>
							<th width="15%">가격</th>
							<th width="15%">요청 수락</th>
						</tr>
						<c:if test="${requestList ne null}">
							<c:forEach items="${requestList}" var="request">
								<tr class="table-contents">
									<td class="request-no">${request.no}</td>
									<td>${request.id}</td>
									<td>${request.item_no}</td>
									<td>${request.option_no}</td>
									<td>${request.count}</td>
									<td>${request.price}</td>
									<td>
										<c:if test="${request.state eq '취소요청'}">
											<button class="cancel-agree">취소처리</button>
										</c:if>
										<c:if test="${request.state eq '교환/반품요청'}">
											<button class="swap-agree" style="margin-right:5px;">교환처리</button>
											<button class="return-agree">반품처리</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<div class="bottom"></div>
</div>
</html>