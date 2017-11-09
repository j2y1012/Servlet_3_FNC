<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
		<table class="table table-hover">
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>EMAIL</td>
				<td>PHONE</td>
				<td>AGE</td>
			</tr>
			<tr>
				<td><%= memberDTO.getId() %></td>
				<td><%= memberDTO.getName() %> </td>
				<td><%= memberDTO.getEmail() %> </td>
				<td><%= memberDTO.getPhone() %> </td>
				<td><%= memberDTO.getAge() %> </td>
			</tr>
		</table>
		
		<div>
			<a class="btn btn-danger" href="./memberUpdateForm.jsp">UPDATE</a>
			<a class="btn btn-default" href="./memberDelete.jsp">DELETE</a>
		</div>
	
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>