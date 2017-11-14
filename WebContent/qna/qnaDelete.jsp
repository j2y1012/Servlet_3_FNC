<%@page import="com.fnc.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDAO qnaDAO = new QnaDAO();
	int result = qnaDAO.delete(num);
	String s = "Fail";
	if(result>0){
		s="Success";
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("<%=s%>");
	location.href="./qnaList.jsp";
</script>
</head>
<body>

</body>
</html>