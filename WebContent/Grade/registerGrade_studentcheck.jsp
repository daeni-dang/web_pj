<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적 등록</title>

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
				<% String lecture=request.getParameter("lecture");
				   String student=request.getParameter("student");
				   %>
				<form method="GET" action="registerGrade_verify.jsp">
				<div id="all_grade_content">
					교과목 명
					<input type="text" class="student_info" name="lecture"value=<%=lecture %> readonly/>  
			   </div>
			   	<div id="all_grade_content">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학번
					<input type="text" class="student_info"name="student" value=<%=student %> readonly/> 
					<button id="register_button" type="submit">저장 </button>
			   </div>
			</div>	
					<% Connection conn=null;
						Statement stmt=null;
						String sql=null;
						ResultSet rs=null;
						ResultSet rs2=null;
						int lecture_num;
			
						try { 
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
						conn = DriverManager.getConnection(jdbcurl, "root", "0000");
						stmt = conn.createStatement();
						sql = "select * from lecture where lec_name='"+lecture+"'"; //+id ;
						rs = stmt.executeQuery(sql);
						
						try{
							while(rs.next()) {
								lecture_num=rs.getInt("lecture_num");
								
								stmt=conn.createStatement();
								sql = "select * from enroll_lec where lec_num="+lecture_num +" and st_num="+student; //+id ;
								rs2=stmt.executeQuery(sql);
								
								if (rs2.next()){%>
								
									<div class="content_bottom">
									<div id="all_grade_content">
										중간고사
										<input type="text" name="mid_test" value="30"  class="student_info">
								   </div>
								   <div id="all_grade_content">
										기말고사
										<input type="text" value="30" name="final_test" class="student_info">
								   </div>
								   <div id="all_grade_content">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과제
										<input type="text" value="10" name="homework" class="student_info">
								   </div>
								   <div id="all_grade_content">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출석
										<input type="text" value="10" name="attend" class="student_info">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;최종 성적
										<select name="final_grade" class="drop_down">
											<option value="default">-- 선택 --</option>
											<option value="A+" id="grade_A+">A+</option>
											<option value="A" id="grade_A">A</option>
											<option value="B+" id="grade_B+">B+</option>
											<option value="B" id="grade_B">B</option>
											<option value="C+" id="grade_C+">C+</option>
											<option value="C" id="grade_C">C</option>
											<option value="D+" id="grade_D+">D+</option>
											<option value="D" id="grade_D">D</option>
											<option value="F" id="grade_F">F</option>
											
										</select>
								   </div>
								   <div id="all_grade_content">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기타
										<input type="text" value="10" name="etc" class="student_info">
								   </div>
								</div>
							</div>
							<div id="footer">
								<p>Dongguk University Web_Programming Project</p>
							</div>
						</div>
						</form>
								<%}
								else{%>
								<div class="content_bottom">
									 <h2> 해당 수업에 해당 학생은 수강 하지 않습니다.</h2>
									</div>
									<div id="footer">
									<p>Dongguk University Web_Programming Project</p>
									</div>
								</div>
										
								<%}
								
								}rs.close();
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
			
</body>
</html>