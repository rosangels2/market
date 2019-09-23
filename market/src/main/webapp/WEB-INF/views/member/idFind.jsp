<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.form button{
	margin-top: 15px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#find').click(function(){
		var name = $('#name').val();
		var email = $('#email').val();
		 $.ajax({
		        async:false,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:{'name':name , 'email':email},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/idFind",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data.id != null){
						alert("검색된 아이디 : " + data.id);
					}else{
						alert("검색된 아이디가 없습니다.");
					}
		       },
		       error:function(request,status,error){
		           console.log(request.responseText); // 실패 시 처리
	          }
		    });
	});
});	//레디
</script>
</head>
<div style="min-height: 605px;">
	<div class="container offset-4 col-4" style="margin-top: 50px;">
		<div class="offset-3"> <h1>Find ID</h1></div>
		<form method="post" action="" clfass="form clearfix">
			<div class="form-group">
				<label for="name">name</label>
				<input type="text" class="form-control" id="name" placeholder="name" name="name">
			</div>
			<div class="form-group">
				<label for="pwd">email</label>
				<input type="email" class="form-control" id="email" placeholder="email" name="email">
			</div>
			<button type="button" class="btn btn-dark float-right" id="find">Find</button>
			<a href="<%=request.getContextPath()%>/passwordFind">
				<button type="button" class="btn btn-dark float-left" style="margin-right: 15px;">Find Password</button>
			</a>
			<a href="<%=request.getContextPath()%>/signin">
				<button type="button" class="btn btn-dark float-left" style="margin-right: 15px;">signin</button>
			</a>
		</form>
	</div>
</div>
</html>