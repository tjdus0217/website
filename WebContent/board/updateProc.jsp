<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp"%>

<jsp:useBean id="dto" class="board.BoardDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%

	int num=Integer.parseInt(upload.getParameter("num")); 

	String name=upload.getParameter("name");
	String subject=upload.getParameter("subject");
	String content=upload.getParameter("content");
	String passwd=upload.getParameter("passwd");
	String oldfile=upload.getParameter("oldfile"); 
	
	
	FileItem fileItem=upload.getFileItem("filename");
	
	int filesize= (int)fileItem.getSize();
	
	
	String filename=null;
	
	dto.setNum(num);
	dto.setName(name);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setFilename(filename);
	dto.setFilesize(filesize);
	
	Map map=new HashMap();
	map.put("num",num);
	map.put("passwd",passwd);
	
	boolean pflag=dao.passCheck(map);	
	
	if(pflag){
		if(filesize>0){
			if(oldfile!=null){
				UploadSave.deleteFile(upDir, oldfile);
				}
			filename=UploadSave.saveFile(fileItem, upDir);
			dto.setFilename(filename);
		}	
		flag=dao.update(dto);
		 

	}
%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
  
<script type="text/javascript">
 	function listB(){
 		var url="list.jsp";
 		url+="?col=<%=upload.getParameter("col")%>";
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
	<% if(!pflag){
		out.print("잘못된 비밀번호 입니다.");
	} else if(flag){
		out.print("글 수정을 성공했습니다.");
	}else{
		out.print("글 수정을 실패했습니다.");
	}	
	%>
</div>
	<button type="button" class="btn btn-default" onclick="listB()">List</button>
	<button class="btn btn-default" onclick="location.href='./createForm.jsp'">Write</button>
	
	<% if(!pflag){ %>
	<button class="btn btn-default" onclick="history.back()">Re-Try</button>
	<%} %>
	
	
	
</div>

</body>
</html>