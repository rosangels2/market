<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.menu-contents{
	padding: 20px 0 20px 70px;
}
.menu-contents div{
	border: 1px solid gray;
	margin-right: 30px;
}
.table-title{
	text-align: center; 
}
.table-contents th{
	text-align: center;
}
.bottom-box{
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

$(document).ready(function(){

	//전체 멤버 보기
	$('#all-member-view').click(function(){
		$('.seller-request-board').addClass('display-none');
		$('#seller-request-view').removeClass('background-gray');
		$('.member-board').removeClass('display-none');
		$(this).addClass('background-gray');
	});
	
	//멤버 등급 변경
	$('.changeGrade').change(function(){
		if($(this).val() == 0){
			return;
		}
		if($(this).val() == $(this).siblings('input[name=member_grade]').val()){
			return;
		}
		var s = $(this).siblings('input[name=member_grade]');
		var d = $(this);
		var t = $(this).parent();
		var id = $(this).siblings('input[name=member_id]').val();
		var grade = $(this).val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"id": id, "grade": grade},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/admin/changeGrade",
	        dataType:"json",
	        //contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	 if(data){
	        		 alert("요청이 성공 하였습니다.");
	        		 t.siblings('.member-grade').html(grade);
	        		 s.val(grade);
	        	 }else{
	        		 alert("요청이 실패 하였습니다.");
	        	 }
	        }
	  	});
	});
	
	//판매자 신청 보기
	$('#seller-request-view').click(function(){
		$('.seller-request-board').removeClass('display-none');
		$(this).addClass('background-gray');
		$('.member-board').addClass('display-none');
		$('#all-member-view').removeClass('background-gray'); 
	});
	
	//판매자 신청 승인 시
	$('.request-agree').click(function(){
		var box = $(this).parent();
		var id = $(this).children('input[name=request_id]').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:id,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/admin/agreeSeller",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	 if(data){
	        		 alert("요청이 성공 하였습니다.");
	        		 box.remove();
	        	 }else{
	        		 alert("요청이 실패 하였습니다.");
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
			<!-- 메뉴 -->
			<div class="menu-box">
				<div class="menu-contents clearfix">
					<div class="all-member background-gray float-left" id="all-member-view">
						<h3>전체 회원 관리</h3>
					</div>
					<div class="seller-request float-left" id="seller-request-view">
						<h3>판매자 신청 보기</h3>
					</div>
				</div>
			</div>
			<!-- 게시판 -->
			<div class="board-box">
				<div class="board-contents">
					<!-- 전체 회원 보기 -->
					<div class="member-board">
						<table class="table">
							<tr class="table-title">
								<th width="20%">ID</th>
								<th width="20%">name</th>
								<th width="30%">email</th>
								<th width="10%">등급</th>
								<th width="15%" class="th-last">등급 관리</th>
							</tr>
							<c:forEach items="${memberList}" var="member">
								<tr class="table-contents"> 
									<th>${member.id}</th>
									<th>${member.name}</th>
									<th>${member.email}</th>
									<th class="member-grade">${member.grade}</th>
									<th>
										<select class="changeGrade">
											<option value="0">등급 변경</option>
											<option value="member">member</option>
											<option value="seller">seller</option>
											<option value="deliverer">deliverer</option>
											<option value="withdrawal">withdrawal</option>
										</select>
										<input type="hidden" value="${member.id}" name="member_id">
										<input type="hidden" value="${member.grade}" name="member_grade">
									</th>
								</tr>
							</c:forEach>
						</table>		
					</div>		
					<!-- 판매자 신청 보기 -->
					<div class="seller-request-board display-none">
						<table class="table">
							<tr class="table-title">
								<th width="10%">번호</th>
								<th width="15%">ID</th>
								<th width="15%">licensse</th>
								<th width="15%">name</th>
								<th width="15%">phone</th>
								<th width="22%">place</th>
								<th width="8%">확인</th>
							</tr>
							<c:if test="${sellerList ne null}">
								<c:forEach items="${sellerList}" var="seller">
									<tr class="table-contents">
										<th>${seller.no}</th>
										<th class="request-id">${seller.id}</th>
										<th>${seller.license}</th>
										<th>${seller.name}</th>
										<th>${seller.phone}</th>
										<th>${seller.place}</th>
										<th class="request-agree">승인<input type="hidden" name="request_id" value="${seller.id}"></th>
									</tr>
								</c:forEach>
							</c:if>
						</table>		
					</div>							
				</div>
			</div>
			<!-- 하단 -->
			<div class="bottom-box">
				<div class="bottom-contents">
				
				</div>
			</div>
		</div>
	</div>
</div>
</html>