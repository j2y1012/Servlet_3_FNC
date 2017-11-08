<%@page import="com.iu.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	memberDAO memberDAO = new memberDAO();
	boolean check = memberDAO.idCheck(id);
	String s = id + "는 사용 가능 합니다.";
	if (!check) {
		s = id + "는 중복된 ID 입니다.";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var btn = document.getElementById("btn");
		btn.addEventListener("click", function() {
		window.opener.document.frm.id.value='<%=id%>';	
		window.opener.document.frm.idCheck.value="1";
		window.self.close();
		});
	}
</script>
</head>
<body>
	<h1>Id Check</h1>
	<form action="memberIdCheck.jsp">
		<input type="text" name="id">
		<button>중복확인</button>

	</form>
	<h3><%=s%></h3>
	<%
		if (check) {
	%>
	<button>사용하기</button>
	<%
		}
	%>
</body>
</html>