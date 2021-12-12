<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청</title>
<%
	String name = (String) session.getAttribute("name");
	String id = session.getAttribute("id").toString();
%>
<link rel="ylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />
<link rel="stylesheet" type="text/css" href="./evalLecture.css" />

</head>
<body>
	<%
		String driver = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
	%>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name%>님 환영합니다
				</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
			</div>
			<p>수강 신청</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp"%>

		<div id="content">
			<!-- main content -->
			<div class="content_top">
				<div>
					<div id="title">강의 신청</div>
					<table>
						<tr align=center>
							<td class="each_lecture">전공</td>
							<td class="each_lecture">학수번호</td>
							<td class="each_lecture">과목명</td>
						</tr>
						<%
							try {
								Class.forName("com.mysql.jdbc.Driver");
								driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
								con = DriverManager.getConnection(driver, "root", "0000");
								sql = "select * from lecture";
								pstmt = con.prepareStatement(sql);
								rs = pstmt.executeQuery(sql);
								int lec_num = 0;
								while (rs.next()) {
						%>
						<tr align=center>
							<td class="each_lecture">
								<%
									int type = rs.getInt("lec_type");
											if (type == 0) {
								%> 전공 <%
									} else {
								%> 교양 <%
									}
								%>
							</td>
							<td class="each_lecture">
								<%
									lec_num = rs.getInt("lecture_num");
								%> <%=lec_num%>
							</td>
							<td class="each_lecture"><%=rs.getString("lec_name")%></td>
							<td class="each_lecture_button">
								<form method="post" action="saveRequestLecture.jsp">
									<input type="hidden" value="<%=rs.getInt("lecture_num")%>" name="lec_num"> <input type="hidden" value="<%=id%>" name="st_num">
									<button id="button_eval" onclick="request_lecture();">신청</button>
								</form>
							</td>
						</tr>
						<script>
							function request_lecture() {
								alert("신청이 완료되었습니다.");
							}
						</script>
						<%
							}
							} catch (ClassNotFoundException e) {
								System.out.println("드라이버 로드 실패");
							} catch (SQLException e) {
								System.out.println("DB 접속 실패");
								e.printStackTrace();
							}
							
						%>
					</table>
				</div>
			</div>
			<div class="content_bottom">
				<div id="title">수강 신청 내역</div>
				<!-- 가져온 정보 있다면 -->
				<%
					String driver2 = "";
					Connection con2 = null;
					PreparedStatement pstmt2 = null;
					String sql2 = null;
					ResultSet rs2 = null;
					try {

						con2 = DriverManager.getConnection(driver, "root", "0000");
						sql2 = "select * from lecture inner join enroll_lec on lecture.lecture_num = enroll_lec.lec_num where st_num = ?";
						pstmt2 = con2.prepareStatement(sql2);
						pstmt2.setString(1, id);
						rs2 = pstmt2.executeQuery();
					} catch (Exception e) {

					}
				%>
				<table>
					<tr align=center>
						<td class="each_lecture">전공</td>
						<td class="each_lecture">학수번호</td>
						<td class="each_lecture">과목명</td>
					</tr>
					<%
						while (rs2.next()) {
					%>
					<tr align=center>
						<td class="each_lecture">
							<%
								int type = rs2.getInt("lec_type");
									if (type == 0) {
							%> 전공 <%
								} else {
							%> 교양 <%
								}
							%>
						</td>
						<td class="each_lecture">
							<%=rs2.getString("lecture_num") %>
						</td>
						<td class="each_lecture"><%=rs2.getString("lec_name")%></td>
					</tr>
					<%
						}
						rs2.close();
						pstmt2.close();
						con2.close();
						rs.close();
						pstmt.close();
						con.close();
					%>
				</table>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>
