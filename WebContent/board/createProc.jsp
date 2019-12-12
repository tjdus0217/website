<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
 
<%@ include file="/ssi/board_ssi.jsp"%>

<jsp:useBean id="dto" class="board.BoardDTO"/>

<%


String name=upload.getParameter("name");
String subject=upload.getParameter("subject");
String content=upload.getParameter("content");
String passwd=upload.getParameter("passwd");

FileItem fileItem=upload.getFileItem("filename");

int filesize= (int)fileItem.getSize();

String filename="";
if(filesize>0){
	filename=UploadSave.saveFile(fileItem, upDir);
}

dto.setName(name);
dto.setSubject(subject);
dto.setContent(content);
dto.setPasswd(passwd);
dto.setFilename(filename);
dto.setFilesize(filesize);
dto.setIp(request.getRemoteAddr());
flag=dao.create(dto);

%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
 
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<div class="well well-lg">
	
	<%if(flag){%>
	name: <%=name %><br>
	subject: <%=subject %><br>
	content: <%=content %><br>
	filename: <%=filename %><br>
	file size: <%=filesize %><br>
	<%} else{
	out.print("FAIL, Try it again!");
	}
	%>
</div>

<button onclick="location.href='./list.jsp'" class="btn btn-defalut">List</button>
<button onclick="location.href='./createForm.jsp'" class="btn btn-defalut">Write</button>


</div>
</body>
</html>