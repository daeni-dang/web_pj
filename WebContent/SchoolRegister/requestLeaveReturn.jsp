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
<link rel="stylesheet" type="text/css" href="./leave_return.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px>OOO님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p>휴/복학 신청 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div class="content_top">
				<div id="title_leave_return">휴/복학 신청</div>
				<select id="leave_or_return" class="drop_down">
					<option value="default">-- 선택 --</option>
					<option value="leave" id="leave">휴학</option>
					<option value="return" id="return">복학</option>
				</select>
				<select id="year" class="drop_down">
					<% 
						Date date = new Date(); 
						SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy");
						Calendar cal = Calendar.getInstance();
						cal.setTime(date);
						cal.add(Calendar.YEAR, 1);
						simpleDate.format(cal.getTime());
					%>
					<!-- 등록한  -->
					<option value="current" id="current_year"><%= simpleDate.format(date)%></option>
					<option value="next" id="next_year"><%= simpleDate.format(cal.getTime())%></option>
				</select>
				<select id="semester" class="drop_down">
					<option value="default">-- 선택 --</option>
					<option value="1" id="sem1">1학기</option>
					<option value="2" id="sem2">2학기</option>
				</select>
				<select id="kind" class="drop_down">
					<option value="default">-- 선택 --</option>
					<option value="general" id="general">일반 휴학</option>
					<option value="military" id="military">군휴학</option>
				</select>
				<button id="reg_button">신청</button>
			</div>
			<div class="content_bottom">
				<div id="title_leave_return">휴/복학 신청 내역</div>
				<!-- 가져온 정보 null인지 확인 -->
				
				<!-- 가져온 정보 있다면 -->
				<div class="each_content">
					<div class="each_content_title">
						휴학
					</div>
					<div class="each_content_content">
						2022 1학기
					</div>
					<!-- 승인중 버튼 -->
					<div class="accepting">승인중</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
	
	<!-- 승인완료 버튼 -->
	<!-- <div class="accept">승인완료</div>-->
	<!-- 승인중 버튼 -->
	<!-- <div class="reject">승인거절</div> -->
</body>
</html>