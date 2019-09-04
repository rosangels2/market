<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
*{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
/* img / select 박스 */
.img-info-contents{

}
.img-info-contents .img-box{
	width: 60%;
	padding: 20px;
	float: left;
}
.img-info-contents .select-box{
	width: 40%;
	padding: 20px;
	float: left;
}
.img-box img{
	width: 620px;
	height: 555px;
}
.select-box div{
	margin-top: 20px;
}
.select-box .title{
	margin: 30px 0;
}
.select-box option{
	font-size: 30px;
}
.select-box input{
	border: none;
}
/* 옵션 텍스트 */
/* 옵션 상세 내용 */
.option-info-contents{
	border: 1px solid gray;
	padding: 20px 0;
}
.info-box img{
	margin-top: 20px;
}
.info-box input{
	float: left;
	margin: 20px 40px 0 40px;
	border: 1px solid gray;
	text-align: center;
}
.info-box-last{
	padding: 20px 70px;
	margin-top: 30px;
}
.info-box-last input{
	float: right;
	margin: 20px 54px 0 37px;
	text-align: center;
}
/* 버튼 박스 */
.button-contents{
	margin-top: 30px;
	padding: 10px 0;
}
.button-contents button{
	float: right;
	margin-left: 20px;
}
.button-contents .buy-button{
	text-align: center;
	width: 150px;
}
/* 메뉴 선택 박스 */
.menu{
	margin: 100px 0 0 0;
}
.menu-box{
	position: relative; 
}
.menu-box .menu-box-left{
	float: left;
	border: 1px solid gray;
	text-align: center;
	padding: 5px;
}
.menu-box .menu-box-right{
	float: right;
	border: 1px solid gray;
	text-align: center;
	padding: 5px;
}
.menu-box h2{
	margin: 0;
}
/* 문의하기 창 */
.request-contents{
	position:absolute;
	z-index: 10;
}
.request-box{
	background-color: white;
	min-width: 600px;
	min-height: 400px;
	top: 50px;
	border: 1px solid gray;
}
.request-box .category{
	min-height: 30px;
	border-bottom: 1px solid gray;
	padding: 5px 0;
}
.request-box .category select{
	margin-left: 15px;
}
.request-box .title{
	min-height: 50px;
	border-bottom: 1px solid gray;
}
.ask-title{
	width: 598px;
}
.ask-contents{
	width: 598px;
	min-height: 220px;
}
.request-box .contents{
	min-height: 250px;
	border-bottom: 1px solid gray;
}
.request-box .button{
	padding: 5px;
	min-height: 50px;
	border-bottom: 1px solid gray;
}
/* 상품 정보 선택*/
.menu-info-box{
	min-height: 200px;
	padding: 10px;
	margin-bottom: 40px;
	position: relative;
}
.item-info .info-box img{
	width: 100%;
	height: 700px;
}
.bottom-box{
	min-height: 150px;
}
/* 문의/답변 선택 */
.ask-box .search-box{
	margin: 20px 0 ;
}
.search-box div{
	float: left;
}
.board-box-contents{
	min-height: 200px;
}
.board-set{
	border: 1px solid gray;
	border-top: none;
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
/* 문의 답변하기 창 */
.reply-contents-box{
	margin: 100px 0;
}
.reply-contents-box .reply-top{
	margin-bottom: 20px;
}


/* 댓글창 */
.comment-regiser-box{
	margin-top: 20px;
	padding-top: 20px;
	border-top: 1px solid gray; 
}
.comment-regiser-box .contents-box{
	min-height: 150px;
	position: relative;
}
.comment-regiser-box .contents-box input{
	width: 100%;
	min-height: 150px;
}
.comment-regiser-box .button-box button{
	float: right;
}
.comment-board th{
	text-align: center;
}

/* 하단 */
.bottom-box{
	min-height: 150px;
}


/* 공통 적용 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">

var data3;

$(document).ready(function(){
	
	$('#item-select').change(function(){
			 var option = $(this).val();
			 $.ajax({ 
			        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
			        type:'POST',	//POST방식으로 전송
			        data:option,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
			        url:"<%=request.getContextPath()%>/items/getDetail",
			        dataType:"json",
			        contentType:"application/json; charset=UTF-8",
			        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
			        	 var str = "";
			        	 str += '<option value="0">세부 옵션 선택</option>';
			        	 for(var i = 0; i<data.oVo.length; i++){
			        	 	str += '<option value="'+data.oVo[i].no+'">'+data.oVo[i].detail+'</option>'
			        	 }
			        	 $('#option-select').html(str);
			        }
			  });
	});
	
	$('#option-select').change(function(){
		var detail_no = $(this).val();
		 $.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:detail_no,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/items/getPrice",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		        	data3 = data.oVo;
		        	console.log("data3.select : " + data3.select);
		        	console.log("data.oVo.detail : " + data.oVo.detail);
					$('#item-price').val(data.oVo.price);
		        }
		  });
	});

	$('#stock-select').click(function(){
		if($('#item-select').val() == 0){
			return;
		}
		if($('#option-select').val() == 0){
			return;
		}
		if($('#stock-count').val() < 1){
			return;
		}
		var str = '<div class="info-box clearfix"><input type="hidden" name="option_no"><input readonly name="select" placeholder="선택 옵션"><input readonly name="detail" placeholder="세부 옵션"><input readonly name="count" placeholder="선택 수량"><input readonly name="price" placeholder="가격"></div>';
		$('.info-box-last').before(str);
		$('.info-box input[name=option_no]').last().val(data3.no);
		$('.info-box input[name=select]').last().val(data3.select);
		$('.info-box input[name=detail]').last().val(data3.detail);
		$('.info-box input[name=count]').last().val($('#stock-count').val());
		var price = (data3.price)*($('#stock-count').val());
		$('.info-box input[name=price]').last().val(price);
		var total = $('.option-box input[name=total_price]').val();
		 $.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"price": price, "total": total},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/items/getTotal",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		    		$('.option-box input[name=total_price]').val(data.total);
		        }
		  });
	});
	
	//옵션 추가 버튼
	$('.button-contents a').click(function(){
		if($('.option-box input[name=total_price]').val() == 0){
			return false;
		}
	});
	
	//구매 버튼
	$('.buy-button').click(function(){
		
	});
	
	//위시리스트 버튼
	$('#add-wishlist').click(function(){
		location.href = "<%=request.getContextPath()%>/items/addWishlist?id=${user.id}&item_no=${item.no}";
	});
	
	//장바구니 버튼
	$('#add-bag').click(function(){
		if($('.option-box input[name=total_price]').val() == 0){
			return false;
		}
		$('#option-form').attr("action", "<%=request.getContextPath()%>/items/addBag");
		$('#option-form').submit();
	});
	
	//상품 정보 메뉴 클릭 시
	$('.item-info-menu').click(function(){
		$('#contents').removeClass('display-none');
		$('#ask').addClass('display-none');
		$('#comment').addClass('display-none');
		$('.menu-box-right').addClass('display-none');
	});
	
	//문의/답변 메뉴 클릭 시
	$('.ask-menu').click(function(){
		$('#ask').removeClass('display-none');
		$('#contents').addClass('display-none');
		$('#comment').addClass('display-none');
		$('.menu-box-right').removeClass('display-none');
	});
	//문의하기 클릭 시
	$('#ask-request').click(function(){
		$('.request-contents').removeClass('display-none');
		$('#ask-form input[name=title]').val("");
		$('#ask-form input[name=contents]').val("");
	});
	//문의하기 취소 시
	$('#ask-cancel').click(function(){
		$('.request-contents').addClass('display-none');
		$('#ask-form input[name=title]').val("");
		$('#ask-form input[name=contents]').val("");
	});
	//문의 요청 시
	$('#ask-button').click(function(){ 
		$('.request-contents').addClass('display-none');
		if($('#ask-form input[name=title]').val() == "" || $('#ask-form input[name=contents]').val() == ""){
			alert("내용을 입력해 주세요.");
			return false;
		}
		var writer = $('#ask-form input[name=writer]').val();
		var board_no = $('#ask-form input[name=board_no]').val();
		var category = $('#ask-select').val();
		var title = $('#ask-form input[name=title]').val();
		var contents = $('#ask-form input[name=contents]').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"writer": writer, "board_no": board_no, "category": category, "title": title, "contents": contents},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/board/ask",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	$('#ask-form input[name=title]').val("");
        		$('#ask-form input[name=contents]').val("");
	        	if(data.bVo != null){	//등록한 게시글을 bVo에 담아 반환
	        		alert("문의글이 등록 되었습니다.");
	        		$('#ask-form input[name=title]').val("");
	        		$('#ask-form input[name=contents]').val("");
	        		var str = '<div class="board-set"><div class="set-top clearfix"><div style="width: 10%;">'+data.bVo.no+'</div><div style="width: 10%;">'+data.bVo.category+'</div><div class="ask-title" style="width: 30%;">'+data.bVo.title+'</div><div style="width: 15%;">'+data.bVo.writer+'</div><div style="width: 25%;">'+data.bVo.time+'</div><div class="ask-state" style="width: 10%; border-right: none;">'+data.bVo.state+'</div></div><div class="set-bottom display-none">'+data.bVo.contents+'</div><div class="reply-box display-none"><h5>답변 내용</h5></div></div>';
	        		$('.board-box .ask-title1').after(str);
	        	}else{
	        		alert("문의글 등록에 실패하였습니다.");
	        	}
	        }
	  });
		return false;
	});
	
	//문의글 제목 클릭 시
	$('.board-set .ask-title').click(function(){
		$(this).parent().siblings('.set-bottom').toggleClass('display-none');
	});
	
	//답변 보기 클릭 시
	$('.board-set .ask-state').click(function(){
		if($(this).text() == "답변대기"){
			return false;
		}
		$(this).parent().siblings('.reply-box').toggleClass('display-none');
	});
	
	//내 문의 보기 클릭 시
	$('#ask-my').click(function(){
		if($('input[name=id]').val() == ""){
			location.href = '<%=request.getContextPath()%>/signin';
		}
		$('.board-box-contents').addClass('display-none');
		$('.board-box-contents .set-bottom').addClass('display-none');
		$('.board-box-contents .reply-box').addClass('display-none');
		$('.board-box-contents-my').removeClass('display-none');
	});
	
	//전체 문의 보기 클릭 시
	$('#ask-all').click(function(){
		$('.board-box-contents-my').addClass('display-none');
		$('.board-box-contents-my .set-bottom').addClass('display-none');
		$('.board-box-contents-my .reply-box').addClass('display-none');
		$('.board-box-contents').removeClass('display-none');
	});
	
	//문의 답변 버튼 클릭 시
	$('#reply-button').click(function(){
		var category = $('.reply-contents-box input[name=category]').val();
		var board_no = $('.reply-contents-box input[name=ask_no]').val();
		var item_no = $('input[name=item_no]').val();
		var writer = $('.reply-contents-box input[name=seller_id]').val();
		var contents = $('.reply-contents-box input[name=contents]').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"category": category, "board_no": board_no, "item_no": item_no, "writer": writer, "contents": contents},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/board/askReply",
	        dataType:"json",
	        //contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	        	if(data.reply != null){		//답변을 가져오면
	        		$('.set-top').each(function(){
	        			var t = $(this).children('div').first().text();
	        			if(t == data.reply.board_no){
	        				alert("문의 답변이 등록 되었습니다.");
	        				$(this).children('.ask-state').html("답변완료");
	        				$(this).siblings('.reply-box').html('<h5>답변 내용</h5>'+data.reply.contents);
	        			}
	        		});
	        	}else{		//답변을 가져오지 못하면
	        		alert("요청이 실패 하였습니다.");
	        	}
	        }
		});
	});
	
	
	//댓글 등록 클릭 시
	$('#comment-add').click(function(){
		if($('input[name=id]').val() == ""){
			location.href = '<%=request.getContextPath()%>/signin';
		}
		var category = $('.comment-regiser-box input[name=category]').val();
		var board_no = $('.comment-regiser-box input[name=board_no]').val();
		var writer = $('input[name=id]').val();
		var to = $('.comment-regiser-box input[name=to]').val();
		var contents = $('.comment-regiser-box input[name=contents]').val();
		$.ajax({ 
	        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
	        type:'POST',	//POST방식으로 전송
	        data:{"category": category, "board_no": board_no, "writer": writer, "to": to, "contents": contents},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
	        url:"<%=request.getContextPath()%>/board/addComment",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
	  			alert("댓글이 등록 되었습니다.");
	        	var to = $('.comment-regiser-box input[name=to]').val("");
	    		var contents = $('.comment-regiser-box input[name=contents]').val("");
	        	var str = '<tr class="table-contents"><th>'+data.comment.writer+'</th><th>'+data.comment.contents+'</th><th>'+data.comment.time+'</th><th>작성하기</th><th><select><option>수정/삭제</option><option>수정</option><option>삭제</option></select></th></tr>';
	        	$('#comment-title').after(str);
	        }
		});
	});
	
	//댓글 메뉴 클릭 시
	$('.comment-menu').click(function(){
		$('#comment').removeClass('display-none');
		$('#contents').addClass('display-none');
		$('#ask').addClass('display-none');
		$('.menu-box-right').addClass('display-none');
	});

});	//레디

</script>
</head>
<div style="min-height: 1000px;">
	<div class="views-page">
		<!-- 이미지 박스 -->
		<div class="img-info">
			<div class="img-info-contents clearfix">
				<div class="img-box clearfix">
					<div class="img-box-contents">
						<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
					</div>
				</div>
				<div class="select-box">
					<div class="seller" style="margin:0;">
						<h4>${seller.name}</h4>
					</div>
					<div class="title">
						<h1>${item.title}</h1>
					</div>
					<div class="register">
						<h4>작성일</h1>
						<input readonly value="${item.time}">
					</div>
					<div class="commend">
						<h4>추천 수</h1>
						<input readonly value="${item.commend}" style="padding-left: 20px;">
					</div>		
					<div class="item-select">
						<h4>상품 선택</h4>
						<select id="item-select">
							<option value="0">상품 선택</option>
						<c:forEach var="itemOption" items="${options}">
							<option value="item_no=${itemOption.item_no}&select=${itemOption.select}">${itemOption.select}</option>
						</c:forEach>
						</select>
					</div>			
					<div class="item-option">
						<h4>세부 옵션</h4>
						<select id="option-select">
							<option value="0">세부 옵션 선택</option>
						</select>  
					</div>				
					<div class="delivery-price">
						<h4>배송비</h4>
						<h5 style="padding-left: 2px;">3000원 / 30000원 이상 구매 시 무료</h5>
					</div>
					<div class="item-price">
						<h4>가격</h4>
						<input readonly style="width: 80px;" id="item-price">원
					</div>
					<div class="item-stock">
						<h4>선택 수량</h4> 
						<input id="stock-count" placeholder="0" style="width: 80px; border: 1px solid gray; text-align: center;">
						<button id="stock-select">선택</button>
					</div>					
				</div>
			</div>
		</div>
		<!-- 옵션 텍스트 -->
		<div class="option-text">
			<div class="option-text-contents">
				<h1>선택 옵션</h1>
			</div>
		</div>
		<!-- 선택 옵션 정보 -->
		<form action="<%=request.getContextPath()%>/items/order" method="post" id="option-form">
			<input type="hidden" name="id" value="${user.id}">
			<input type="hidden" name="item_no" value="${item.no}">
			<div class="option-info">
				<div class="option-info-contents">
					<div class="info-box-last option-box clearfix">
						<h3 class="float-left" style="margin-top:15px;">결제 예상액</h3>
						<input readonly name="total_price" value="0">
					</div>
				</div>
			</div>
			<!-- 버튼 박스 -->
			<div class="button">
				<div class="button-contents clearfix">
					<a><button class="buy-button"><h4>구매하기</h4></button></a>
					<a><button type="button" id="add-bag"><h4>장바구니 담기</h4></button></a>				
					<a><button type="button" id="add-wishlist"><h4>위시리스트 담기</h4></button></a>
				</div>
			</div>
		</form>
		<!-- 메뉴 선택 박스 -->
		<div class="menu">
			<div class="menu-contents">
				<div class="menu-box clearfix">
					<div class="item-info-menu menu-box-left">
						<h2>상품 정보</h2>
					</div>
					<div class="ask-menu menu-box-left">
						<h2>문의/답변</h2>
					</div>
					<div class="comment-menu menu-box-left">
						<h2>댓글</h2>
					</div>
					<div class="menu-box-right display-none" id="ask-all">
						<h2>전체 문의 보기</h2>
					</div>
					<div class="menu-box-right display-none" id="ask-my">
						<h2>내 문의 보기</h2>
					</div>
					<div class="menu-box-right display-none" id="ask-request">
						<h2>문의하기</h2>
					</div>
					<!-- 문의 하기 창 -->
					<div class="request-contents display-none">
						<div class="request-box">
							<form action="" method="post" id="ask-form">
								<input type="hidden" name="writer" value="${user.id}">
								<input type="hidden" name="board_no" value="${item.no}">
								<div class="category clearfix">
									<h5 style="float: left; margin:0;">문의 유형</h5>
									<select id="ask-select" style="float: left;" name="category">
										<option selected value="상품문의">상품 문의</option>
										<option value="배송문의">배송 문의</option>
										<option value="교환문의">교환 문의</option>
									</select>
								</div>
								<div class="title clearfix">
									<h5>제목</h5>
									<input name="title" class="ask-title">
								</div>
								<div class="contents clearfix">
									<h5>내용</h5>
									<input name="contents" class="ask-contents">
								</div>
								<div class="button clearfix">
									<button type="button" style="float: right;" id="ask-cancel"><h4>취소</h4></button>
									<button type="button" style="float: right; margin-right: 15px;" id="ask-button"><h4>문의하기</h4></button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 선택한 메뉴의 html -->
		<div class="menu-info">
			<div class="menu-info-contents">
				<div class="menu-info-box">
					<!-- 상품 상세 정보 -->
					<div class="item-info" id="contents">
						<div class="info-box">
							<c:forEach var="files" items="${itemFiles}">
								<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${files.route}">
							</c:forEach>
						</div>
						<div class="contents-bottom">
							<div class="bottom-box">
							
							</div>
						</div>
					</div>
					<!-- 문의/답변 -->
					<div class="ask display-none" id="ask">
						<div class="ask-box">
							<!-- 검색 창 -->
							<div class="search-box clearfix">
								<div class="search-select">
									<select>
										<option>제목</option>
										<option>작성자</option>
										<option>내용</option>
									</select>
								</div>
								<div class="search-input"><input></div>
								<div class="search-img">
									<i class="fas fa-search img" style="font-size: 30px;"></i>
								</div>
							</div>
							<!-- 게시글 목록 창 -->
							<div class="board-box">
								<!-- 전체 문의 보기 -->
								<div class="board-box-contents">
									<div class="board-set ask-title1" style="border-top: 1px solid gray;" id="ask-title">
										<div class="set-top clearfix">
											<div style="width: 10%;">문의 번호</div>
											<div style="width: 10%;">문의 유형</div>
											<div style="width: 30%;">제목</div>
											<div style="width: 15%;">작성자</div>
											<div style="width: 25%;">작성일</div>
											<div style="width: 10%; border-right: none;">상태</div>
										</div>
									</div>
									<c:if test="${askList ne null}">
										<c:forEach items="${askList}" var="ask">
											<div class="board-set">
												<div class="set-top clearfix">
													<div style="width: 10%;">${ask.no}</div>
													<div style="width: 10%;">${ask.category}</div>
													<div class="ask-title" style="width: 30%;">${ask.title}</div>
													<div style="width: 15%;">${ask.writer}</div>
													<div style="width: 25%;">${ask.time}</div>
													<div class="ask-state" style="width: 10%; border-right: none;">${ask.state}</div>
												</div>
												<div class="set-bottom display-none">
													${ask.contents}
												</div>
												<div class="reply-box display-none">
												<c:forEach items="${replyList}" var="reply">
													<c:if test="${ask.no eq reply.board_no}">
														<h5>답변 내용</h5>
														${reply.contents}
													</c:if>
												</c:forEach>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<!-- 내 문의 보기 -->
								<div class="board-box-contents-my display-none">
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
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<!-- 문의 답변 창 -->	
								<c:if test="${item.seller_id eq user.id}">
									<div class="reply">
										<div class="reply-contents">
											<div class="reply-contents-box">
												<div class="reply-top clearfix">
													<h4 class="float-left">문의 번호</h4>
													<input class="float-left ml-4" name="ask_no">
												</div>
												<div class="reply-bottom">
													<h4>답변 내용</h4>
													<input name="contents" style="width: 1090px; min-height: 150px;">
												</div>
												<div class="reply-button-box clearfix">
													<input type="hidden" name="category" value="문의답변">
													<input type="hidden" name="seller_id" value="${item.seller_id}">
													<button class="float-right" style="margin-top: 20px;" id="reply-button">답변 등록/수정</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>			
							</div>
						</div>
					</div>
					<!-- 댓글 메뉴 -->
					<div class="comment display-none" id="comment">
						<div class="comment-contents">
							<!-- 댓글 게시판 -->
							<div class="comment-board">
								<table class="table">
									<tr class="table-title" id="comment-title">
										<th width="15%">작성자</th>
										<th width="40%">내용</th>
										<th width="25%">등록일</th>
										<th width="10%">답글</th>
										<th width="10%">수정/삭제</th>	
									</tr>
									<c:if test="${commentList ne null}">
										<c:forEach items="${commentList}" var="comment">
											<tr class="table-contents">
												<th>${comment.writer}</th>
												<th>${comment.contents}</th>
												<th>${comment.time}</th>
												<th>작성하기</th>										
												<th>
													<c:if test="${user.id eq comment.writer}">
														<select>
															<option>수정/삭제</option>
															<option>수정</option>
															<option>삭제</option>
														</select>
													</c:if>
												</th>
											</tr>
										</c:forEach>
									</c:if>
								</table>								
							</div>
							<!-- 댓글 등록창 -->
							<div class="comment-regiser-box">
								<input type="hidden" name="category" value="댓글">
								<input type="hidden" name="board_no" value="${item.no}">
								<div class="text-box clearfix">
									<h3 style="float: left;">내용</h3>
									<input value="" style="float: right; margin-left: 10px;" name="to">
									<h5 style="float: right;">답글 대상</h5>
								</div>
								<div class="contents-box">
									<input name="contents">
								</div>
								<div class="button-box clearfix">
									<button type="button" id="comment-add">
										<h4>등록하기</h4>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-bottom">
		<div class="bottom-contents">
			<div class="bottom-box">
			
			</div>
		</div>
	</div>
</div>
</html>