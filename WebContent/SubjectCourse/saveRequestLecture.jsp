<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String name = (String)session.getAttribute("name");
	String id =session.getAttribute("id").toString();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 신청</title>
<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./evalLecture.css" />
</head>
<body>
<%
	//디비 환경 변수
	String driver = "";
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	String st_name = "";
	if (request.getParameter("lec_num") == null) {
		%>
		<script>
			alert("잘못된 접근입니다.");
			response.sendRedirect("requestLecture.jsp");
		</script>
		<%
	}
	else {
		int lec_num = Integer.parseInt(request.getParameter("lec_num"));
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		try{
			//데이터베이스 접속
			Class.forName("com.mysql.jdbc.Driver");
	    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
	        con = DriverManager.getConnection(driver, "root", "0000");
	        sql = "select * from student where st_num="+id;
			pstmt = con.prepareStatement(sql);
	    	rs = pstmt.executeQuery(sql);
	    	while (rs.next()) {
	    		st_name = rs.getString("name");
	    		st_num = rs.getInt("st_num");
	    	}
	    	rs.close();
	
			sql = "insert into enroll_lec values(?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lec_num);
			pstmt.setInt(2, st_num);
	
			pstmt.executeUpdate();
	        	
	    	pstmt.close();
	    	con.close();
		
		} catch (ClassNotFoundException e) { 
			System.out.println("드라이버 로드 실패");
		} catch (SQLException e) {
	        System.out.println("DB 접속 실패");
	        e.printStackTrace();
	    }
	}
	%>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p>강의 평가</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		<div id="content">
			<!-- main content -->
			<%
				response.sendRedirect("requestLecture.jsp");
			%>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>