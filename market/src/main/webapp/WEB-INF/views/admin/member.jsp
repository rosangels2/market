<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
/* 메뉴 */
.menu-contents{
	padding: 20px 0 20px 70px;
}
.menu-contents div{
	border: 1px solid gray;
	margin-right: 30px;
	cursor: pointer;
}
/* 목록 */
.table-title{
	text-align: center; 
}
.table-contents th{
	text-align: center;
}
.bottom-box{
	min-height: 100px;
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
	left: 0;
	top: 26px;
}
.page-view select{
	width: 300px;
	height: 40px;
	margin: 4px 0 5px 0;
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
		$('.search').removeClass('display-none');
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
		$('.search').addClass('display-none');
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
	
	//검색 아이콘 클릭 시
	$('#search-icon').click(function(){
		if($('#search').val() == ""){
			alert('검색값을 입력해 주세요.');
			return false;
		}
		$('#search-form').submit();
	});
	
	//게시글 개수 선택 시
	$('select[name=perPageNum]').change(function(){
		$('#search-form').submit(); 
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
			<!-- 검색창 -->
			<div class="search">
				<form action="" method="get" id="search-form">
					<div class="search-contents clearfix">
						<div class="search-text">
							<select name="type" id="type"> 
								<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if> >ID</option>
								<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if> >이름</option>
								<option value="3" <c:if test="${pageMaker.criteria.type eq 3}">selected</c:if> >이메일</option>
							</select>
						</div>
						<div class="search-input">
							<input class="input" name="search" id="search" value="${pageMaker.criteria.search}">
						</div>
						<div class="search-img">
							<i class="fas fa-search img" style="font-size: 40px;" id="search-icon"></i>
						</div>
						<div class="page-view float-left">
							<select name="perPageNum" id="perPageNum">
								<option value="10" <c:if test="${pageMaker.criteria.perPageNum eq 10}">selected</c:if> >10개씩 보기</option>
								<option value="20" <c:if test="${pageMaker.criteria.perPageNum eq 20}">selected</c:if> >20개씩 보기</option>
								<option value="30" <c:if test="${pageMaker.criteria.perPageNum eq 30}">selected</c:if> >30개씩 보기</option>
								<option value="50" <c:if test="${pageMaker.criteria.perPageNum eq 50}">selected</c:if> >50개씩 보기</option>							
							</select>					
						</div>	
					</div>
				</form>
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
						<ul class="pagination" style="justify-content: center;">
						    <c:if test="${pageMaker.prev}">	<!-- 이전 버튼(boolean 값이 true면 보여준다) -->
						        <li class="page-item">
						            <a class="page-link" href="<%=request.getContextPath()%>/admin/member?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">Previous</a>
						        </li>							<!-- 현재 페이지의 스타트 페이지에서 -1을 뺀 값을 페이지로 결정 -->
						    </c:if>
						    <!-- 페이지네이션 목록 -->																<!-- var xxx = 반복문의 i 역할 -->
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">	<!-- begin/end를 통해 시작과 끝을 지정하고 반복 -->
						        <c:if test="${pageMaker.criteria.page == index}">	<!-- uri의 페이지 번호가 index와 같다면 active를 추가-->
							        <li class="page-item active">
							            <a class="page-link" href="<%=request.getContextPath()%>/admin/member?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>	<!-- 숫자를 찍는 역할 -->
							        </li>
						        </c:if>
						        <c:if test="${pageMaker.criteria.page != index}">	<!-- uri의 페이지 번호가 index와 다르다면 -->
							        <li class="page-item">								<!-- index : 반복문의 i같은 역할로 증감연산 -->
							            <a class="page-link" href="<%=request.getContextPath()%>/admin/member?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a>	<!-- 숫자를 찍는 역할 -->
							        </li>
						        </c:if>
						    </c:forEach>
						    <c:if test="${pageMaker.next}">	<!-- 다음버튼(boolean 값이 true면 보여준다) -->
						        <li class="page-item">
						            <a class="page-link" href="<%=request.getContextPath()%>/admin/member?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}&perPageNum=${pageMaker.criteria.perPageNum}">Next</a>
						        </li>
						    </c:if>
						</ul>	
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