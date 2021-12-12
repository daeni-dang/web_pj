<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
		setDateBox();
	});

	// select box 연도 , 월 표시
	function setDateBox() {
		var dt = new Date();
		var year = "";
		var com_year = dt.getFullYear();
		// 발행 뿌려주기
		$("#YEAR").append("<option value=''>년도</option>");
		// 올해 기준으로 -1년부터 +5년을 보여준다.
		for (var y = (com_year - 1); y <= (com_year + 5); y++) {
			$("#YEAR").append(
					"<option value='"+ y +"'>" + y + " 년" + "</option>");
		}
		// 월 뿌려주기(1월부터 12월)
		var month;
		$("#MONTH").append("<option value=''>월</option>");
		for (var i = 1; i <= 12; i++) {
			$("#MONTH").append(
					"<option value='"+ i +"'>" + i + " 월" + "</option>");
		}
	}
</script>
<body>
	<tr>
		<td><select name="YEAR" id="YEAR" title="년도" class="select w80"></select> <select name="MONTH" id="MONTH" title="월" class="select w80"></select></td>
	</tr>
</body>

</html>