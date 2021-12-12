<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
<link rel="stylesheet" type="text/css" href="./subject.css" />

</head>
<body>
	<div id="container">
		<div id="header">
			<img id="image" alt="error" src="../elephant.png" align="left">
			<div id="header_in">
				<p font-size:32px>OOO님 환영합니다</p>
				<button background-color:"#FFFFFF", font-color:"#000000",align:"right">로그아웃</button>
        		</div>
			<p>수강 신청 </p>
		</div>
		<!-- 메뉴 바 include -->
		<%@ include file="../Common/menuBar_st.jsp" %>
		
		<div id="content">
			<!-- main content -->
			<div class="content_top">
				<div>
				<div id="title">강의 신청</div>
				<select id="leave_or_return" class="drop_down">
					<option value="major" id="major">전공</option>
					<option value="else" id="else">교양</option>
				</select>
				학수 번호 <input type="text" id="lecture_num" class="drop_down">
				강의명 <input type="text" id="lecture_name" class="drop_down">
				교수명 <input type="text" id="prof_name" class="drop_down">
				
				<button id="reg_button" onclick="after_search();">검색</button>
				
				<script>
					var info = [["전공", "CSE4023", "컴퓨터구조"],
								["교양", "MSE2031", "EAS1"],
								["전공", "CSE4023", "컴퓨터구조"],
								["교양", "MSE2031", "EAS1"],
								["전공", "CSE2021", "웹 프로그래밍"]];//맞을까..?
					function after_search() {
						var newTable = document.getElementById("search_table");
						for (var i=0; i<info.length; i++) {
							var newTr = document.createElement("tr");
							var newTd = new Array(4);
							for (var j=0; j<4; j++) {
								if (j==3) {
									newTd[j] = document.createElement("button");
									newTd[j].id = "btn" + i;
									newTd[j].onclick = add_lecture;
									console.log(newTd[j].id);
									newTd[j].style.width = "100%";
									newTd[j].style.height = "5vh";
									newTd[j].textContent = "신청";
									newTd[j].style.fontSize = "20px";
								}
								else {
									newTd[j] = document.createElement("td");
									newTd[j].textContent = info[i][j];
									newTd[j].style.fontSize = "20px";
									newTd[j].style.textAlign = "center";
								}
								newTr.appendChild(newTd[j]);
								function add_lecture() {
									alert("신청되었습니다.");
									btnId = document.getElementById(this.id);
									btnId.textContent = "신청완료";
									btnId.disabled = true;
									console.log(document.getElementById(this.id));
								}
							}
							newTable.appendChild(newTr);
						}
					}
				</script>
				</div>
				<div class="content_top_down">
					<!--  <div class="before_search">
						강의를 검색해주세요.
					</div>-->
					<div class="after_search">
					<center>
						<table border="1" id="search_table">
							<tr>
								<th id="major" width="50px" class="table_title">전공</td>
								<th id="lecture_num" width="240px" class="table_title">학수 번호</td>
								<th id="lecture_name" width="500px" class="table_title">과목명</td>
								<th class="table_title" width="100px;"></th>
							</tr>
						</table>
					</center>
					</div>
				</div>
			</div>
			<div class="content_bottom">
				<div id="title">수강 신청 내역</div>
				<!-- 가져온 정보 있다면 -->
				<div class="each_content">
				<!-- 데이터베이스에 저장된 수강 신청 내역 -->
					<input type="checkbox" name="requested_lecture" id="subject_check">
					<div class="each_content_content" id="requested_lecture">
						
					</div>
					<button id="cancel_button">신청 취소</button>
				</div>
			</div>
		</div>
		<div id="footer">
			<p>Dongguk University Web_Programming Project</p>
		</div>
	</div>
</body>
</html>