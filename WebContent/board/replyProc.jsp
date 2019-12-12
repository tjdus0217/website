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

String filename=null;

if(filesize>0){
	filename=UploadSave.saveFile(fileItem, upDir);
}

int num=Integer.parseInt(upload.getParameter("num"));
int ref=Integer.parseInt(upload.getParameter("ref"));
int indent=Integer.parseInt(upload.getParameter("indent"));
int ansnum=Integer.parseInt(upload.getParameter("ansnum"));

dto.setNum(num);
dto.setRef(ref);
dto.setIndent(indent);
dto.setAnsnum(ansnum);

dto.setName(name);
dto.setSubject(subject);
dto.setContent(content);
dto.setPasswd(passwd);
dto.setFilename(filename);
dto.setFilesize(filesize);
dto.setIp(request.getRemoteAddr());

Map map=new HashMap();
map.put("ref", ref);
map.put("ansnum", ansnum);

dao.upAnsnum(map);
 
flag=dao.reply_create(dto);

%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
 
 <script>
 function listB(){
	 var url="list.jsp";
	 url+="?col=<%=upload.getParameter("col")%>";
	 url+="&word=<%=upload.getParameter("word")%>";
	 url+="&nowPage=<%=upload.getParameter("nowPage")%>";
	
	 location.href=url;
 }
 
 function replyB(num){
	 var url="replyForm.jsp";
	 url+="?num="+num;
	 url+="&col=<%=upload.getParameter("col")%>";
	 url+="&word=<%=upload.getParameter("word")%>";
	 url+="&nowPage=<%=upload.getParameter("nowPage")%>";
	 location.href=url;
	 }
 
 </script>
 
 
 
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

<button class="btn btn-default" onclick="listB()">List</button>
<button type="button" class="btn btn-default" onclick="location.href='./createForm.jsp'">Write</button>


</div>
</body>
</html>