<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>
<body>
	<%
		int st_id = Integer.parseInt(request.getParameter("st_id"));
		int Year = Integer.parseInt(request.getParameter("YEAR"));
		int Semester = Integer.parseInt(request.getParameter("Semester"));
		int Payment = Integer.parseInt(request.getParameter("Payment"));
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "0000");
			String str = "update student_register set Payment = ? where "
					+ "st_num = ? and Year = ? and Semester = ?";
			pstmt = conn.prepareStatement(str);
			pstmt.setInt(1, Payment);
			pstmt.setInt(2, st_id);
			pstmt.setInt(3, Year);
			pstmt.setInt(4, Semester);
			pstmt.executeUpdate();
			response.sendRedirect("confirmPayment.jsp?YEAR="+ Year + "&Semester=" + Semester+"&st_id="+st_id);
		}
		catch (Exception e) {
			out.println("DB 연동 오류입니다.: " + e.getMessage());
		}
	%>
</body>
</html>