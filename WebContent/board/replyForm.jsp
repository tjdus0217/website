<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	BoardDTO dto=dao.reply_read(num);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
 
 <script type="text/javascript">
 function input(){
	 
	 var f=document.frm;
	 
	 if(f.name.value.length==0){
		 alert("Enter Writer");
		 f.name.focus();
		 return
	 }
	 
	 if(f.subject.value.length==0){
		 alert("Enter Title");
		 f.subject.focus();
		 return
	 }
	 
	 if(f.content.value.length==0){
		 alert("Enter Content");
		 f.content.focus();
		 return
	 }
	 
	 if(f.passwd.value.length==0){
		 alert("Enter Password");
		 f.passwd.focus();
		 return
	 }
 
 	 f.submit();
 }
 
 </script>
 
 

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Board</h2><br>

<form class="form-horizontal" 
		action="replyProc.jsp"
		enctype="multipart/form-data"
		method="post"
		onsubmit="return input(this)">
		
<input type="hidden" name="num" value="<%=dto.getNum()%>">
<input type="hidden" name="ref" value="<%=dto.getRef()%>">
<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">

<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

<div class="form-group">

<label class="control-label col-sm-2" for="name">Writer:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="name" value="" name="name">
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
<textarea rows="12" cols="6" id="content" name="content" class="form-control"></textarea>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="filename">File: </label>
<div class="col-sm-6">
<input type="file" class="form-control" id="filename" name="filename" multiple="multiple">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="passwd">Password:</label>
<div class="col-sm-6">
<input type="password" class="form-control" id="passwd" placeholder="Enter 비밀번호" name="passwd">
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