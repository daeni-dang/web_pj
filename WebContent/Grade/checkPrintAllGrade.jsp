<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./grade.css" />
<%
	String name = (String)session.getAttribute("name");
%>
</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p>전체 성적 조회 및 출력 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
				<div id="title_grade">
					<div class="each_content">
						<!-- 받아올 학기 --> 2021년 2학기
			    	</div>
				</div>
				<div id="all_grade_content">
					<div class="all_info">
			    		전체 평점 평균
			   		</div>
			   		<button id="grade_button">조회</button>
			   		<button id="grade_button">출력</button>
			   </div>
			   <div id="all_grade_content">
					<div class="all_info">
			    		전체 과목별 성적
			   		</div>
			   		<button id="grade_button">조회</button>
			   		<button id="grade_button">출력</button>
			   </div>
			   <div id="all_grade_content">
					<div class="all_info">
			    		지난 학기 과목별 성적
			   		</div>
			   		<button id="grade_button">조회</button>
			   		<button id="grade_button">출력</button>
			   </div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>