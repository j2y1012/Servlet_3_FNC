<%@page import="java.io.File"%>
<%@page import="com.iu.files.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
NoticeDAO noticeDAO = new NoticeDAO();
int result = noticeDAO.delete(num);
FileDAO fileDAO = new FileDAO();
ArrayList<FileDTO> ar = fileDAO.selectList(num);
String save = session.getServletContext().getRealPath("upload");

for(FileDTO f : ar ) {
	
	File file = new File(save,f.getfName());
	file.delete();
}




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
alert("<%=s%>");
location.href="./noticeList.jsp";
</script>
</head>
<body>

</body>
</html>