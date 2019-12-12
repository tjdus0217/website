<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>

<% 
   int memono = Integer.parseInt(request.getParameter("memono"));
	MemoDTO dto=dao.read(memono);
%> 
 
   
<!DOCTYPE html> 
<html> 
<head>
  <title>Memo</title>
  <meta charset="utf-8">
  
  <script type="text/javascript">
  function input(){
	  var f=document.frm;
	 
		 if(f.title.value.length==0){
			 alert("제목을 입력하세요");
			 f.title.focus();
			 return
		 }
		 
		 if(f.content.value.length==0){
			 alert("내용을 입력하세요");
			 f.content.focus();
			 return
		 }
	 	 f.submit();
  }
  
  </script>
  
</head>



<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h1>Memo Update</h1><br>
<form class="form-horizontal" 
      action="updateProc.jsp"
      method="post"
      name="frm"
      >
  <input type="hidden" name="memono" value="<%=dto.getMemono() %>">     
  <input type="hidden" name="col" value="<%=request.getParameter("col") %>">  
  <input type="hidden" name="word" value="<%=request.getParameter("word") %>">
   <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">Title</label>
    <div class="col-sm-6">
      <input type="text" name="title" 
      id="title" class="form-control" value="<%=dto.getTitle()%>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">Content</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="content" 
    name="content" class="form-control"><%=dto.getContent()%></textarea>
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button type="button" class="btn btn-default" onclick="input()">Update</button>
    <button type="reset" class="btn">Cancel</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 

