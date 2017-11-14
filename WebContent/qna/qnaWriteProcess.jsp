<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FileDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.fnc.qna.QnaDAO"%>
<%@page import="com.iu.member.memberDTO"%>
<%@page import="com.fnc.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int maxSize=1024*1024*10;
	String save=session.getServletContext().getRealPath("upload");
	
	File f = new File(save);
	if(!f.exists()){
		f.mkdirs();
	}
	MultipartRequest multi = new MultipartRequest(request,save,maxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	
	QnaDTO qnaDTO = new QnaDTO();
	qnaDTO.setWriter(((memberDTO)session.getAttribute("member")).getId());
	qnaDTO.setTitle(multi.getParameter("title"));
	qnaDTO.setContents(multi.getParameter("contents"));
	
	String hName=multi.getOriginalFileName("f2");
	String iName=multi.getFilesystemName("f2");
	
	
	QnaDAO qnaDAO = new QnaDAO();
	int result = qnaDAO.insert(qnaDTO);
	
	
	
	FileDTO FileDTO = new FileDTO();
    FileDTO.sethName(hName);
	FileDTO.setiName(iName);
	FileDTO.setNum(result);
	FileDAO fileDAO = new FileDAO();
	result = fileDAO.insert(FileDTO);
	
	
	
	String s ="Fail";
	if(result>0){
		s = "Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "qnaList.jsp");
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