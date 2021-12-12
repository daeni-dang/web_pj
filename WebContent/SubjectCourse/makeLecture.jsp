<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 개설</title>
<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />
<link rel="stylesheet" type="text/css" href="./evalLecture.css" />
<%
	String name = (String)session.getAttribute("name");
	String id =session.getAttribute("id").toString();
%>
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
	
	int pro_num = 0;
	try {
    	Class.forName("com.mysql.jdbc.Driver");
    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
    	con = DriverManager.getConnection(driver, "root", "0000");
    	sql = "select name, pro_num from professor where pro_num="+id;
		pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		pro_num = rs.getInt("pro_num");
    	}
		sql = "select * from lecture where pro_num="+id;
    	pstmt = con.prepareStatement(sql);
    	ResultSet rs2 = pstmt.executeQuery(sql);
    	while (rs2.next()) {
    		count += 1;
    	}
		pstmt.close();
    	rs.close();
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
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
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
				<form method="post" action="saveMakeLecture.jsp">
				</div>
				<select name="lec_type" class="drop_down">
					<option value="0" id="major">전공</option>
					<option value="1" id="else">교양</option>
				</select>
				강의명 <input type="text" name="lec_name" class="drop_down"><br>
					<big>월</big><input type="checkbox" name="lec_day" value="월" id="subject_check">
					<input type="time" name="start_time"><input type="time" name="end_time">
					<big>화</big><input type="checkbox" name="lec_day" value="화" id="subject_check">
					<input type="time" name="start_time"><input type="time" name="end_time">
					<big>수</big><input type="checkbox" name="lec_day" value="수" id="subject_check">
					<input type="time" name="start_time"><input type="time" name="end_time"><Br>
					<big>목</big><input type="checkbox" name="lec_day" value="목" id="subject_check">
					<input type="time" name="start_time"><input type="time" name="end_time">
					<big>금</big><input type="checkbox" name="lec_day" value="금" id="subject_check">
					<input type="time" name="start_time"><input type="time" name="end_time">

				<button id="reg_button" onclick="after_search();">신청</button>
				<input type="hidden" name="pro_num" value=<%=pro_num %>>
				</form>
			</div>
			<div class="content_bottom">
				<div id="title">강의 개설 신청 내역</div>
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
						    	sql = "select * from lecture where pro_num="+id;
						    	pstmt = con.prepareStatement(sql);
						    	rs = pstmt.executeQuery(sql);
					    		while (rs.next()) {
						    		pstmt = con.prepareStatement(sql);
							    	ResultSet rs2 = pstmt.executeQuery(sql);
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