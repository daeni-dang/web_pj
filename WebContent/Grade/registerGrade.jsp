<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./grade.css" />
<%
	String name = (String)session.getAttribute("name");
	String id =session.getAttribute("id").toString();
%>
</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p>성적 등록</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_pr.jsp" %>
		<div id="content">
		
			<div class="content_top">
			<form method="GET" action="registerGrade_studentcheck.jsp">
				<div id="all_grade_content">
					교과목 명
					<select id="lecture_name" class="drop_down" name="lecture">
						<option value="default">-- 선택 --</option>
						<% Connection conn=null;
						Statement stmt=null;
						String sql=null;
						ResultSet rs=null;
						String lecture=null;
			
						try { 
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
						conn = DriverManager.getConnection(jdbcurl, "root", "0000");
						stmt = conn.createStatement();
						
						sql = "select * from lecture where pro_num="+id;
						rs = stmt.executeQuery(sql);
						
		
						try{
							while(rs.next()) {
								lecture=rs.getString("lec_name");
								%>
								<option value=<%=lecture %> id="lecture1"><%=lecture %></option>
							<% }%>
						</select>
						
					<%      rs.close();
							stmt.close();
							conn.close();
					}
					catch(Exception e) {
					out.print("<br>" + e);
					}
						} 
						catch(Exception e) {
		  					out.println("DB 연동 오류입니다. : " + e.getMessage() );
						}
						%>
			   </div>
			   <div id="all_grade_content">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학번
					<input type="text" name="student" class="student_info">
					<button id="register_button" type="submit">조회</button>
			   </div>
			  </form>
			</div>	
			<div class="content_bottom">
				<h2 align="center"> 성적을 등록할 학생을 선택해 주세요</h2>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>