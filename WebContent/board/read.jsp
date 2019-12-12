<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp"%>
<%
	int num=Integer.parseInt(request.getParameter("num")); 
	
	dao.upCount(num); 
	BoardDTO dto=dao.read(num);
	
	String content=dto.getContent().replaceAll("\r\n","<br>");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">

<script type="text/javascript">  
function listB(){
	 var url="list.jsp";
	 url+="?col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	 location.href=url;
 }
 
function deleteB(num){
	 var url="deleteForm.jsp";
	 url+="?num="+num;
	 url+="&col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
	 
}

function updateB(num){
	 var url="updateForm.jsp";
	 url+="?num="+num;
	 url+="&col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
	 }

function replyB(num){
	 var url="replyForm.jsp";
	 url+="?num="+num;
	 url+="&col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
	 }
	 
 
function downFile(filename){
	 var url="<%=root%>/download";
	 url += "?dir=/board/storage";
	 url += "&filename="+filename;
	 
	 location.href=url;
	 
}


</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h1 >Board Read</h1><br>
<div>
<div class="panel panel-default">

	<div class="panel-heading">Number</div>
	<div class="panel-body"><%=dto.getNum() %></div>

	<div class="panel-heading">Writer</div>
	<div class="panel-body"><%=dto.getName() %></div>
	
	<div class="panel-heading">Title</div>
	<div class="panel-body"><%=dto.getSubject() %></div>
	
	<div class="panel-heading">Content</div>
	<div class="panel-body" style="height: 200px"><%=content %></div>

	<div class="panel-heading">Reference</div>
	<div class="panel-body"><%=dto.getRef() %></div>

	<div class="panel-heading">View</div>
	<div class="panel-body"><%=dto.getCount() %></div>
	
	<div class="panel-heading">Date</div>
	<div class="panel-body"><%=dto.getRegdate() %></div>
	
	<div class="panel-heading">IP Address</div>
	<div class="panel-body"><%=dto.getIp() %></div>
	
	<div class="panel-heading">File</div>
	<div class="panel-body">
			<%
				if(dto.getFilename()==null){
					out.print(" ");
				}else{ %>
					<a href="javascript:downFile('<%=dto.getFilename() %>')"><%=dto.getFilename() %></a>
					<div>File size: <%=dto.getFilesize() %> </div>
			<% 
				}				
				%></div>
	

</div>
<button class="btn btn-default" onclick="deleteB('<%=num%>')">Delete</button>
<button class="btn btn-default" onclick="location.href='./createForm.jsp'">Write</button>
<button class="btn btn-default" onclick="updateB('<%=num%>')">Update</button>
<button class="btn btn-default" onclick="replyB('<%=num%>')">Reply</button>
<button class="btn btn-default" onclick="listB()">List</button>

<br><br>

</div>



</div>

</body>
</html>