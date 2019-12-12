<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="board.BoardDTO"%>
<%@ page import="java.util.*" %>
<%@ page import="utility.*"%>
<%@ page import="org.apache.commons.fileupload.*" %>

<jsp:useBean id="dao" class="board.BoardDAO"/>

<%
	String root=request.getContextPath();
	
	request.setCharacterEncoding("utf-8"); 

	List<BoardDTO> list=null;
	
	Iterator<BoardDTO> iter=null;
	
	boolean flag=false;
    		
	String upDir=application.getRealPath("/board/storage");
	String tempDir=application.getRealPath("/board/temp");
	
	UploadSave upload=new UploadSave(request, -1, -1, tempDir);
	
%> 