<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px>OOO님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p>강의 개설 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_pr.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div class="content_top">
				<div>
				<div id="title">강의 개설 신청</div>
				<select id="leave_or_return" class="drop_down">
					<option value="default">-- 선택 --</option>
					<option value="major" id="major">전공</option>
					<option value="else" id="else">교양</option>
				</select>
				강의명 <input type="text" id="lecture_name" class="drop_down">
				강의 인원 <input type="number" id="student_num" class="drop_down">
				
				<button id="reg_button" onclick="after_search();">신청</button>
				
				</div>
				<div class="content_top_down">
					<input type="checkbox" name="day" value="mon" id="subject_check"><big>월</big>
					<input type="checkbox" name="day" value="tue" id="subject_check"><big>화</big>
					<input type="checkbox" name="day" value="wed" id="subject_check"><big>수</big>
					<input type="checkbox" name="day" value="thu" id="subject_check"><big>목</big>
					<input type="checkbox" name="day" value="fri" id="subject_check"><big>금</big>
					<button onclick="show_select_time();" id="time_button">강의 시간 설정</button>
					<br><br>
					<script>
						function show_select_time() {
							const query = 'input[name="day"]:checked';
							const selected = document.querySelectorAll(query);
							const selectedNum = selected.length;
							const startTimeDiv = document.getElementById("start_time");
							startTimeDiv.textContent = "강의 시작 시간";
							const endTimeDiv = document.getElementById("end_time");
							endTimeDiv.textContent = "강의 종료 시간";
							for (var i=0; i<selectedNum; i++) {
								var newInputStart = document.createElement("input");
								newInputStart.setAttribute("type", "time");
								newInputStart.id="start_time";
								var newInputEnd = document.createElement("input");
								newInputEnd.setAttribute("type", "time");
								newInputEnd.id="start_time";
								startTimeDiv.appendChild(newInputStart);
								endTimeDiv.appendChild(newInputEnd);
							}
							
						}
						
					</script>
					<div id="show_time">
						<div id="start_time">  </div>
						<div id="end_time">  </div>
					</div>
				</div>
			</div>
			<div class="content_bottom">
				<div id="title">강의 개설 신청 내역</div>
				<!-- 가져온 정보 있다면 -->
				<div class="each_content">
					<input type="checkbox" name="requested_lecture" id="subject_check">
					<div class="each_content_content" id="requested_lecture">
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