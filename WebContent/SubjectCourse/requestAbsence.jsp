<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />
<link rel="stylesheet" type="text/css" href="./evalLecture.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px>OOO님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p> 유고 결석 신청 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div class="content">
				<div>
				<div id="title">유고 결석 신청</div>
				신청 날짜 <input type="date" id="inputDate">
				강의명 <input type="text" id="lecture_num" class="drop_down">
				결석 사유 <input type="text" id="lecture_name" class="drop_down">
				
				<button id="reg_button">신청</button>
				
				
			</div>
			<div class="content_bottom_absence">
				<!-- 가져온 정보 있다면 -->
				<div class="each_content">
				<div class="each_content_front" id="getDate">입력한 날짜</div>
				<div class="each_content_content" id="registered_absence">
						
				</div>
				<button id="cancel_button">신청 취소</button>
				</div>
			<div class="each_content">
				<div class="each_content_front" id="getDate">입력한 날짜</div>
				<div class="each_content_content" id="registered_absence">
						
				</div>
				<button id="cancel_button">신청 취소</button>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>Dongguk University Web_Programming Project</p>
	</div>
</body>
</html>