<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%
	String tempDir="/test/temp";
	String upDir="/test/storage";
	
	tempDir=application.getRealPath(tempDir);
	upDir=application.getRealPath(upDir);
	
	UploadSave upload=new UploadSave(request, -1, -1, tempDir);  //업로드세이브 객체생성
	
	String title="";
	FileItem fileItem=null;
	String filename="";
	long filesize=0;
%>


<!DOCTYPE html>
<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg"> <br>
<%
title=UploadSave.encode(upload.getParameter("title"));  //입력한 갖 가져와서 출력

out.print("제목: "+title + "<br><br>");

fileItem=upload.getFileItem("file1");    //보내고 받고 함
filesize=fileItem.getSize();

if(filesize>0){   //0보다 크기가 크면 정말 보낸 값이 있는 것! 안보냈으면 출력이 안됨
	filename=UploadSave.saveFile(fileItem, upDir);
	out.println("전송된 파일명: "+filename+"/전송된 파일 사이즈: "+filesize+"<br>");
}

fileItem=upload.getFileItem("file2");
filesize=fileItem.getSize();

if(filesize>0){
	filename=UploadSave.saveFile(fileItem, upDir);
	out.println("전송된 파일명: "+filename+"/전송된 파일 사이즈: "+filesize+"<br>");
}

fileItem=upload.getFileItem("file3");
filesize=fileItem.getSize();

if(filesize>0){
	filename=UploadSave.saveFile(fileItem, upDir);
	out.println("전송된 파일명: "+filename+"/전송된 파일 사이즈: "+filesize+"<br>");
}

%>


</div>

</div>

</body>
</html>