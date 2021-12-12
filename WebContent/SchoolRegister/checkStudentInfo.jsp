<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./info.css" />

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
			<p>개인 정보 조회 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div class="inner_content">
			<div class="inner_content_left">
				<div class="inner_image_top">
					<!-- 사진 들어가는 공간 -->
				</div>
				<div class="inner_image_bottom">
				<button id="change_image_btn">사진 변경</button>
				</div>
			</div>
			<div class="inner_content_right">
				<div class="each_content">
					<div class="each_content_title">
						이름 :
						</div>
					<div class="each_content_content">
						<!-- 가져온 이름 --> 김다은
					</div>
					 	
				</div>
				<div class="each_content">
					<div class="each_content_title">
						학번 :
					</div>
					<div class="each_content_content">
						<!-- 가져온 학번 --> 2019111978
					</div>
				</div>
				<div class="each_content">
					<div class="each_content_title">
						생년월일 : 	
					</div>
					<div class="each_content_content">
						<!-- 가져온 생년월일 --> 2000년 2월 1일
					</div>
				</div>
				<div class="each_large_content">
					<div class="each_large_content_title">
						전공 :
					</div>
					<div class="each_content_large_content">
						<!-- 가져온 전공 --> 공과대학 정보통신컴퓨터공학부 컴퓨터공학과
					</div>
				</div>
				<div class="each_content">
					<div class="each_content_title">
						학년 :
					</div>
					<div class="each_content_content">
						<!-- 가져온 학년 --> 3학년 2학기
					</div>
				</div>
				<div class="each_content">
					<div class="each_content_title">
						이메일 :
					</div>
					<div class="each_content_content">
						<!-- 가져온 이메일 --> web@dgu.ac.kr
					</div>
					</div>
				<div class="each_content">
					<div class="each_content_title">
						전화번호 : 	
					</div>
					<div class="each_content_content">
						<!-- 가져온 전화번호 --> 010-5555-5555
					</div>
				</div>
				<div class="each_large_content">
					<div class="each_large_content_title">
						주소 :
					</div>
					<div class="each_content_large_content">
						<!-- 가져온 주소 --> 서울 중구 필동로 1길
					</div>
				</div>
				</div>
			</div>
			<div id="for_button">
				<button id="save_image_btn">저장</button>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>