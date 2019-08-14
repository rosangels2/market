<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.signup-box{
	border : 1px solid black;
}
</style>
</head>
	<div class="row m-5" style="min-height: 630px;">
		<div class="container offset-3 col-6 signup-box">
			<div class="offset-4"> <h1>Signup</h1></div>
			<form method="post" action="<%=request.getContextPath()%>/signup" id="signup">
				<div class="form-group">
				<label for="usr">ID</label><br>
					<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" placeholder="ID" name="id">
					<button type="button" class="btn btn-dark col-4 float-right" id="dup">Check</button>
					<label id="id-error" class="offset-4 col-7" for="id"></label>
				</div>
				<div class="form-group">
					<label for="pw">password</label>
					<input type="password" class="form-control col-7" id="pw" placeholder="password" name="pw">
				</div>
				<div class="form-group">
					<label for="pw1">password confirm</label>
					<input type="password" class="form-control col-7" id="pw1" placeholder="password confirm" name="pw1">
				</div>
				<div class="form-group">
					<label for="email">email</label>
					<input type="text" class="form-control" id="email" placeholder="email" name="email">
				</div>
				<div class="form-group">
					<label for="name">name</label>
					<input type="text" class="form-control col-6" id="name" placeholder="name" name="name">
				</div>
				<div class="form-group">
					<label for="phone">phone</label>
					<input type="text" class="form-control" id="phone" placeholder="phone" name="phone">
				</div>
				<div class="form-group">
					<label for="address">address</label>
					<input type="text" class="form-control" id="address" placeholder="address" name="address">
				</div>
				<button type="button" class="btn btn-dark float-right" id="cancel" name="cancel">취소</button>
				<button type="button" class="btn btn-dark float-right" style="margin-right: 15px; margin-bottom: 20px;" id="ok" name="ok">입력완료</button>
			</form>
		</div>
	</div>
</html>