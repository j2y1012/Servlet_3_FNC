<%@page import="com.iu.member.memberDAO"%>
<%@page import="com.iu.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    memberDTO memberDTO = new memberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setJob(request.getParameter("job"));
	
	memberDAO memberDAO = new memberDAO();
	memberDTO = memberDAO.selectOne(memberDTO);
	
	String path = "./memberLoginForm.jsp";
	if(memberDTO != null){
		
		request.setAttribute("member", memberDTO);
		RequestDispatcher view = request.getRequestDispatcher("../index.jsp");
		view.forward(request, response);
	}
	
	response.sendRedirect(path);
	
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
    
    