<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/bssi.jsp"%>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno")); //정수로 받아왐
	dao.upViewcnt(bbsno);
	bbsDTO dto=dao.read(bbsno);
	String content=dto.getContent().replaceAll("\r\n","<br>");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Bbs</title>
  <meta charset="utf-8">
  
<script type="text/javascript">
 function updateb(bbsno){
 var url="updateForm.jsp";
 url+="?bbsno="+bbsno;
 url+="&col=<%=request.getParameter("col")%>";
 url+="&word=<%=request.getParameter("word")%>";
 url+="&nowPage=<%=request.getParameter("nowPage")%>";
 location.href=url;
 }
 
 function deleteb(bbsno){
	 var url="deleteForm.jsp";
	 url+="?bbsno="+bbsno;
	 url+="&col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
	 
 }
 function replyb(bbsno){
	 var url="replyForm.jsp";
	 url+="?bbsno="+bbsno;
	 url+="&col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
	 }
 
 function listb(){
	 var url="list.jsp";
	 url+="?col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
	 }
 
 
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h1>Bbs Read</h1><br>
<div>
<div class="panel panel-default">
	<div class="panel-heading">Writer</div>
	<div class="panel-body"><%=dto.getWname() %></div>
	
	<div class="panel-heading">Title</div>
	<div class="panel-body"><%=dto.getTitle() %></div>
	
	<div class="panel-heading">Content</div>
	<div class="panel-body" style="height: 200px"><%=content %></div>

	<div class="panel-heading">ViewCount</div>
	<div class="panel-body"><%=dto.getViewcnt() %></div>
	
	<div class="panel-heading">Date</div>
	<div class="panel-body"><%=dto.getWdate() %></div>
	

</div>
<button class="btn btn-drfault" onclick="deleteb('<%=bbsno%>')">Delete</button>
<button class="btn btn-drfault" onclick="location.href='./createForm.jsp'">write</button>
<button class="btn btn-drfault" onclick="updateb('<%=bbsno%>')">Update</button>
<button class="btn btn-drfault" onclick="replyb('<%=bbsno%>')">Reply</button>
<button class="btn btn-drfault" onclick="listb()">List</button>

</div>



</div>

</body>
</html>