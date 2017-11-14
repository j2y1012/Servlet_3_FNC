<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

NoticeDTO noticeDTO = new NoticeDTO();
noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
noticeDTO.setTitle(request.getParameter("title"));
noticeDTO.setContents(request.getParameter("contents"));

NoticeDAO noticeDAO = new NoticeDAO();
int result = noticeDAO.update(noticeDTO);

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
alert('<%=s%>');
location.href="noticeList.jsp";
</script>
</head>
<body>

</body>
</html>