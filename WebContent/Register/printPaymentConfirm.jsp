<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./info.css" />

<%
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name%>님 환영합니다
				</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
			</div>
			<p>납부 확인서 출력</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_ad.jsp" %>

		<div id="content">
			<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				int Tuition = 0, Council = 0, Enrollment = 0;
				int Tuition_discount = 0, Council_discount = 0, Enrollment_discount = 0;
				int Payment = 0;
				try {

					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
					conn = DriverManager.getConnection(url, "root", "0000");
					stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					String sql_update = "select * from student_register "
							+ "where id = " + id 
							+ " and " 
							+ "Year = 2021 " // Change logic
							+ "and "
							+ "Semester = 2"; // Change logic too
					rs = stmt.executeQuery(sql_update);
				} catch (Exception e) {
					out.println("DB 연동 오류입니다.: " + e.getMessage());
				}
				while (rs.next()) {
					Tuition = rs.getInt("Tuition");
					Council = rs.getInt("Council");
					Enrollment = rs.getInt("Enrollment");
					Tuition_discount = rs.getInt("Tuition_discount");
					Council_discount = rs.getInt("Council_discount");
					Enrollment_discount = rs.getInt("Enrollment_discount");
					Payment = rs.getInt("Payment");
				}
			%>
			<p>2021년 2학기 </p>
			<table id="register_table" border="1">
				<tr>
					<th width="260">구분</th>
					<th width="260">책정금액</th>
					<th width="260">감면/면제 금액</th>
					<th width="260">고지금액</th>
				</tr>
				<tr>
					<td width="260">입학금</td>
					<td width="260"><%=Enrollment%>원</td>
					<td width="260"><%=Enrollment_discount%>원</td>
					<td width="260"><%=Enrollment - Enrollment_discount%>원</td>
				</tr>
				<tr>
					<td width="260">수업료</td>
					<td width="260"><%=Tuition%>원</td>
					<td width="260"><%=Tuition_discount%>원</td>
					<td width="260"><%=Tuition - Tuition_discount%>원</td>
				</tr>
				<tr>
					<td width="260">입학금</td>
					<td width="260"><%=Enrollment%>원</td>
					<td width="260"><%=Enrollment_discount%>원</td>
					<td width="260"><%=Enrollment - Enrollment_discount%>원</td>
				</tr>
				<tr>
					<td width="260">합계</td>
					<td width="260"><%=Enrollment + Tuition + Enrollment%>원</td>
					<td width="260"><%=Enrollment_discount + Tuition_discount + Enrollment_discount%>원</td>
					<td width="260"><%=(Enrollment + Tuition + Enrollment)
					- (Enrollment_discount + Tuition_discount + Enrollment_discount)%>원</td>
				</tr>
				<tr>
					<th colspan="2"> 총 납부 금액 </th>
					<th colspan="2"> <%=Payment%>원 </th>
				</tr>
			</table>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>