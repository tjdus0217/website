<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp" %>

<% int num=Integer.parseInt(request.getParameter("num"));
	flag=dao.checkRef(num);
%>


<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
 <style type="text/css">
 #red{
 color:red;
 }
 </style>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<% if(flag) { %>
	<div class="well well-lg">
	<p id="red">답글이 있으므로 삭제할 수 없습니다.</p>
	</div>
	
	<button type="button" class="btn btn-default" onclick="history.back()">Back</button>
	
<%}else{ %>
<br><h1 >Board Delete</h1><br>

<form class="form-horizontal" 
		action="deleteProc.jsp"
		method="post">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<div class="form-group">
<label class="control-label col-sm-2" for="passwd">  Password:</label>
<div class="col-sm-6">
<input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd" required="required">
</div>
</div>

<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>


    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">Confirm</button>
          <button type="reset" class="btn btn-default">Cancel</button>
     	
      </div>
    </div>
</form>
<%} %>

</div>

</body>
</html>