<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.contents-box{
	padding: 30px 0;
}
.menu-box{
	min-height: 1000px;
	width: 200px;
}
.display-box{
	width: 900px;
	min-height: 1000px
}
.menu-contents{
	text-align: center;
	margin: 10px 0;
	border: 1px solid gray;
	padding: 10px 0;
}
.bottom-box{
	min-height: 100px;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 1000px;">
	<div class="contents">
		<div class="contents-box clearfix">
			<!-- 메뉴 -->
			<div class="menu-box float-left">
				<div class="menu-contents">
					<h5>판매자 신청 보기</h5>
				</div>
			</div>
			<!-- 신청 내용 -->
			<div class="display-box float-left">
				<div class="display-contents">
					<div class="seller-request display-none">
						<div class="seller-request-contents">
							<div class="container offset-2 col-8 signup-box">
								<div class="offset-3"> <h1>판매자 신청</h1></div>
								<div class="form-group">
								<label for="id">ID</label><br>
									<input type="text" class="form-control col-6 float-left" id="id" style="display: inline-block;" placeholder="ID" name="id" readonly>
									<label id="id-error" class="offset-4 col-7" for="id"></label>
								</div>
								<div class="form-group">
								<label for="licensee">licensee</label><br>
									<input type="text" class="form-control col-6 float-left" id="licensee" style="display: inline-block;" placeholder="licensee" name="licensee">
									<label id="id-error" class="offset-4 col-7" for="licensee"></label>
								</div>								
								<div class="form-group">
									<label for="pw">password</label>
									<input type="password" class="form-control col-7" id="pw" placeholder="password" name="pw">
								</div>
								<div class="form-group">
									<label for="name">name</label>
									<input type="text" class="form-control col-6" id="name" placeholder="name" name="name">
								</div>								
								<div class="form-group">
									<label for="email">email</label>
									<input type="text" class="form-control" id="email" placeholder="email" name="email">
								</div>
								<div class="form-group">
									<label for="phone">phone</label>
									<input type="text" class="form-control" id="phone" placeholder="phone" name="phone">
								</div>
								<div class="form-group">
									<label for="bank">bank</label>
									<input type="text" class="form-control" id="bank" placeholder="bank" name="bank">
								</div>
								<div class="form-group">
									<label for="account">account</label>
									<input type="text" class="form-control" id="account" placeholder="account" name="account">
								</div>
								<div class="form-group">
									<label for="address">address</label>
									<input type="text" class="form-control" id="address" placeholder="address" name="address">
								</div>
								<div class="form-group">
									<label for="business-address">business-address</label>
									<input type="text" class="form-control" id="business-address" placeholder="business-address" name="business-address">
								</div>																
								<button type="button" class="btn btn-dark float-right" style="margin-right: 0; margin-bottom: 20px;" id="ok" name="ok">수락하기</button>							
							</div>						
						</div>
					</div>					
				</div>
			</div>
		</div>
		<div class="bottom-box">
			<div class="bottom-contents">
			
			</div>
		</div>
	</div>
</div>
</html>