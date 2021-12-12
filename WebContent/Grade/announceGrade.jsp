<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
	String id =  session.getAttribute("id").toString();
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
			<p> 성적 공시 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			
			<div class="content_bottom">
				<div id="title_grade">
				
					<div class="each_content">
					<%
						GregorianCalendar today = new GregorianCalendar ( );
						int year = today.get ( today.YEAR );
						int month = today.get ( today.MONTH ) + 1;
					
					 	 int curSemester;
					 	
					  	if (month>=6&&month<=12){
							  curSemester=2;
					  	}else 
						 	 curSemester=1;
					%>
						<%=year%>년 <%=curSemester %>학기
			    	</div>
				</div>
				<table class="each_grade_table">
					<th class="each_grade_th">교과목명</th>
					<th class="each_grade_th">담당교원</th>
					<th class="each_grade_th">학점</th>
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
						int lecture_count=0;
						float grade_avg=0;
						int get_grade_lecture=0;
			
						try { 
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
						conn = DriverManager.getConnection(jdbcurl, "root", "0000");
						stmt = conn.createStatement();
						sql = "select * from grade where st_num = " + id;
						rs = stmt.executeQuery(sql);
						
		
						try{
							while(rs.next()) {
								grade=rs.getString("final_grade");
								professor_num=rs.getInt("pro_num");
								lecture_num=rs.getInt("lec_num");
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
								<td class="grade_td"><%=lecture %> </td>
								<td class="grade_td"><%=professor %> </td>
								<td class="grade_td"><%=grade %> </td>
								</tr>
								<% 
								lecture_count++;
								get_grade_lecture++;
								if (grade.equals("A+"))
									grade_avg+=4.5;
								else if (grade.equals("A"))
									grade_avg+=4.0;
								else if (grade.equals("B+"))
									grade_avg+=3.5;
								else if (grade.equals("B"))
									grade_avg+=3.0;
								else if (grade.equals("C+"))
									grade_avg+=2.5;
								else if (grade.equals("C"))
									grade_avg+=2.0;
								else if (grade.equals("D+"))
									grade_avg+=1.5;
								else if (grade.equals("D"))
									grade_avg+=1.0;
								else if (grade.equals("F")){
									grade_avg+=0;
									get_grade_lecture--;
								}
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
				신청 과목수
				<input type="text" value=<%=lecture_count %> class="each_info">
				신청 학점
				<input type="text" value=<%=lecture_count*3 %> class="each_info">
				취득 학점
				<input type="text" value=<%=get_grade_lecture*3 %> class="each_info">
				<br>
				평점 평균
				<input type="text" value=<%=grade_avg/lecture_count %> class="each_info">
			</div>
		</div>
		<div id="footer" border="1">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>