<%@page import="com.iu.member.memberDTO"%>
<%@page import="com.iu.member.memberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    memberDTO memberDTO =new memberDTO();
   memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
	memberDTO.setJob(request.getParameter("job"));
    memberDAO memberDAO = new memberDAO();
    int result = memberDAO.insert(memberDTO);
	String s = "Join Fail";
	if(result>0){
		s = "Join Success";
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