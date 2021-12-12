<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	String name = (String)session.getAttribute("name");
%>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./grade.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p> 평가항목별 성적 조회 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<div class="content_top">
				<div id="title_each_grade">학기 선택</div>
				<% String year=request.getParameter("year");
				   String semester_each_grade=request.getParameter("semester_each_grade");
				   %>
				<div class="each_content"> <%=year%>년 <%=semester_each_grade %>학기 </div>
				
			</form>	
			</div>	
			<div class="content_bottom">
				<table class="each_grade_table">
					<th class="each_grade_th">학수강좌번호</th>
					<th class="each_grade_th">교과목명</th>
					<th class="each_grade_th">담당교원</th>
					<th class="each_grade_th">학점</th>
					<th class="each_grade_th">중간고사 점수</th>
					<th class="each_grade_th">기말고사 점수</th>
					<th class="each_grade_th">출석</th>
					<th class="each_grade_th">과제</th>
					<th class="each_grade_th">기타</th>
					<%
						Connection conn=null;
						Statement stmt=null;
						String sql=null;
						ResultSet rs=null;
						ResultSet rs2=null;
						ResultSet rs3=null;
						int lecture_num;
						int professor_num;
						String lecture=null;
						String professor=null;
						String grade=null;
						int mid;
						int final_test;
						int attend;
						int homework;
						int etc;
						int lecture_count=0;
						float grade_avg=0;
						int get_grade_lecture=0;
			
						try { 
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
						conn = DriverManager.getConnection(jdbcurl, "root", "1234");
						stmt = conn.createStatement();
						sql = "select * from grade where  year=" +year+ " and semester="+semester_each_grade ;
						rs = stmt.executeQuery(sql);
						
		
						try{
							while(rs.next()) {
								grade=rs.getString("final_grade");
								professor_num=rs.getInt("pro_num");
								lecture_num=rs.getInt("lec_num");
								mid=rs.getInt("mid_test");
								final_test=rs.getInt("final_test");
								attend=rs.getInt("attendance");
								homework=rs.getInt("homework");
								etc=rs.getInt("etc");
								stmt = conn.createStatement();
								sql = "select * from lecture where lecture_num = "+ lecture_num;
								rs2 = stmt.executeQuery(sql);
								if (rs2.next()){
								lecture=rs2.getString("lec_name");
								}
								stmt = conn.createStatement();
								sql = "select * from professor where pro_num = " + professor_num;
								rs3 = stmt.executeQuery(sql);
								if (rs3.next()){
								professor=rs3.getString("name");
								}
								rs2.close();
								rs3.close();
								%>
								<tr>
									<td class="each_grade_td"> <%= lecture_num %> </td>
									<td class="each_grade_td"> <%= lecture %> </td>
									<td class="each_grade_td"> <%= professor %></td>
									<td class="each_grade_td"> <%= grade%></td>
									<td class="each_grade_td"> <%= mid%></td>
									<td class="each_grade_td"> <%= final_test%></td>
									<td class="each_grade_td"> <%= attend%></td>
									<td class="each_grade_td"> <%= homework%></td>
									<td class="each_grade_td"> <%= etc%></td>
								</tr>
								<% 
							}
							
							rs.close();
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

				</table>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>