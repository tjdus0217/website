<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<%
	String upDir="/test2/storage";
	String tempDir="test2/temp";
	
	upDir=application.getRealPath(upDir);
	tempDir=application.getRealPath(tempDir);
	
	
	UploadSave upload=new UploadSave(request, -1, -1, tempDir);
	String title=upload.getParameter("title");
	String content=upload.getParameter("content");
	String etc=upload.getParameter("etc");
	
	FileItem fileItem=upload.getFileItem("filename");
	
	int size= (int)fileItem.getSize();
	String filename=UploadSave.saveFile(fileItem, upDir);
			
	
%>




<!DOCTYPE html> 
<html>
<head>
  <title>업로드</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">

	title: <%=title %><br>
	content: <%=content %><br>
	filename: <%=filename %><br>
	file size: <%=size %><br>
	etc: <%=etc %><br>


</div>
 
</div>
</body>
</html>
 