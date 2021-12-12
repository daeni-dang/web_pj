<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body>
	<div>
		<h1>로그인</h1>
		<hr>
		<div>
			<form action="Login_verify.jsp">
				<label class="text_uname"><b>ID : </b></label> 
				<input type="text" placeholder="아이디를 입력하세요" name="id" required> 
				<br>
				<label class="text_uname"><b>Password : </b></label> 
				<input type="password" placeholder="비밀번호를 입력하세요" name="pw" required> 
				<br>
				<input type="submit" value="Login">
			</form>
		</div>
	</div>
</body>
</html>