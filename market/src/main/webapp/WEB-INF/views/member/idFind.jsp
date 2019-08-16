<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.form button{
	margin-top: 15px;
}
</style>
</head>
<div style="min-height: 1000px;">
	<div class="container offset-4 col-4">
		<div class="offset-3"> <h1>Find ID</h1></div>
		<form method="post" action="" clfass="form">
			<div class="form-group">
				<label for="name">name</label>
				<input type="text" class="form-control" id="name" placeholder="name" name="name">
			</div>
			<div class="form-group">
				<label for="pwd">email</label>
				<input type="email" class="form-control" id="email" placeholder="email" name="email">
			</div>
			<button type="button" class="btn btn-dark float-right">Find</button>
		</form>
	</div>
</div>
</html>