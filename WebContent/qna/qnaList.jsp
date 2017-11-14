<%@page import="java.util.ArrayList"%>
<%@page import="com.fnc.qna.QnaDAO"%>
<%@page import="com.fnc.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String kind=request.getParameter("kind");
	String search = request.getParameter("search");
	
	if(kind==null){
		kind="title";
	}
	
	if(search==null){
		search="";
	}
	
	int curPage=1;
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	QnaDAO qnaDAO = new QnaDAO();
	ArrayList<QnaDTO> ar = qnaDAO.selectList(startRow, lastRow, kind, search);
	///////////////////////////////////////////
	//pageing
	int totalCount = qnaDAO.getTotalCount(kind, search);
	int totalPage=0;
	if(totalCount%perPage==0){
		totalPage=totalCount/perPage;
	}else {
		totalPage=totalCount/perPage+1;
	}
	
	//totalBlock
	int perBlock=5;
	int totalBlock=0;
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	}else {
		totalBlock=totalPage/perBlock+1;
	}
	//curPage를 이용해서 curBlock 구하기
	int curBlock=0;
	if(curPage%perBlock==0){
		curBlock=curPage/perBlock;
	}else {
		curBlock=curPage/perBlock+1;
	}
	
	//curBlock , startNum, lastNum
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
	
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

<style type="text/css">
h1 {
	width: 30%;
	margin: 0 auto;
	text-align: center;
}

#list {
	width: 75%;
	margin: 0 auto;
	margin-top: 100px;
}
</style>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>Q&A List</h1>
		<article id="list">
			<table class="table table-hover">
				<tr>
					<th>NO</th>
					<td>TITLE</td>
					<td>WRITER</td>
					<td>DATE</td>
					<td>HIT</td>
				</tr>
				<% for(QnaDTO qnaDTO: ar){ %>
				<tr>
					<td><%=qnaDTO.getNum()%></td>
					<%try{%>
					<%if(memberDTO != null){ %>
					<td><a href="qnaView.jsp?num=<%=qnaDTO.getNum()%>"><%=qnaDTO.getTitle()%></a></td>
					<%}else{ %>
					<td><%=qnaDTO.getTitle()%></td>
					<%} %>
					<%}catch(Exception e){} %>
					<td><%=qnaDTO.getWriter()%></td>
					<td><%=qnaDTO.getReg_date()%></td>
					<td><%=qnaDTO.getHit()%></td>
				</tr>
				<%} %>
			</table>
						<!-- pageing -->
			<div class="container">
  
  <ul class="pagination">
  	<% if(curBlock>1){ %>
  	 <li><a href="./qnaList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a></li>
  	 <%} %>
  
    <%	for(int i=startNum;i<=lastNum;i++){ %>
    
    <li><a href="./qnaList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a></li>
    
    <%} %>
    
    <%if(curBlock < totalBlock){ %>
    <li><a href="./qnaList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a></li>
    <%} %>
  </ul>
</div>
	<!-- end -->
	<!-- search 제목, 작성자, 내용 -->
	<form action="./qnaList.jsp">
		<input type="hidden" name="curPage">
		<select name="kind">
			<option value="title">Title</option>
			<option value="writer">Writer</option>
			<option value="contents">Contents</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="SEARCH">
	</form>
	<!-- search -->
			<%try{ %>
			<% if(memberDTO != null) {%>
			<a class="btn btn-success" href="./qnaWriteForm.jsp">WRITE</a>
			<%} %>
			<%}catch(Exception e){} %>
		</article>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>