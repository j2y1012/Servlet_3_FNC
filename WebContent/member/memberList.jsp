<%@page import="com.iu.member.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");



%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<th>ID</th>
<th>PW </th>
<th>NAME </th>
<th>EMAIL </th>
<th>PHONE </th>
<th>AGE </th>
<th>JOB</th>

</tr>
<% for(memberDTO memberDTO: ar){ %>
<tr>
<td><%=memberDTO.getID()%> </td>
<td><%=memberDTO.getPW()%> </td>
<td><%=memberDTO.getNAME()%> </td>
<td><%=memberDTO.getEMAIL() %> </td>
<td><%=memberDTO.getPHONE() %> </td>
<td><%=memberDTO.getAGE() %></td>
<td><%=memberDTO.getJOB() %></td>
</tr>
<%} %>
</table>


</table>
</body>
</html>