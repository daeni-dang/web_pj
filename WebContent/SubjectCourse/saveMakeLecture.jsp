<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 개설</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />

</head>
<body>
<%
	String driver = "";
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	int count = 0;
	
	int lec_type = Integer.parseInt(request.getParameter("lec_type"));
	String lec_name = request.getParameter("lec_name");
	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
	String[] lec_day = request.getParameterValues("lec_day");
	String[] start_time = request.getParameterValues("start_time");
	String[] end_time = request.getParameterValues("end_time");

	int lec_num = 0;
	String pro_name = "";
	
	try{
		//데이터베이스 접속
		Class.forName("com.mysql.jdbc.Driver");
    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
        con = DriverManager.getConnection(driver, "root", "0000");
        sql = "select * from professer";
		pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		pro_name = rs.getString("name");
    	}
    	rs.close();

		sql = "insert into lecture values(?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, 0);
		pstmt.setInt(2, lec_type);
		pstmt.setString(3, lec_name);
		pstmt.setInt(4, pro_num);

		pstmt.executeUpdate();
		sql = "select lecture_num from lecture where lec_name='"+lec_name+"'";
		pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		lec_num = rs.getInt("lecture_num");
    	}
		
		int i=0;
    	for (String lec: lec_day) {
			sql = "insert into lecture_date values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lec_num);
			pstmt.setString(2, lec);
			if (start_time[i] != "" && end_time[i] != "") {
				pstmt.setString(3, start_time[i]);
				pstmt.setString(4, end_time[i]);
			}
			pstmt.executeUpdate();
			i++;
    	}
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
				<p font-size:32px><%=pro_name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p>강의 개설 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_pr.jsp" %>
		
		<div id="content">
			<!-- main content -->
			
			<div id="title">강의 개설이 완료되었습니다.</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
	
	<!-- 승인완료 버튼 -->
	<!-- <div class="accept">승인완료</div>-->
	<!-- 승인중 버튼 -->
	<!-- <div class="reject">승인거절</div> -->
</body>
</html>