<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/bssi.jsp"%>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	bbsDTO dto=dao.read(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Bbs</title>
  <meta charset="utf-8">
  	<script type="text/javascript">
 	function input(f){
 		if(f.wname.value==''){
 			alert("작성자를 입력하세요.");
 			f.wname.focus();
 			return false;
 			}
 		if(f.title.value==''){
 			alert("제목을 입력하세요.");
 			f.title.focus();
 			return false;
 			}
 		if(f.content.value==''){
 			alert("내용을 입력하세요.");
 			f.content.focus();
 			return false;
 			}
 		if(f.passwd.value==''){
 			alert("비밀번호를 입력하세요.");
 			f.passwd.focus();
 			return false;
 			}
 	}
 	
 	</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">Bbs Update</h1>

<form class="form-horizontal" 
		action="updateProc.jsp"
		method="post"
		onsubmit="return input(this)">
		
<input type="hidden" name="bbsno" value="<%=bbsno%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<div class="form-group">
 
<label class="control-label col-sm-2" for="wname">writer:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="wname" value="<%=dto.getWname()%>" name="wname">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="title">Title:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="title" value="<%=dto.getTitle()%>" name="title">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="content">Content:</label>
<div class="col-sm-6">
<textarea rows="12" cols="6" id="content" name="content" class="form-control"><%=dto.getContent()%></textarea>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="pwd">Password:</label>
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