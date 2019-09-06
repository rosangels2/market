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
.img-info{
	margin-top: 50px;
}
.img-box{
	float: left;
	width: 59%;
	min-height: 600px;
	border: 1px solid gray;
}
.img-box-contents{
	position: relative;
}
.img-box-contents img{
	width: 652px;
	height: 670px;
}

.input-box{
	float: right;
	width: 40%;
	min-height: 600px;
}
.input-box div{
	margin-top: 10px;
}
.input-box input{
	width: 400px; 
	font-size: 25px;
}
.item-category select{
	font-size: 30px;
	width: 350px;
}
.add-option{
	padding: 10px 45px 10px 0;
}
.add-button{
	float: right;
	font-size: 25px;
}

/* 옵션 텍스트 */

/* 옵션 상세 내용 */
.option-info-contents{
	border: 1px solid gray;
	padding: 20px 0 40px 0;
}
.info-box input{
	float: left;
	margin: 20px 40px 0 40px;
	border: 1px solid gray;
	text-align: center;
}
.info-box img{
	margin-bottom: 20px;
}
.option-delete{
	margin: 20px 20px 0 0;
}
/* 상품 정보*/
.contents-text,
.option-text-contents{
	margin: 50px 0 0 0;
}
.menu-info-box{
	min-height: 200px;
	padding: 30px;
	margin-bottom: 40px;
	position: relative;
}
.item-info .info-box img{
	width: 100%;
	height: 700px;
}
.button-box{
	margin-top: 50px;
}
.button-box button{
	float: right;
	text-align: center;
	width: 200px;
	padding: 5px;
}

/* 하단 박스 */
.bottom-box{
	min-height: 100px;
}
/* 공통 적용 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	addOptionEvent();
	addInputEvent();
	
	//옵션 삭제 클릭 시
	$('.option-delete').click(function(){
		$(this).parent().remove();
	});
});	//레디
function addOptionEvent(){
	$('#add-option').click(function(){
		var str = '<div class="info-box clearfix"><input placeholder="선택 옵션" name="select" readonly><input placeholder="세부 옵션" name="detail" readonly><input placeholder="상품 재고" name="stock" readonly><input placeholder="가격" name="price" readonly></div>'
		$('.option-info-contents').append(str);
		$('input[name=select]').last().val($('#item-select').val());
		$('input[name=detail]').last().val($('#item-detail').val());
		$('input[name=stock]').last().val($('#item-stock').val());
		$('input[name=price]').last().val($('#item-price').val());
		$('#item-select').val("");
		$('#item-detail').val("");
		$('#item-stock').val("");
		$('#item-price').val("");
	});
}
function addInputEvent(){
	$('input[name=file2]').change(function(){
		var str = '<input type="file" class="form-control" name="file2" value="">';
		$(this).after(str);
		addInputEvent();
	});
}
</script>
</head>
<div style="min-height: 1000px;">
	<div class="views-page">
		<input type="hidden" name="item_no" value="${item.no}">
		<form method="post" action="<%=request.getContextPath()%>/items/register" enctype="multipart/form-data">
			<!-- 이미지 박스 -->
			<div class="img-info">
				<div class="img-info-contents clearfix">
					<div class="img-box">
						<div class="img-box-contents">
							<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
						</div>
					</div>
					<div class="input-box">
						<div class="item-category" style="margin-top: 0;">
							<h4>카테고리</h4>
							<select>
								<option>카테고리</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
						<!-- 작성자 ID 전송 -->
						<div class="display-none">
							<h4>작성자 아이디</h4>
							<input type="hidden" name="seller_id" value="${user.id}">
						</div>
						<div class="item-title">
							<h4>상품 제목</h4>
							<input name="title" value="${item.title}">
						</div>
						<div class="item-price1">
							<h4>대표 상품 가격</h4>
							<input name="price1" value="${item.price}">
						</div>
						<div class="item-select">
							<h4>상품 옵션</h4>
							<input id="item-select">
						</div>			
						<div class="item-detail">
							<h4>상품 세부 옵션</h4>
							<input id="item-detail">
						</div>			
						<div class="item-stock">
							<h4>상품 재고</h4>
							<input id="item-stock">
						</div>			
						<div class="item-price">
							<h4>가격</h4>
							<input id="item-price">
						</div>		
						<div class="add-option clearfix">
							<button type="button" class="add-button" id="add-option">옵션 추가</button>
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
				  <c:forEach items="${optionList}" var="option">
					  	<div class="info-box clearfix">
					  		<input type="hidden" name="no" value="${option.no}"> 
					  		<input placeholder="선택 옵션" name="select" readonly value="${option.select}">
					  		<input placeholder="세부 옵션" name="detail" readonly value="${option.detail}">
					  		<input placeholder="상품 재고" name="stock" readonly value="${option.stock}">
					  		<input placeholder="가격" name="price" readonly value="${option.price}">
					  		<button class="float-right option-delete">삭제</button>
					  	</div>
					</c:forEach>
				</div>
			</div>
			<!-- 메뉴 선택 박스 -->
			<div class="contents-text">
				<h2>내용</h2>
			</div>
			<!-- 선택한 메뉴의 html -->
			<div class="menu-info">
				<div class="menu-info-contents">
					<div class="menu-info-box">
						<!-- 상품 상세 정보 -->
						<div class="item-info">
							<div class="info-box">
								<c:forEach items="${fileList}" var="file">
									<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${file.route}">
								</c:forEach>
							</div>
						</div>
						<div class="contents-bottom">
							<div class="bottom-box">
							
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
			  <label style="font-size:30px;">첨부파일</label>
			  <c:forEach items="${fileList}" var="file">
			  	<div class="file-box">
			  		<input name="file" value="${file.fileName}">
			  		<input type="hidden" name="file_route" value="${file.route}">
			  		<input type="hidden" name="file_no" value="${file.no}">
			  	</div>
			  </c:forEach>
			  <input type="file" class="form-control" name="file2" value="${file.fileName}">
			</div>		
			<div class="button-box clearfix">
				<button><h3>등록하기</h3></button>
			</div>
			<div class="bottom-box">
				<div class="bottom-contents">
				
				</div>
			</div>
		</form>
	</div>
</div>
</html>