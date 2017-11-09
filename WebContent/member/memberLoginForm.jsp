<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
	 Cookie [] ar = request.getCookies();
	String cId="";
	
	
	for(int i=0;i<ar.length;i++){
			
		if(ar[i].getName().equals("id")){
			cId = ar[i].getValue();
			break;
		}
		
	}
%>    
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
		<form name="frm" class="form-horizontal" action="memberLoginProcess.jsp" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" value="<%= cId %>" id="id" name="id"
						placeholder="Enter ID">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Job">ID저장하기:</label>
				<div class="col-sm-10">
					<input type="checkbox" value="save" class="checkbox-inline" name="save">
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">PW:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control ch" id="pw" name="pw"
						placeholder="Enter Pw">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="Job">Job:</label>
				<div class="col-sm-10">
					STUDENT<input type="radio" value="S" checked="checked" class="radio-inline" name="job">
					TEACHER<input type="radio" value="T" class="radio-inline" name="job">
				</div>
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" id="check" value="LogIn">
				</div>
			</div>
		</form>
		
	
	
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>