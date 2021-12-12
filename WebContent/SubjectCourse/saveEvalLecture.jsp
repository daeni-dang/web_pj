<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 평가</title>
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
	int lec_num = Integer.parseInt(request.getParameter("lec_num"));
	int st_num = Integer.parseInt(request.getParameter("st_num"));
	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
	
	int q1 = Integer.parseInt(request.getParameter("q1"));
	int q2 = Integer.parseInt(request.getParameter("q2"));
	int q3 = Integer.parseInt(request.getParameter("q3"));
	int q4 = Integer.parseInt(request.getParameter("q4"));
	int q5 = Integer.parseInt(request.getParameter("q5"));
	String q6 = request.getParameter("q6");

	try{
		//데이터베이스 접속
		Class.forName("com.mysql.jdbc.Driver");
    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
        con = DriverManager.getConnection(driver, "root", "0000");
        sql = "select * from student";
		pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		st_name = rs.getString("name");
    		st_num = rs.getInt("st_num");
    	}
    	rs.close();

        //회원가입 처리
		sql = "insert into eval_lecture values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, lec_num);
		pstmt.setInt(2, st_num);
		pstmt.setInt(3, pro_num);
		pstmt.setInt(4, q1);
		pstmt.setInt(5, q2);
		pstmt.setInt(6, q3);
		pstmt.setInt(7, q4);
		pstmt.setInt(8, q5);
		pstmt.setString(9, q6);

		pstmt.executeUpdate();
        	
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
				<p font-size:32px><%=st_name %>님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right" onclick="location.href='../Logout.jsp'">로그아웃</button>
        		</div>
			<p>강의 평가</p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		<div id="content">
			<!-- main content -->
			<div id="title">강의 평가 등록이 완료되었습니다.</div>
			
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>