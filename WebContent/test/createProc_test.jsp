<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<%
	String tempDir="/test/temp";	// 업로드시 파일이 들어가는 임시경로
	String upDir="/test/storage";  //실제경로 
	
	tempDir=application.getRealPath(tempDir);  //절대경로 
	upDir=application.getRealPath(upDir);
	
	UploadSave upload=new UploadSave(request, -1, -1, tempDir);	
			// 이게 beans임 -1은 크기를안잡겠다는 소리, 여기서만 쓰는 것
	
	String title= UploadSave.encode(upload.getParameter("title")); // request를 못가져오니 uploadSave로
	String content= UploadSave.encode(upload.getParameter("content"));
	String etc= UploadSave.encode(upload.getParameter("etc")); //한글처리 따로 해야 함.

	FileItem fileItem=upload.getFileItem("filename"); //업로드 보낸 파일을 받는 작업
	int size=(int)fileItem.getSize();
	
	String filename=null;
	if(size>0){
		filename=UploadSave.saveFile(fileItem, upDir);
	}
%>


<!DOCTYPE html>
<html>
<head>
  <title>test</title>
  <meta charset="utf-8">
 

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">

제목: <%=title %><br>
내용: <%=content %><br>
참고: <%=etc %><br>
파일명: <%=filename %><br>
파일크기: <%=size%> <br>

</div>
</div>
</body>
</html>