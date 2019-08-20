<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.id-box{
	margin: 0;
}
#id-check{
margin-bottom: 20px;
}
</style>
<script type="text/javascript">

var isChecked = -1;

$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "가입 양식에 맞게 입력해 주세요."
);

$(document).ready(function(){
	$('#signup').submit(function(){
		var test = $('form').valid();
		if(!test){
			alert("가입 양식에 맞지 않습니다.");
			return false;
		}
		if(isChecked == -1){
			alert("아이디 중복 확인을 해주세요.");
			return false;
		}else if(isChecked == 0){
			alert("이미 가입된 아이디입니다.");
			return false;
		}
		alert("회원가입을 진행합니다.");
		isChecked = -1;
		return true;
		
	});
	$('#id').change(function(){
		 var id = $('input[name=id]').val();	//data를 통해 넘겨줄 매개변수에 저장할 값을 입력
		 var test = $("#id").valid();
		 console.log("test : " + test);
		 if(!test){
			 isChecked = -1;
			 $('#id-check').text("");
			 return;
		 }
		 $.ajax({
		        async:false,	//비동기화(동시 작업 처리)	async:false : 동기화(순차적 작업 처리) 
		        type:'POST',	//POST방식으로 전송
		        data:id,	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
		        url:"<%=request.getContextPath()%>/dup",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
					if(data){
						isChecked = 1;	/* 회원가입 가능 */
						$('#id-check').text("");
					}else{
						isChecked = 0;	/* 회원가입 불가능 */
						$('#id-check').text("이미 가입된 아이디입니다.");
					}
		       }
		    });
		});
	
		$("form").validate({	
		        rules: {
		            id: {
		                required : true,	//필수 항목인지 여부
		                minlength : 8,
		                maxlength : 12,
		                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/	//영문 또는 숫자만 사용 가능하며 각각 1개 이상 사용
		            },
		            password: {
		                required : true,
		                minlength : 8,
		                maxlength : 12,
		                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/	//영문 또는 숫자만 사용 가능하며 각각 1개 이상 사용
		            },
		            password1: {
		                required : true,
		                equalTo : password
		            },
		            email: {
		                required : true,
		                email : true	//email 형식에 맞는지 여부
		            }
		        },
		        messages : {	//규칙체크 실패시 출력될 메시지
		            id: {
		                required : "필수로 입력하세요",
		                minlength : "아이디는 최소 {8}글자 이상으로 입력해야 합니다",
		                maxlength : "아이디는 최대 {12}글자 이하로 입력해야 합니다",
		                regex : "영문 또는 숫자를 각각 1개 이상 사용해야 합니다"
		            },
		            password: {
		                required : "필수로 입력하세요",
		                minlength : "최소 {8}글자 이상이어야 합니다",
		                maxlength : "최대 {12}글자 이하여야 합니다",
		                regex : "영문 또는 숫자를 각각 1개 이상 사용해야 합니다"
		            },
		            password1: {
		                required : "필수로 입력하세요",
		                equalTo : "비밀번호와 비밀번호 확인이 일치하지 않습니다."
		            },
		            email: {
		                required : "필수로 입력하세요",
		                email : "메일 규칙에 어긋납니다"
		            }
		        }
		});
		
});	//레디
</script> 
</head>
	<div class="row m-5" style="min-height: 1000px;">
		<div class="container offset-3 col-6 signup-box">
			<div class="offset-4 mb-4">
				<h1>Signup</h1>
			</div> 
			<form method="post" action="<%=request.getContextPath()%>/signup" id="signup">
				<div class="form-group clearfix id-box">
					<div class="clearfix">
						<label for="id">*ID</label>
					</div>
					<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" placeholder="ID" name="id"><br>
				</div>
				<div id="id-check"></div>
				<div class="form-group clearfix">
					<label for="password">*password</label>
					<input type="password" class="form-control col-7" id="password" placeholder="password" name="password">
				</div>
				<div class="form-group clearfix">
					<label for="password1">*password confirm</label>
					<input type="password" class="form-control col-7" id="password1" placeholder="password confirm">
				</div>
				<div class="form-group clearfix">
					<label for="email">*email</label>
					<input type="email" class="form-control" id="email" placeholder="email" name="email">
				</div>
				<div class="form-group clearfix">
					<label for="name">name</label>
					<input type="text" class="form-control col-6" id="name" placeholder="name" name="name">
				</div>
				<div class="form-group clearfix">
					<label for="phone clearfix">phone</label>
					<input type="text" class="form-control" id="phone" placeholder="010-0000-0000" name="phone">
				</div>
				<div class="form-group clearfix">
					<label for="address">address</label>
					<input type="text" class="form-control" id="address" placeholder="address" name="address">
				</div>
				<div class="form-group clearfix">
					<label for="bank">bank</label>
					<input type="text" class="form-control" id="bank" placeholder="bank" name="bank">
				</div>
				<div class="form-group clearfix">
					<label for="account">account</label>
					<input type="text" class="form-control" id="account" placeholder="account" name="account">
				</div>
				<button type="button" class="btn btn-dark float-right mt-5 mb-0" id="cancel" name="cancel">
					<a href="<%=request.getContextPath()%>/" style="text-decoration: none; color:white;">취소</a>
				</button>
				<button class="btn btn-dark float-right mt-5 mb-0" style="margin-right: 15px; margin-bottom: 20px;" id="ok" name="ok">입력완료</button>
			</form>
		</div>
	</div>
</html>