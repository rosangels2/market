<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.menu-box{
	min-height: 100px;
	padding: 30px 0;
}
.menu-contents div{
	float: left;
	border: 1px solid gray;
	margin-right: 20px;
}
.table-title{
	text-align: center; 
}
.table-title th{
}
.th-last{
}
.table-contents th{
	text-align: center;
}
.bottom-box{
	min-height: 100px;
}
.search-box{
	margin-bottom: 40px;
}
.search-box div{
	margin-right: 15px;
}
.search-box input{
	width: 300px;
	fint-size: 30px;
}

/* 공통 */
.background-gray{
	background-color: gray;
}
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//댓글 목록 클릭 시
	$('#comment-menu').click(function(){
		$('.comment-board').removeClass('display-none');
		$('.ask-board').addClass('display-none');
		$('.reply-board').addClass('display-none');
		$(this).addClass('background-gray');
		$('#ask-menu').removeClass('background-gray');
		$('#reply-menu').removeClass('background-gray');
		
	});
	
	//상품문의 목록 클릭 시
	$('#ask-menu').click(function(){
		$('.ask-board').removeClass('display-none');
		$('.comment-board').addClass('display-none');
		$('.reply-board').addClass('display-none');
		$(this).addClass('background-gray');
		$('#comment-menu').removeClass('background-gray');
		$('#reply-menu').removeClass('background-gray');
	});
	
	//문의 답변 목록 클릭 시
	$('#reply-menu').click(function(){
		$('.reply-board').removeClass('display-none');
		$('.comment-board').addClass('display-none');
		$('.ask-board').addClass('display-none');
		$(this).addClass('background-gray');
		$('#comment-menu').removeClass('background-gray');
		$('#ask-menu').removeClass('background-gray');
	});
	
	//댓글 삭제 클릭 시
	$('.comment-delete').click(function(){
		var box = $(this).parent();
		var no = $(this).siblings().first().text();
		var test = confirm('정말로 삭제하시겠습니까?');
		if(!test){
			return;
		}else{		//삭제 확인 시
			$.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:no,
		        url:"<%=request.getContextPath()%>/admin/deleteComment",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		        	if(data){
		        		box.remove();
		        	}else{
		        		alert("요청이 실패했습니다.");
		        	}
		        }
		  });
		}
	});
	
	//상품 문의 삭제 클릭 시
	$('.ask-delete').click(function(){
		var box = $(this).parent();
		var no = $(this).siblings().first().text();
		var test = confirm('정말로 삭제하시겠습니까?');
		if(!test){
			return;
		}else{		//삭제 확인 시
			$.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:no,
		        url:"<%=request.getContextPath()%>/admin/deleteAsk",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		        	if(data){
		        		box.remove();
		        	}else{
		        		alert("요청이 실패했습니다.");
		        	}
		        }
		  });
		}
	});
	 
	//문의 답변 삭제 클릭 시
	$('.reply-delete').click(function(){
		var box = $(this).parent();
		var no = $(this).siblings().first().text();
		var test = confirm('정말로 삭제하시겠습니까?');
		if(!test){
			return;
		}else{		//삭제 확인 시
			$.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:no,
		        url:"<%=request.getContextPath()%>/admin/deleteReply",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		        	if(data){
		        		box.remove();
		        	}else{
		        		alert("요청이 실패했습니다.");
		        	}
		        }
		  });
		}
	});
	
});		//레디

</script>
</head>
<div style="min-height: 1000px;">
	<div class="board-box">
		<div class="board-contents">
			<!-- 메뉴 -->
			<div class="menu-box">
				<div class="menu-contents clearfix">
					<div class="background-gray" id="comment-menu">
						<h4>댓글 목록</h4>
					</div>
					<div class="" id="ask-menu">
						<h4>문의사항 목록</h4>
					</div>
					<div class="" id="reply-menu">
						<h4>문의답변 목록</h4>
					</div>
				</div>
			</div>
			<!-- 댓글 관리 -->
			<div class="comment-board">
				<div class="comment-contents">
					<div class="search-box clearfix">
					<div class="search-img float-right">
						<i class="fas fa-search img" style="font-size: 30px;"></i>
					</div>
					<div class="search-input float-right"><input></div>
					<div class="search-select float-right">
						<select>
							<option>제목</option>
							<option>내용</option>
						</select>
					</div>  
				</div>
					<table class="table">
						<tr class="table-title">
							<th width="10%">번호</th>
							<th width="10%">작성자</th>
							<th width="50%">내용</th>
							<th width="20%">등록일</th>
							<th width="10%">관리</th>	
						</tr>
						<c:forEach items="${commentList}" var="comment">
							<tr class="table-contents">
								<th>${comment.no}</th>
								<th>${comment.writer}</th>
								<th>${comment.contents}</th>							
								<th>${comment.time}</th>
								<th class="comment-delete">삭제</th>
							</tr>
						</c:forEach>
					</table>								
				</div>				
			</div>
			<!-- 문의글 관리 -->
			<div class="ask-board display-none">
				<div class="ask-contents">
					<div class="search-box clearfix">
						<div class="search-img float-right">
							<i class="fas fa-search img" style="font-size: 30px;"></i>
						</div>
						<div class="search-input float-right"><input></div>
						<div class="search-select float-right">
							<select>
								<option>제목</option>
								<option>내용</option>
							</select>
						</div>  
					</div> 
					<div class="board-box">
						<table class="table">
							<tr class="table-title">
								<th width="10%">번호</th>		<!-- width를 통해 가로를 지정 -->
								<th width="10%">작성자</th>
								<th width="15%">제목</th>
								<th width="35%">내용</th>
								<th width="20%">등록일</th>
								<th width="10%">관리</th>	
								
							</tr>
							<c:forEach items="${askList}" var="ask">
								<tr class="table-contents">
									<th>${ask.no}</th>
									<th>${ask.writer}</th>
									<th>${ask.title}</th>
									<th>${ask.contents}</th>
									<th>${ask.time}</th>
									<th class="ask-delete">삭제</th>
								</tr>
							</c:forEach>
						</table>							
					</div>					
				</div>
			</div>
			<!-- 문의 답변글 관리 -->
			<div class="reply-board display-none">
				<div class="reply-contents">
					<div class="search-box clearfix">
						<div class="search-img float-right">
							<i class="fas fa-search img" style="font-size: 30px;"></i>
						</div>
						<div class="search-input float-right"><input></div>
						<div class="search-select float-right">
							<select>
								<option>제목</option>
								<option>내용</option>
							</select>
						</div>  
					</div> 
					<div class="board-box">
						<table class="table">
							<tr class="table-title">
								<th width="10%">번호</th>		<!-- width를 통해 가로를 지정 -->
								<th width="10%">작성자</th>
								<th width="50%">내용</th>
								<th width="20%">등록일</th>
								<th width="10%">관리</th>	
							</tr>
							<c:forEach items="${replyList}" var="reply">
								<tr class="table-contents">
									<th>${reply.no}</th>
									<th>${reply.writer}</th>
									<th>${reply.contents}</th>
									<th>${reply.time}</th>
									<th class="reply-delete">삭제</th>
								</tr>
							</c:forEach>
						</table>							
					</div>					
				</div>
			</div>
		</div>	<!-- 보드 컨텐츠 끝 -->
		<!-- 하단  -->
		<div class="bottom">
			<div class="bottom-box">
			
			</div>
		</div>
	</div>
</div>
</html>