<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 평가</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
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
	
	String st_name = "";
	try {
    	Class.forName("com.mysql.jdbc.Driver");
    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
    	con = DriverManager.getConnection(driver, "root", "0000");
    	sql = "select name from student";
		pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		st_name = rs.getString("name");
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
					<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
	        		</div>
				<p>강의 평가</p>
			</div>
			<!-- 메뉴 바 include -->
			<%@ include file="../Common/menuBar_st.jsp" %>
		
			<div id="content">
				<!-- main content -->
				<div id="title">강의 평가</div>
				<div id="innerContent">
					
					<table>
					<tr align=center>
						<td class="each_lecture">과목명</td>
						<td class="each_lecture">학수번호</td>
						<td class="each_lecture">교수명</td>
					</tr>
					<%
					    try {
					    	Class.forName("com.mysql.jdbc.Driver");
					    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
					    	con = DriverManager.getConnection(driver, "root", "0000");
							pstmt = con.prepareStatement(sql);
					    	sql = "select * from lecture";
					    	rs = pstmt.executeQuery(sql);
					    	while (rs.next()) {
					    		%>
					    		<tr align=center>
					    			<td class="each_lecture">
					    				<%=rs.getString("lec_name") %>
					    			</td>
					    			<td class="each_lecture">
					    				<%=rs.getInt("lecture_num") %>
					    			</td>
					    			<%
					    				sql = "select name from professer where pro_num="+rs.getInt("pro_num");

										pstmt = con.prepareStatement(sql);
							    		ResultSet rs2 = pstmt.executeQuery(sql);
							    		while (rs2.next()) {
						    				%>
						    				<td class="each_lecture">
						    					<%=rs2.getString("name") %>
						    				</td>
						    				<%
					    				}
							    		rs2.close();
					    			%>
					    				
					    			<td class="each_lecture_button">
					    				<form method="post" action="eachEvalLecture.jsp">
					    				<input type="hidden" value="<%=rs.getInt("lecture_num")%>" name="button_eval">
					    				<button id="button_eval">평가</button>
					    				</form>
					    			</td>
					    		</tr>
					    	<%
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
				</table>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>