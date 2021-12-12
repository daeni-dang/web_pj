<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 및 교수 등록</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./leave_return.css" />
<%
	String name = (String)session.getAttribute("name");
	String id =session.getAttribute("id").toString();
%>
</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
        	<p>학생 및 교수 등록</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_ad.jsp" %>
		<div id="content">
			<div id="title_leave_return">학생 등록</div>
			<div class="content_top_reg">
			<form method="post" action="saveRequestSt.jsp">
				 이름<input type="text" name="name">
				 부여할 학번<input type="text" name="st_num">
				 생년월일<input type="date" name="birth"><br>
				 학년<input type="text" name="grade_st">
				 학기<input type="text" name="semester">
				 이메일<input type="text" name="email"><br>
				 휴대전화<input type="text" name="phone">
				 주소<input type="text" name="address"><br>
				 전공<input type="text" name="major_st">
				 비밀번호<input type="text" name="password">
				 <input type="submit" value="등록">
			</form>
			</div>	
			<div id="title_leave_return">교수 등록</div>
			<div class="content_top_reg">
			<form method="post" action="saveRequestPro.jsp">
				 이름<input type="text" name="pro_name">
				 부여할 교번<input type="text" name="pro_num">
				 생년월일<input type="date" name="pro_birth"><br>
				 연구실<input type="text" name="pro_office">
				 이메일<input type="text" name="pro_email"><br>
				 휴대전화<input type="text" name="pro_phone">
				 주소<input type="text" name="pro_address"><br>
				 전공<input type="text" name="pro_major">
				 비밀번호<input type="text" name="pro_password">
				 <input type="submit" value="등록">
			</form>
			</div>	
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>