<%@page import="com.fnc.qna.QnaDAO"%>
<%@page import="com.fnc.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	QnaDTO qnaDTO = new QnaDTO();
	qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
	qnaDTO.setTitle(request.getParameter("title"));
	qnaDTO.setContents(request.getParameter("contents"));
	
	QnaDAO qnaDAO = new QnaDAO();
	int result = qnaDAO.update(qnaDTO);
	
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
	alert('<%=s%>');
	location.href="qnaList.jsp";
</script>
</head>
<body>

</body>
</html>