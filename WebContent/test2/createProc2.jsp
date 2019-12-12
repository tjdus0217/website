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
	String[] etc=upload.getParameterValues("etc");
	
	String etcs="";
	for (int i=0; i<etc.length;i++){
		etcs +=etc[i];
		if(i<etc.length-1){			
			etcs += ",";
		}
	}
	
	
	FileItem[] fileItem=upload.getFileItems("filename");
	
	int[] size= new int[fileItem.length];
	String[] filename=new String[fileItem.length];
	
	
	for(int i=0;i<fileItem.length;i++){
		size[i]=(int)fileItem[i].getSize();
		filename[i]=UploadSave.saveFile(fileItem[i], upDir);
	}
	
	String filenames="";
	for(int i=0; i<filename.length;i++){
		filenames += filename[i];
		if(i<filename.length-1){
			filenames += ",";
		}
	}
	
	String sizes="";
	for(int i=0;i<size.length;i++){
		sizes+=size[i];
		if(i<size.length-1){
			sizes += ",";
		}
	}
	
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
	filename: <%=filenames %><br>
	file size: <%=sizes %><br>
	etc: <%=etcs %><br>


</div>
 
</div>
</body>
</html>
 