<%@page import="com.iu.member.memberDAO"%>
<%@page import="com.iu.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    memberDTO memberDTO = (memberDTO)session.getAttribute("member");
    
    memberDAO memberDAO = new memberDAO();
    int result = memberDAO.delete(memberDTO.getId());
    
    String s = "Fail";
    
    if(result>0){
    	s = "Success";
    	session.invalidate();
    }
    request.setAttribute("message", s);
    request.setAttribute("path", "../index.jsp");
    
    RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
    %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>