<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />
<link rel="stylesheet" type="text/css" href="./evalLecture.css" />

</head>
<body>
<%
	String driver = "";
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	int count = 0;
	
	String st_name = "";
	int st_num = 0;
	try {
    	Class.forName("com.mysql.jdbc.Driver");
    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
    	con = DriverManager.getConnection(driver, "root", "0000");
    	sql = "select name, st_num from student";
		pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		st_name = rs.getString("name");
    		st_num = rs.getInt("st_num");
    	}
		pstmt.close();
    	rs.close();
		con.close();
    } catch (ClassNotFoundException e) { 
		System.out.println("드라이버 로드 실패");
	} catch (SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
    }
%>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=st_name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p>수강 신청 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
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
					    						%>
					    						전공 
					    						<%
					    					} else {
					    						%>
					    						교양 
					    						<%
					    					}
					    					
					    				%>
					    			</td>
					    			<td class="each_lecture">
					    			<%
					    				lec_num = rs.getInt("lecture_num");
					    			%>
					    				<%=lec_num %>
					    			</td>
					    			<td class="each_lecture">
					    				<%=rs.getString("lec_name") %>
					    			</td>
					    			<td class="each_lecture_button">
					    				<form method="post" action="saveRequestLecture.jsp">
					    				<input type="hidden" value="<%=rs.getInt("lecture_num")%>" name="lec_num">
					    				<input type="hidden" value="<%=st_num%>" name="st_num">
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
					    	rs.close();
					    	sql = "select * from enroll_lec where st_num="+st_num+" and lec_num="+lec_num;
					    	pstmt = con.prepareStatement(sql);
					    	ResultSet rs2 = pstmt.executeQuery(sql);
					    	while (rs2.next()) {
					    		count += 1;
					    	}
							pstmt.close();
							rs2.close();
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
				<table>
					<%
					    if (count > 0) {
					    	%>
							<tr align=center>
								<td class="each_lecture_front"></td>
								<td class="each_lecture_front">전공</td>
								<td class="each_lecture_back">과목명</td>
							</tr>
								<%
						    	sql = "select * from lecture";
						    	pstmt = con.prepareStatement(sql);
						    	rs = pstmt.executeQuery(sql);
					    		while (rs.next()) {
					    			sql = "select * from enroll_lec where st_num="+st_num+" and lec_num="+rs.getInt("lecture_num");
						    		pstmt = con.prepareStatement(sql);
							    	ResultSet rs2 = pstmt.executeQuery(sql);
							    	while (rs2.next()) {
							    		%>
							    		<tr>
								    		<td class="each_lecture_front" align="center">
								    			<input type="checkbox" name="requested_lecture" id="subject_check">
								    		</td>
								    		<td class="each_lecture_front" align="center">
								    		<%
								    			int type = rs.getInt("lec_type");
						    					if (type == 0) {
						    						%>
						    						전공 
						    						<%
						    					} else {
						    						%>
						    						교양 
						    						<%
						    					}
						    					 %>
								    		</td>
								    		<td class="each_lecture_back" align="center">
								    			<%=rs.getString("lec_name") %>
								    			</td>
								    		<td align="center">
												<button type="submit" id="cancel_button">신청 취소</button>
											</td>
											
										
										</tr>
										<%
							    	}
						    	}
					    	}
					    	else {
					    		%>
					    		<center>신청한 강의가 없습니다.</center>
					    		<%
					    	}
					    	
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