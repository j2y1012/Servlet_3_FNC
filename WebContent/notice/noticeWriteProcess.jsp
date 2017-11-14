<%@page import="java.util.Enumeration"%>
<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FileDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int maxSize=1024*1024*10;//파일크기
	String save=session.getServletContext().getRealPath("upload");
	
	File f = new File(save);
	if(!f.exists()){
		f.mkdirs();
	}
	
	
	MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setWriter(multi.getParameter("writer"));
	noticeDTO.setTitle(multi.getParameter("title"));
	noticeDTO.setContents(multi.getParameter("contents"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.getNum();
	noticeDTO.setNum(result);
	 noticeDAO.insert(noticeDTO);
	
	 
	 //file의 파라미터이름을 정확히 알수없을때
	 Enumeration e=multi.getFileNames();
	
	 while(e.hasMoreElements()){
	String obj=(String)e.nextElement();
	FileDTO fileDTO = new FileDTO();
	fileDTO.setoName(multi.getOriginalFileName(obj));
	fileDTO.setfName(multi.getFilesystemName(obj));
	fileDTO.setNum(result);
	FileDAO.insert(fileDTO);
	
		 
	 }
	
	String s ="Fail";
	if(result>0){
		s = "Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "noticeList.jsp");
	//1 Foward
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	//2. redirect
	//response.sendRedirect("../common/result.jsp");
	
	
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