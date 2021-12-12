<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./info.css" />

<%
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	String jobs = (String) session.getAttribute("jobs");
	if (request.getParameter("YEAR") == null || request.getParameter("Semester") == null)
		response.sendRedirect("confirmPayment.jsp?YEAR=2021&Semester=2");
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
			<p>납부 확인</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_ad.jsp"%>
		<div id="content">
			<form method="get" action="confirmPayment.jsp">
				<tr>
					<td><select name="YEAR" id="YEAR" title="년도" class="select w80"></select></td>
					<td><select name="Semester" id="Semester" title="학기" class="select w80"></select></td>
					<td><input type="text" name="st_id" value=<%=request.getParameter("st_id")%>></td>
					<td>
						<button id=time_tag>조회</button>
					</td>
				</tr>

				<%
					if (request.getParameter("st_id") != null) {
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
							String sql_update = "select * from student_register " + "where st_num = " + request.getParameter("st_id") + " and "
									+ "Year = ";
							sql_update = sql_update + request.getParameter("YEAR");
							sql_update = sql_update + " and " + "Semester = " + request.getParameter("Semester");
							rs = stmt.executeQuery(sql_update);
						} catch (Exception e) {
							out.println("DB 연동 오류입니다.: " + e.getMessage());
						}
						rs.last();
						if (rs.getRow() == 0)
							out.print("<h2>해당 기간의 정보가 없습니다.");
						else {
							rs.beforeFirst();
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
				<h3><%=request.getParameter("YEAR")%>년
					<%=request.getParameter("Semester")%>학기
					<br>
					학번 :
					<%=request.getParameter("st_id")%>
				</h3>
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
						<td width="260">학생회비</td>
						<td width="260"><%=Council%>원</td>
						<td width="260"><%=Council_discount%>원</td>
						<td width="260"><%=Council - Council_discount%>원</td>
					</tr>
					<tr>
						<td width="260">합계</td>
						<td width="260"><%=Enrollment + Tuition + Council%>원</td>
						<td width="260"><%=Enrollment_discount + Tuition_discount + Council_discount%>원</td>
						<td width="260"><%=(Enrollment + Tuition + Council)
							- (Enrollment_discount + Tuition_discount + Council_discount)%>원</td>
					</tr>
					<tr>
						<th colspan="2">납부 한 금액</th>
						<th colspan="2"><%=Payment%>원</th>
					</tr>
				</table>
				</form>
				<form action="payment_verify.jsp" method="post">
					납부한 금액 : 
					<input type="text" name="Payment" value=<%=Payment%>> 
					<input type="hidden" name ="st_id" value=<%=request.getParameter("st_id") %>>
					<input type="hidden" name ="Semester" value=<%=request.getParameter("Semester") %>>
					<input type="hidden" name ="YEAR" value=<%=request.getParameter("YEAR") %>>
					<input type="submit" value="수정">
				</form>
				<%
					}
						conn.close();
						stmt.close();
						rs.close();
					}
				%>
			
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {
					setDateBox();
					function setDateBox() {
						var dt = new Date();
						var year = "";
						var com_year = dt.getFullYear();
						var com_month = dt.getMonth();
						$("#YEAR").append("<option value=''>년도</option>");
						for (var y = (com_year - 3); y <= (com_year); y++) {
							if (y == com_year)
								$("#YEAR").append(
										"<option value='"+ y +"' selected >"
												+ y + " 년" + "</option>");
							else
								$("#YEAR").append(
										"<option value='"+ y +"'>" + y + " 년"
												+ "</option>");
						}
						var Semester;
						$("#Semester").append("<option value=''>학기</option>");
						for (var i = 1; i <= 2; i++) {
							if (parseInt(com_month / 6) + 1 == i)
								$("#Semester").append(
										"<option value='"+ i +"' selected>" + i
												+ " 학기" + "</option>");
							else
								$("#Semester").append(
										"<option value='"+ i +"'>" + i + " 학기"
												+ "</option>");
						}
					}

					function itoStr($num) {
						$num < 10 ? $num = '0' + $num : $num;
						return $num.toString();
					}
				});
	</script>
</body>
</html>
