<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<% 
	request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<body>
	<%
		String id, pw;
		Connection conn=null;
		Statement stmt=null;
		String sql=null;
		ResultSet rs=null;
		String sql_update;
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		HttpSession session = request.getSession(true);
		
		try { 
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
		conn = DriverManager.getConnection(jdbcurl, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from student where st_num = " + id;
		rs = stmt.executeQuery(sql);
		} 
		catch(Exception e) {
		  out.println("DB 연동 오류입니다. : " + e.getMessage() );
		}
		
		try{
			while(rs.next()) {
				if(pw.equals(rs.getString("password"))) {
					session.setAttribute("id", id);
					session.setAttribute("name", rs.getString("name"));
					response.sendRedirect("SchoolRegister/checkStudentInfo.jsp");
				}
			}
		}
		catch(Exception e) {
			out.print("<br>" + sql);
		}
		%>
</body>
</html>