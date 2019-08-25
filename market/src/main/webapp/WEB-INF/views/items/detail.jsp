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
	margin: 20px 40px 0 37px;
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
.menu-box{
	margin: 20px 0 0 0;
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
	/* 문의 선택 메뉴 숨김 */
	display: none;
}
.menu-box h2{
	margin: 0;
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
.search-box{
	
}
.search-box div{
	float: left;
}
/* 댓글창 */
.comment-regiser-box{
	margin-top: 20px;
	padding-top: 20px;
	border-top: 1px solid gray; 
}
.comment-regiser-box .contents-box{
	min-height: 150px;
	border: 1px solid gray;
	margin-bottom: 10px;
}
.comment-regiser-box .button-box button{
	float: right;
}


/* 공통 적용 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
var data2;
$(document).ready(function(){
	
	addOptionEvent();
	
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
			        	date2 = data.oVo;
			        	 console.log(data.oVo);
			        	 var str = "";
			        	 str += '<option>세부 옵션 선택</option>';
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
					$('#item-price').val(data.price);
		        	$('#select-hidden').val(data.select);
		        	$('#detail-hidden').val(data.detail);
		        	$('#count-hidden').val($('#stock-count').val());
		        	$('#price-hidden').val(data.price);
		        }
		  });
	});

});	//레디
function addOptionEvent(){
	$('#stock-select').click(function(){
		if($('#stock-count').val() < 1){
			return;
		}
		var str = '<div class="info-box clearfix"><input readonly value="select" placeholder="선택 옵션"><input readonly value="detail" placeholder="세부 옵션"><input readonly value="count" placeholder="선택 수량"><input readonly name="price" placeholder="가격"></div>';
		$('.info-box-last').before(str);
		$('.info-box input[name=select]').last().val(${selectOption.select});
		$('.info-box input[name=detail]').last().val(${selectOption.detail});
		$('.info-box input[name=stock]').last().val(${selectOption.stock});
		$('.info-box input[name=price]').last().val(${selectOption.price});
	});
};
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
							<option>세부 옵션 선택</option>
						</select>  
					</div>				
					<div class="item-price">
						<h4>가격</h4>
						<input readonly value="" style="width: 80px;" id="item-price">원
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
		<div class="option-info">
			<div class="option-info-contents">
				<div class="info-box clearfix">
					<input type="hidden" id="select-hidden">
					<input type="hidden" id="detail-hidden">
					<input type="hidden" id="count-hidden">
					<input type="hidden" id="price-hidden">
				</div>
				<div class="info-box-last clearfix">
					<h3 class="float-left" style="margin-top:15px;">결제 예상액</h3>
					<input readonly value="최종 주문 가격" style="margin-right: 54px;">
					<input readonly value="배송비">
					<input readonly value="총 상품 가격">
				</div>
			</div>
		</div>
		<!-- 버튼 박스 -->
		<div class="button">
			<div class="button-contents clearfix">
				<a href="<%=request.getContextPath()%>/items/order"><button class="buy-button"><h4>구매하기</h4></button></a>
				<button><h4>장바구니 담기</h4></button>				
				<button><h4>위시리스트 담기</h4></button>
			</div>
		</div>
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
					<div class="menu-box-right">
						<h2>전체 문의 보기</h2>
					</div>
					<div class="menu-box-right">
						<h2>내 문의 보기</h2>
					</div>
					<div class="menu-box-right">
						<h2>문의하기</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- 선택한 메뉴의 html -->
		<div class="menu-info">
			<div class="menu-info-contents">
				<div class="menu-info-box">
					<!-- 상품 상세 정보 -->
					<div class="item-info">
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
					<div class="ask display-none">
						<div class="ask-box">
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
							<div class="board-box">
								<table class="table">
									<tr>
										<th width="10%">번호</th>		<!-- width를 통해 가로를 지정 -->
										<th width="20%">문의 종류</th>
										<th width="20%">제목</th>
										<th width="20%">작성자</th>
										<th width="10%">등록일</th>
										<th width="10%">답변 상태</th>	
									</tr>
									<tr>
										<th>1</th>	<!-- list의 값이 추가된 변수 board의 getter 호출 -->
										<th>교환</th>
										<th>문의</th>
										<th>roasdlldal</th>
										<th>2019-09-02</th>
										<th>답변 대기</th>
									</tr>
									<tr>
										<th>1</th>	<!-- list의 값이 추가된 변수 board의 getter 호출 -->
										<th>교환</th>
										<th>문의</th>
										<th>roasdlldal</th>
										<th>2019-09-02</th>
										<th>답변 대기</th>
									</tr>
									<tr>
										<th>1</th>	<!-- list의 값이 추가된 변수 board의 getter 호출 -->
										<th>교환</th>
										<th>문의</th>
										<th>roasdlldal</th>
										<th>2019-09-02</th>
										<th>답변 대기</th>
									</tr>
								</table>							
							</div>
						</div>
					</div>
					<!-- 댓글 -->
					<div class="comment display-none">
						<div class="comment-contents">
							<!-- 댓글 게시판 -->
							<div class="comment-board">
								<table class="table">
									<tr>
										<th width="20%">작성자</th>
										<th width="40%">내용</th>
										<th width="15%">등록일</th>
										<th width="10%">답글</th>
										<th width="10%">수정/삭제</th>	
									</tr>
									<tr>
										<th>sdfsadfs</th>
										<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
										<th>2019-09-02</th>
										<th>작성하기</th>										
										<th>
											<select>
												<option>수정/삭제</option>
												<option>수정</option>
												<option>삭제</option>
											</select>
										</th>
									</tr>
									<tr>
										<th>asdfsaf</th>
										<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
										<th>2019-09-02</th>
										<th>작성하기</th>		
										<th>
											<select>
												<option>수정/삭제</option>
												<option>수정</option>
												<option>삭제</option>
											</select>
										</th>
									</tr>
									<tr>
										<th>safdasdfsd</th>
										<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
										<th>2019-09-02</th>
										<th>작성하기</th>		
										<th>
											<select>
												<option>수정/삭제</option>
												<option>수정</option>
												<option>삭제</option>
											</select>
										</th>
									</tr>
								</table>								
							</div>
							<!-- 댓글 등록창 -->
							<div class="comment-regiser-box">
								<div class="text-box clearfix">
									<h3 style="float: left;">내용</h3>
									<input readonly value="asdlalffdfd" style="float: right; margin-left: 10px;">
									<h5 style="float: right;">댓글 대상</h5>
								</div>
								<div class="contents-box">
									<h5>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h5>
								</div>
								<div class="button-box clearfix">
									<button>
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
</div>
</html>