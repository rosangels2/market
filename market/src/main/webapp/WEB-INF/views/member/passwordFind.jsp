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
	$('input[name=id]').focus();
	$('#findBtn').click(function(){
		var id = $('input[name=id]').val();		//인풋창에 입력받은 값을 저장
		var email = $('input[name=email]').val();
		$.ajax({
        async:true,	//true(동기화) : ajax가 실행되고 나서 다른 작업을 실행, false(비동기화) : 동시에 두 작업을 처리
        type:'POST',
        data:{'id':id, 'email': email},		//매개변수로 컨트롤러에 변수값을 전송
        url:"<%=request.getContextPath()%>/checkemail",
        dataType:"json",
        contentType:"application/json; charset=UTF-8",
        success : function(data){
            if(data.isOk){		//입력한 id와 email이 회원 정보와 일치하면
            	$('#findForm').submit();	//form태그의 정보 전송 기능을 실행
            }else{	//입력한 id와 email이 회원 정보와 일치하지 않으면
            	alert('일치하는 정보가 없습니다.');		//정보가 일치하지 않음을 알리고 form태그의 정보를 전송하지 않는다
            }
      	  }
   		});
	});
	
}); //레디
</script>
</head>
<div style="min-height: 1000px;">
	<div class="container offset-4 col-4">
		<div class="offset-2"> <h1>Find Password</h1></div>
		<form method="post" action="<%=request.getContextPath()%>/password/send" id="findForm">
			<div class="form-group">
				<label for="id">ID</label>
				<input type="text" class="form-control" id="id" placeholder="ID" name="id">
			</div>
			<div class="form-group">
				<label for="email">email</label>
				<input type="email" class="form-control" id="email" placeholder="email" name="email">
			</div>
			<button type="button" class="btn btn-dark float-right" id="findBtn">Find</button>
		</form>
	</div>
</div>
</html>