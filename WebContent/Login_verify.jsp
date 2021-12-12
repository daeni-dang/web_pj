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
		String id, pw, jobs;
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		String sql_update;

		id = request.getParameter("id");
		pw = request.getParameter("pw");
		jobs = request.getParameter("jobs");
		HttpSession session = request.getSession(true);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl, "root", "0000");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			if (jobs.equals("Professor"))
				sql = "select * from professor where pro_num = " + id;
			else if (jobs.equals("Manager"))
				sql = "select * from manager where mgr_num = " + id;
			else if (jobs.equals("Student"))
				sql = "select * from student where st_num = " + id;
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			out.println("<h2>데이터베이스 오류입니다. 관리자에게 문의하세요.");
		}
		try {
			rs.last();
			if (rs.getRow() == 0) {
				out.println("<h2>해당 아이디가 존재 하지않습니다<br>");
	%>
	<a href="Login.jsp">login</a>
	<%
		} else {	
				rs.beforeFirst();
				while (rs.next()) {
					if (pw.equals(rs.getString("password"))) {
						session.setAttribute("id", id);
						session.setAttribute("name", rs.getString("name"));
						session.setAttribute("jobs", jobs);
						if(jobs.equals("Professor")) response.sendRedirect("SchoolRegister/checkProfInfo.jsp");
						else if(jobs.equals("Student")) response.sendRedirect("SchoolRegister/checkStudentInfo.jsp");
						else if(jobs.equals("Manager")) response.sendRedirect("SchoolRegister/checkManagerInfo.jsp");
					}
				}
			}
		} catch (Exception e) {
				out.println("<h2>해당 아이디가 존재 하지않습니다<br>");
				%>
				<a href="Login.jsp">login</a>
		<%
		}
	%>
</body>
</html>
