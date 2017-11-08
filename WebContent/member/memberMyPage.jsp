<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<table class="table table-hover">
<tr>
<td>NAME</td>
<td>EMAIL</td>
<td>PHONE</td>
<td>AGE</td>

</tr>
<tr>
<td><%=memberDTO.getId() %></td>
<td><%=memberDTO.getName() %></td>
<td><%=memberDTO.getEmail() %></td>
<td><%=memberDTO.getPhone() %></td>
<td><%=memberDTO.getAge() %></td>
</tr>

</table>
</section>






</body>
</html>