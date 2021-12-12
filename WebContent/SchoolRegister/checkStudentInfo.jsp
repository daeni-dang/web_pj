<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./info.css" />

<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
	String jobs = (String)session.getAttribute("jobs");
%>

</head>
<body>
<%
	String driver = "";
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	
    String st_name = "";
    String st_num = "";
    String birth = "";
    int grade_st = 0;
    int semester = 0;
    String email = "";
    String phone = "";
    String address = "";
    String major_st = "";
    String password = "";
    try {
    	Class.forName("com.mysql.jdbc.Driver");
    	driver = "jdbc:mysql://localhost:3306/web_pj?serverTimezone=UTC";
    	con = DriverManager.getConnection(driver, "root", "0000");
    	sql = "select * from student where st_num = " + id;
    	pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	while (rs.next()) {
    		st_name = rs.getString("name");
    		st_num = rs.getString("st_num");
    		birth = rs.getString("birth");
    		grade_st = rs.getInt("grade_st");
    		semester = rs.getInt("semester");
    		email = rs.getString("email");
    		phone = rs.getString("phone");
    		address = rs.getString("address");
    		major_st = rs.getString("major_st");
    	}
    	pstmt.close();
    	rs.close();
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
			<p>개인 정보 조회 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div class="inner_content">
				<div class="each_content">
					<div class="each_content_title">
						이름 :
						</div>
					<div class="each_content_content">
						<!-- 가져온 이름 --> <%=st_name %>
					</div>
					 	
				</div>
				<div class="each_content">
					<div class="each_content_title">
						학번 :
					</div>
					<div class="each_content_content">
						<!-- 가져온 학번 --> <%=st_num %>
					</div>
				</div>
				<div class="each_content">
					<div class="each_content_title">
						생년월일 : 	
					</div>
					<div class="each_content_content">
						<!-- 가져온 생년월일 --> <%=birth %>
					</div>
				</div>
				<div class="each_large_content">
					<div class="each_large_content_title">
						전공 :
					</div>
					<div class="each_content_large_content">
						<!-- 가져온 전공 --> <%=major_st %>
					</div>
				</div>
				<div class="each_content">
					<div class="each_content_title">
						학년 :
					</div>
					<div class="each_content_content">
						<!-- 가져온 학년 --> <%=grade_st %>학년 <%=semester %>학기
					</div>
				</div>
				<div class="each_large_content">
					<div class="each_large_content_title">
						이메일 :
					</div>
					<div class="each_content_large_content">
						<!-- 가져온 이메일 --> <%=email %>
					</div>
					</div>
				<div class="each_content">
					<div class="each_content_title">
						전화번호 : 	
					</div>
					<div class="each_content_content">
						<!-- 가져온 전화번호 --> <%=phone %>
					</div>
				</div>
				<div class="each_large_content">
					<div class="each_large_content_title">
						주소 :
					</div>
					<div class="each_content_large_content">
						<!-- 가져온 주소 --> <%=address %>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
</body>
</html>