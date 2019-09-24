<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.form button{
	margin-top: 15px;
}
select, input{
	border-radius: 5pt;
}
</style>
</head>
<div style="min-height: 605px;">
	<div class="container offset-4 col-4" style="margin-top: 50px;">
		<div class="offset-3"> <h1>Signin</h1></div>
		<form method="post" action="" class="form clearfix">
			<div class="form-group">
				<label for="id">ID</label>
				<input type="text" class="form-control" id="id" placeholder="ID" name="id">
			</div>
			<div class="form-group">
				<label for="password">password</label>
				<input type="password" class="form-control" id="password" placeholder="password" name="password">
			</div>
			<button class="btn btn-dark float-right">Signin</button>
			<a href="<%=request.getContextPath()%>/idFind">
				<button type="button" class="btn btn-dark float-left" style="margin-right: 15px;">Find ID</button>
			</a>
			<a href="<%=request.getContextPath()%>/passwordFind">
				<button type="button" class="btn btn-dark float-left" style="margin-right: 15px;">Find Password</button>
			</a>
		</form>
	</div>
</div>
</html>