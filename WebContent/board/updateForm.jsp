<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	BoardDTO dto=dao.read(num);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
  	<script type="text/javascript">
 	function input(f){
 		if(f.name.value==''){
 			alert("Enter Writer");
 			f.name.focus();
 			return false;
 			}
 		if(f.subject.value==''){
 			alert("Enter Title");
 			f.subject.focus();
 			return false;
 			}
 		if(f.content.value==''){
 			alert("Enter Content");
 			f.content.focus();
 			return false;
 			}
 		if(f.passwd.value==''){
 			alert("Enter Password");
 			f.passwd.focus();
 			return false;
 			}
 	}
 	
 	</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h1>Board</h1><br>

<form class="form-horizontal" 
		action="updateProc.jsp"
		method="post"
		enctype="multipart/form-data"
		onsubmit="return input(this)">
		
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<div class="form-group">
 
<label class="control-label col-sm-2" for="name">Writer:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="name" value="<%=dto.getName()%>" name="name">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="subject">Title:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="subject" value="<%=dto.getSubject()%>" name="subject">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="content">Content:</label>
<div class="col-sm-6">
<textarea rows="12" cols="6" id="content" name="content" class="form-control"><%=dto.getContent()%></textarea>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="passwd">Password:</label>
<div class="col-sm-6">
<input type="password" class="form-control" id="passwd" placeholder="Enter 비밀번호" name="passwd">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="filename">File: </label>
<div class="col-sm-6">
<input type="file" class="form-control" id="filename" name="filename" multiple="multiple">
</div>
</div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">Save</button>
         <button type="reset" class="btn btn-default">Cancel</button>
      </div>
    </div>
</form>
</div>

</body>
</html>