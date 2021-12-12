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
<title></title>
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
		String pname = request.getParameter("pro_name");
		int pro_num = Integer.parseInt(request.getParameter("pro_num"));
		String birth = request.getParameter("pro_birth");
		String office = request.getParameter("pro_office");
		String email = request.getParameter("pro_email");
		String phone = request.getParameter("pro_phone");
		String address = request.getParameter("pro_address");
		String major_st = request.getParameter("pro_major");
		String password = request.getParameter("pro_password");
		try{
			//데이터베이스 접속
			Class.forName("com.mysql.jdbc.Driver");
	    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
	        con = DriverManager.getConnection(driver, "root", "0000");
	        	
			sql = "insert into professor values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setInt(2, pro_num);
			pstmt.setString(3, birth);
			pstmt.setString(4, office);
			pstmt.setString(5, email);
			pstmt.setString(6, phone);
			pstmt.setString(7, address);
			pstmt.setString(8, major_st);
			pstmt.setString(9, password);
	
			pstmt.executeUpdate();
			%>
			<script>alert("학생 등록이 완료되었습니다.");</script>
			<%
	        	
	    	pstmt.close();
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
				<p font-size:32px><%=name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p>강의 평가</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		<div id="content">
			<!-- main content -->
			<script>alert("교수 등록이 완료되었습니다.")</script>
			<%
				response.sendRedirect("registerStPro.jsp");
			%>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>