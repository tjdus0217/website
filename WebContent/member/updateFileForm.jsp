<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>

<%
    String id = request.getParameter("id");
    String oldfile= request.getParameter("oldfile");
%> 

<!DOCTYPE html>
<html>
<head>
  <title>Member</title>
  <meta charset="utf-8">
 

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Update Picture</h2><br>

<form class="form-horizontal" 
		action="updateFileProc.jsp"
		method="post"
		enctype="multipart/form-data">
		
<input type="hidden" name="id" value="<%=id%>">		
<input type="hidden" name="oldfile" value="<%=oldfile%>">

<div class="form-group">
<label class="control-label col-sm-2" for="oldfile">Original</label>
<div class="col-sm-6">
<img src="./storage/<%=oldfile%>" class="img-rounded" width="200px" height="200px">
</div>
</div>
<div class="form-group">
    <label class="control-label col-sm-2" for="fname">New</label>
    <div class="col-sm-6">
    <input type="file" name="fname" class="form-control" 
    accept=".png,.jpg,.gif" required="required">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">Save</button>
    <button type="button" class="btn" onclick="history.back()">Cancel</button>
   </div>
 </div>
</form>
</div>

</body> 
</html> 