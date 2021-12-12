<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	String name = (String)session.getAttribute("name");
	String id =session.getAttribute("id").toString();
%>
<title>성적 등록</title>
</head>
<body>
					<% GregorianCalendar today = new GregorianCalendar ( );
						int year = today.get ( today.YEAR );
						int month = today.get ( today.MONTH ) + 1;
				
				 	 	int curSemester;
				 	
				  		if (month>=6&&month<=12){
						 	 curSemester=2;
				  		}else 
					 	 	curSemester=1;
				  		
						String mid_test=request.getParameter("mid_test");
						String final_test=request.getParameter("final_test");
						String homework= request.getParameter("homework");
						String attend=request.getParameter("attend");
						String etc=request.getParameter("etc");
						String lecture=request.getParameter("lecture");
						String student=request.getParameter("student");
						String final_grade=request.getParameter("final_grade");
						
						Connection conn=null;
						Statement stmt=null;
						String sql=null;
						ResultSet rs=null;
						ResultSet rs2=null;
						int lecture_num=0;
						int count=0;
			
						try { 
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
						conn = DriverManager.getConnection(jdbcurl, "root", "0000");
						stmt = conn.createStatement();
						sql = "select * from lecture where lec_name='"+lecture+"'"; //+id ;
						rs = stmt.executeQuery(sql);
						%>
						<h2> <%=final_grade %></h2>
						<% 
						while (rs.next()){
							%>
							<h2> 2</h2>
							<% 
							lecture_num=rs.getInt("lecture_num");
							stmt = conn.createStatement();
							sql = "select * from grade where lec_num='"+lecture_num+"' and st_num="+student;
							rs2 = stmt.executeQuery(sql);
							
							if (rs2.next()){%>
								<h2><%=lecture_num %></h2>
								<script type="text/javascript">
								  alert("이미 등록된 학생입니다.");
								  document.location.href ="registerGrade.jsp";
								</script>
							<% 
							}else{
								sql="insert into grade values("+lecture_num+","+student+","+id+","+mid_test+","+final_test+","+attend+","+homework+","+etc+",'"+final_grade+"' ,"+year+","+curSemester+")";
								stmt.executeUpdate(sql);%>
								<script type="text/javascript">
								  alert("등록이 완료되었습니다.");
								  document.location.href ="registerGrade.jsp";
								</script>
							<% 
							}
						}
						rs.close();
						stmt.close();
						conn.close();
								
						} 
					catch(Exception e) {
			  			out.println("DB 연동 오류입니다. : " + e.getMessage() );
					}
							%>
</body>
</html>