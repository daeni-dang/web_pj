<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
</head>
<body>
	<div id="sidebar">
			<ul>
				<li class="menubar">학적부
					<ul>
						<% //학생  %>
						<li onclick="location.href='../SchoolRegister/checkStudentInfo.jsp'">개인 정보 조회</li>
					</ul>
				</li>
				<li class="menubar">수강신청
					<ul>						
						<% //학생 %>
						<li onclick="location.href='../SubjectCourse/requestLecture.jsp'">수강신청</li>
						<li onclick="location.href='../SubjectCourse/evalLecture.jsp'">강의 평가</li>
						
					</ul>
				</li>
				<li class="menubar">성적
					<ul>
						<%//학생 %>
						<li onclick="location.href='../Grade/checkEachGrade.jsp'">평가항목별 성적 조회</li>
						<li onclick="location.href='../Grade/announceGrade.jsp'">성적공시</li>
						<li onclick="location.href='../Grade/checkPrintAllGrade.jsp'">전체성적 조회 및 출력</li>
					</ul>
				</li>
				<li class="menubar">등록
					<ul>
						<%//학생 %>
						<li onclick="location.href='../Register/printBill.jsp'">고지서 출력</li>
						<li onclick="location.href='../Register/printPaymentConfirm.jsp'">납부 확인서 출력</li>
					</ul>
				</li>
			</ul>
		</div>
</body>
</html>
