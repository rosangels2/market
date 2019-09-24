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
ul{
	list-style: none;
	display: block;
}
/* 상품 리스트 */
.item-list-contents{
	min-height : 600px;
}  
.item-contents{
	margin-top: 20px;
	height: 150px;
	padding: 10px 10px;
}
.item-contents div{
	float: left;
}
.item-contents .item-img{
	width: 300px;
	height: 130px;
	margin-right: 50px;	
}
.item-contents .item-info{
	width: 180px;
	height: 130px;
	position: relative;
}
.item-info button{
	width: 150px;
	text-align: center;
	font-size: 30px;
}
.item-info div{
	text-align: center;
	height: calc( 100% / 2 );
	width: 100%;
	padding-top: 15px;
}
.item-info h3{
	margin: 0;
}
.item-link a{
	color: black;
}
.item-img img{
	width: 300px;
	height: 130px;
}
.item-info-last{
	float: right;
}
/* 더보기 버튼 */
.more-img-box{
	margin-top: 50px;
	height: 60px;
}
.more-img-box .more-img{
	font-size: 60px;
	left: 500px;
}
/* 하단 페이지 */
.bottom-contents{
	height: 200px;
}
select, input{
	border-radius: 5pt;
}
</style>
<script type="text/javascript">
$(document).ready(function(){	
	
	//삭제 버튼 클릭 시
	$('.delete-button').click(function(){
		var s = confirm('정말로 삭제하시겠습니까?');
		var box = $(this).parents('.item-contents');
		if(!s){
			return;
		}else{
			var id = $('input[name=id]').val();
			var item_no = $(this).siblings('input[name=item_no]').val();
			$.ajax({ 
		        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{"seller_id": id, "no": item_no},
		        url:"<%=request.getContextPath()%>/items/deleteItem",
		        dataType:"json",
		        //contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
		        	if(data){
		        		box.remove();
		        		alert("상품이 삭제 되었습니다.");
		        	}else{
		        		alert("요청이 실패하였습니다.");	
		        	}
		        }
		  });
		}
	});
	
	//수정 버튼 클릭 시
	$('.modify-button').click(function(){
		
	});
	
});	//레디
</script>
</head>
	<div style="min-height: 1000px; position: relative;">
		<div class="views-page">
			<!-- 상품 목록창 -->
			<div class="item-list">
				<div class="item-list-contents">
					<input type="hidden" name="id" value="${user.id}">
					<c:forEach items="${itemList}" var="item">
						<div class="item-contents clearfix">
							<div class="item-img">
								<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
									<img alt="" src="<%=request.getContextPath()%>/resources/uploadFiles${item.file}">
								</a>
							</div>
							<div class="item-info">
								<div><h3>상품명</h3></div>
								<div class="item-link">
									<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
										<h3>${item.title}</h3>
									</a>
								</div>
							</div>
							<div class="item-info">
								<div><h3>가격</h3></div>
								<div class="item-link">
									<a href="<%=request.getContextPath()%>/items/detail?item_no=${item.no}">
										<h3>${item.price}</h3>
									</a>
								</div>					
							</div>
							<div class="item-info" style="float: right">
								<div>
									<a href="<%=request.getContextPath()%>/items/modify?item_no=${item.no}&id=${user.id}">
										<button class="modify-button" style="border: none; background-color: white;">수정</button>
									</a>
									<input type="hidden" name="item_no" value="${item.no}">
								</div>
								<div style="border-top:1px solid gray;">
									<button class="delete-button" style="border: none; background-color: white;">삭제</button>
									<input type="hidden" name="item_no" value="${item.no}">
								</div>		
							</div>
						</div>	
					</c:forEach>																			
				</div>
			</div>		
			<div class="page-bottom">
				<div class="bottom-contents">
					
				</div>
			</div>
		</div>
	</div>
</html>
