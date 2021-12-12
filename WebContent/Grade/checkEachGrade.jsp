<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	String name = (String)session.getAttribute("name");
%>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./grade.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p> 평가항목별 성적 조회 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<div class="content_top">
			<form method="GET" action="checkEachGrade_verify.jsp">
				<div id="title_each_grade">학기 선택</div>
				<button type="submit" id="reg_button">조회</button>
				년도
				<select name="year" class="drop_down">
					<option  value="default">-- 년도 --</option>
						<% 
						Date date = new Date(); 
						SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy");
						Calendar cal = Calendar.getInstance();
						cal.setTime(date);
						String endDate=simpleDate.format(date);
						
						cal.add(Calendar.YEAR, -10);
						String startDate=simpleDate.format(cal.getTime());
						
						for(int i=0;i<11;i++){ %>
						<option value=<%=simpleDate.format(cal.getTime())%> id="select_year"><%=simpleDate.format(cal.getTime()) %></option>
						<% cal.add(Calendar.YEAR, 1);
						} 
						%>
					
				</select>
				<select name="semester_each_grade" class="drop_down">
					<option value="default">-- 선택 --</option>
					<option value="1" id="semester1">1학기</option>
					<option value="2" id="semester2">2학기</option>
				</select>
			</form>	
			</div>	
			<div class="content_bottom">
				<h2 align=center> 년도와 학기를 검색해주세요</h2>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>