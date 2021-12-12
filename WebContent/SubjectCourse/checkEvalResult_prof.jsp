<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./evalLecture.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px>OOO님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p>강의 평가 결과 조회 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_pr.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div id="title">강의 평가 결과 조회</div>
			<div>
				<button class="searchButton">검색</button>
				<input type="text" class="searchLecture">
			</div>
			<div>
				<table id="forEvalLecture" width="100%">
					<tr id="eachTr">
						<td class="eachTd" id="isMajor">전공/교양</td>
						<td class="eachTd" id="profName">교수명</td>
						<td class="eachTd" id="subjectName">과목명</td>
						<td class="eachTd" id="isEval">결과조회</td>
					</tr>
					<!-- 데이터베이스에서 가져온 강의 평가 정보 -->
					<tr>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>