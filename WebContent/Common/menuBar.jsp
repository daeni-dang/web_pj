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
						<li onclick="location.href='../SchoolRegister/requestLeaveReturn.jsp'">휴/복학신청</li>
						<% //교수 %>
						<li onclick="location.href='../SchoolRegister/checkProfInfo.jsp'">개인 정보 조회</li>
						
					</ul>
				</li>
				<li class="menubar">수강신청
					<ul>						
						<li onclick="location.href='../SubjectCourse/checkEvalResult.jsp'">강의 평가 결과 조회</li>
						<% //학생 %>
						<li onclick="location.href='../SubjectCourse/requestLecture.jsp'">수강신청</li>
						<li onclick="location.href='../SubjectCourse/evalLecture.jsp'">강의 평가</li>
						<li onclick="location.href='../SubjectCourse/requestAbsence.jsp'">유교 결석 신청</li>
						<% //교수 %>
						<li onclick="location.href='../SubjectCourse/makeLecture.jsp'">강의 개설</li>
						
					</ul>
				</li>
				<li class="menubar">성적
					<ul>
						<%//학생 %>
						<li onclick="location.href='../Grade/checkEachGrade.jsp'">평가항목별 성적 조회</li>
						<li onclick="location.href='../Grade/announceGrade.jsp'">성적공시</li>
						<li onclick="location.href='../Grade/checkPrintAllGrade.jsp'">전체성적 조회 및 출력</li>
						<%//교수 %>
						<li onclick="location.href='../Grade/registerGrade.jsp'">성적 등록</li>
						<li onclick="location.href='../Grade/checkGradeEachLecture.jsp'">강의별 성적 조회</li>
					</ul>
				</li>
				<li class="menubar">장학
					<ul>
						<%//학생 %>
						<li onclick="location.href='../Scholarship/checkReceive.jsp'">장학 수혜 조회</li>
						<li onclick="location.href='../Scholarship/requestWork.jsp'">근로장학 조회 및 신청</li>
						
						<%//교수 %>
						<li onclick="location.href='../Scholarship/checkAllGrade.jsp'">장학 수혜 조회</li>
						<li onclick="location.href='../Scholarship/registerReceiver.jsp'">근로장학 조회 및 신청</li>
						<li onclick="location.href='../Scholarship/makeWork.jsp'">근로장학 개설</li>
					
					</ul>
				</li>
				<li class="menubar">등록
					<ul>
						<%//학생 %>
						<li onclick="location.href='../Register/printBill.jsp'">고지서 출력</li>
						<li onclick="location.href='../Register/printPaymentConfirm.jsp'">납부 확인서 출력</li>
						<%//행정업무자 %>
						<li onclick="location.href='../Register/confirmPayment.jsp'">납부 확인</li>
						
					</ul>
				</li>
				<li class="menubar">상담
					<ul>
						<%//학생 %>
						<li onclick="location.href='../Counseling/requestCounseling.jsp'">상담 예약 신청</li>
						<li onclick="location.href='../Counseling/checkCounseling.jsp'">상담 신청 조회</li>
						<li onclick="location.href='../Counseling/checkAvailableTime.jsp'">교수 상담 가능 시간</li>
						
						<%//교수 %>
						<li onclick="location.href='../Counseling/acceptCounseling.jsp'">상담 승인</li>
						
					</ul>
				</li>
				<li class="menubar">대관 신청
					<ul>
						<%//학생 %>
						<li onclick="location.href='../RentalRequest/requestRental.jsp'">강의실 대관 신청</li>
						<li onclick="location.href='../RentalRequest/checkRental.jsp'">신청 강의실 조회</li>
						
						<%//행정업무자 %>
						<li onclick="location.href='../RentalRequest/confirmRental.jsp'">대관 신청 승인</li>
					</ul>
				</li>
			</ul>
		</div>
</body>
</html>