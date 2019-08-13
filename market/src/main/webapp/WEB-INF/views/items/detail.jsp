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
	margin-top: 10px;
}
.select-box option{
	font-size: 30px;
}
/* 옵션 텍스트 */
/* 옵션 상세 내용 */
.option-info-contents{
	border: 1px solid gray;
	padding: 20px 0;
}
.info-box{

}
.info-box input{
	float: left;
	margin: 20px 50px 0 50px;
	border: 1px solid gray;
	text-align: center;
}
.info-box-last input{
	float: right;
	margin-right: 52px;
	text-align: center;
}
/* 버튼 박스 */
.button-contents{
	padding: 10px 0;
}
.button-contents button{
	float: right;
	margin-left: 20px;
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
	border: 1px solid gray;
	padding: 10px;
	margin-bottom: 40px;
	position: relative;
}
.item-info .info-box img{
	width: 100%;
	height: 700px;
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

</script>
</head>
<div style="min-height: 630px;">
	<div class="views-page">
		<!-- 이미지 박스 -->
		<div class="img-info">
			<div class="img-info-contents clearfix">
				<div class="img-box clearfix">
					<div class="img-box-contents">
						<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
					</div>
				</div>
				<div class="select-box">
					<div class="seller">
						<h4>판매자명</h1>
					</div>
					<div class="title">
						<h1>상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명</h1>
					</div>
					<div class="register">
						<h4>작성일</h1>
						<input readonly>
					</div>
					<div class="commend">
						<h4>추천 수</h1>
						<input readonly>
					</div>		
					<div class="item-select">
						<h4>상품 선택</h4>
						<select>
							<option>상품 선택</option>
							<option>1234567891111111111111111111111111</option>
							<option>123456789</option>
						</select>
					</div>			
					<div class="item-option">
						<h4>세부 옵션</h4>
						<select>
							<option>세부 옵션 선택</option>
							<option>12345678911111111111111111111111</option>
							<option>123456789</option>
						</select>
					</div>			
					<div class="item-stock">
						<h4>상품 재고</h4>
						<input readonly>
					</div>			
					<div class="item-price">
						<h4>가격</h4>
						<input readonly>
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
					<input readonly value="선택 옵션">
					<input readonly value="세부 옵션">
					<input readonly value="선택 수량">
					<input readonly value="가격">
				</div>
				<div class="info-box clearfix">
					<input readonly>
					<input readonly>
					<input readonly>
					<input readonly>
				</div>
				<div class="info-box clearfix">
					<input readonly>
					<input readonly>
					<input readonly>
					<input readonly>
				</div>
				<div class="info-box info-box-last clearfix">
					<input readonly value="총 상품 가격">
					<input readonly value="배송비">
					<input readonly value="총 주문 가격">
				</div>
			</div>
		</div>
		<!-- 버튼 박스 -->
		<div class="button">
			<div class="button-contents clearfix">
				<button><h4>주문하기</h4></button>
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
					<div class="item-info display-none">
						<div class="info-box">
							<img alt="" src="<%=request.getContextPath()%>/resources/images/블라우스.jpg">
							<h1>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h1>
							<img alt="" src="<%=request.getContextPath()%>/resources/images/남자 면티.jpg">
							<h1>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h1>
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
					<div class="comment">
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