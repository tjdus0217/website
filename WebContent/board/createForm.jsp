<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
 

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Board Write</h2><br>

<form class="form-horizontal" 
		action="createProc.jsp"
		method="post"
		enctype="multipart/form-data"
		>
	
<div class="form-group">
<label class="control-label col-sm-2" for="name">Writer: </label>
<div class="col-sm-6">
<input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required="required">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="subject">Title: </label>
<div class="col-sm-6">
<input type="text" class="form-control" id="subject" placeholder="Enter Subject" name="subject" required="required">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="content">Content: </label>
<div class="col-sm-6">
<textarea rows="5" class="form-control" cols="30" name="content" placeholder="Enter Content"required="required"></textarea>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="passwd">Password:</label>
<div class="col-sm-6">
<input type="password" class="form-control" id="passwd" placeholder="Enter passwd" name="passwd" required="required">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="filename">file: </label>
<div class="col-sm-6">
<input type="file" class="form-control" id="filename" name="filename" multiple="multiple">
</div>
</div>

<br>
   
<div class="form-group">        
<div class="col-sm-offset-2 col-sm-8">
<button type="submit" class="btn btn-default">Save</button>
<button type="reset" class="btn btn-default">Cancel</button>
</div>
</div>
    
</form>
</div>
<br><br>
</body>
</html>