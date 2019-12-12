<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 


<!DOCTYPE html> 
<html> 
<head>
  <title>Memo</title>
  <meta charset="utf-8">
 
 <script type="text/javascript">
 function input(f){
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
	 
 }
 
 </script>
 
 
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<br><h2>Memo Write</h2><br>
<form class="form-horizontal"
	action="createProc.jsp"
	method="post"
	onsubmit="return input(this)">
	
	<div class="form-group">
	<label class="control-label col-sm-2" for="title">Title</label>
	<div class="col-sm-6">
	<input type="text" name="title" id="title" class="form-control">
	</div>	
	</div>
	
	<div class="form-group">
	<label class="control-label col-sm-2" for="content">Content</label>
	<div class="col-sm-6">
	<textarea rows="5" cols="30" id="content" name="content" class="form-control"></textarea>
	</div>
	</div>
	
	<div class="form-group">
	<div class="col-sm-offset-2 col-sm-5">
	<button type="submit" class="btn btn-default">Save</button>
	<button type="reset" class="btn">Cancel</button>
	</div>
	</div>	
	</form>


</div>
</body> 
</html> 