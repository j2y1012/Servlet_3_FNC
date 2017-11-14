<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));

NoticeDAO noticeDAO = new NoticeDAO();
NoticeDTO noticeDTO = noticeDAO.selectOne(num);
	
%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp"%>
<section id="main">
	<form class="form-horizontal" action="noticeUpdateProcess.jsp" method="post">
		<input type="hidden" name="num" value="<%=noticeDTO.getNum()%>">
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="writer">WRITER:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" readonly="readonly" value="<%=noticeDTO.getWriter() %>" id="writer" name="writer"
					placeholder="Enter Writer">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="Title">TITLE:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" value="<%=noticeDTO.getTitle() %>" id="title" name="title"
					placeholder="Enter Title">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="Contents">CONTENTS:</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="5" id="contents" name="contents"><%=noticeDTO.getContents()%></textarea>
			</div>
		</div>
		
		
		
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>
	</form>



</section>
<%@ include file="../temp/footer.jsp"%>

</body>
</html>