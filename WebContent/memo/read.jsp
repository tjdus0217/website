<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<% 

	int memono = Integer.parseInt(request.getParameter("memono"));
	

	dao.upViewcnt(memono);
	MemoDTO dto=dao.read(memono);
	
	String content="";
	content=dto.getContent();
	content=content.replaceAll("\r\n", "<br>");

%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Memo</title>
  <meta charset="utf-8">

	<script type="text/javascript">

	  function listM(){
		  var url="list.jsp";
		  url+="?col=<%=request.getParameter("col")%>";
		  url+="&word=<%=request.getParameter("word")%>";
		  url+="&nowPage=<%=request.getParameter("nowPage")%>";
		  
		  location.href=url;
	  }
	  
	
	function updateM(){
	var url="updateForm.jsp";
	url += "?memono=<%=dto.getMemono()%>";
	  url+="&col=<%=request.getParameter("col")%>";
	  url+="&word=<%=request.getParameter("word")%>";
	  url+="&nowPage=<%=request.getParameter("nowPage")%>";

	location.href=url;
	}
	
	function deleteM(){
	      var url = "deleteForm.jsp";
	      url += "?memono=<%=dto.getMemono()%>";
	      url+="&col=<%=request.getParameter("col")%>";
		  url+="&word=<%=request.getParameter("word")%>";
		  url+="&nowPage=<%=request.getParameter("nowPage")%>";
	      
	      location.href=url;
	    }
	
	</script>

</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<br><h2>Memo Read</h2><br>
<div class="panel panel-default">

<div class="panel-heading">Title</div>
<div class="panel-body"><%=dto.getTitle() %></div>

<div class="panel-heading">Content</div>
<div class="panel-body"><%=content %></div>
 
<div class="panel-heading">ViewCount</div>
<div class="panel-body"><%=dto.getViewcnt() %></div>
 
<div class="panel-heading">Date</div>
<div class="panel-body"><%=dto.getWdate() %></div>

</div>


<div>
<button type="button" class="btn" onclick="deleteM()">Delete</button>
<button type="button" class="btn" onclick="location.href='./createForm.jsp'">Save</button>
<button type="button" class="btn" onclick="updateM()">Update</button>
<button type="button" class="btn" onclick="listM()">List</button>
</div>
 
</div>
</body> 
</html> 
