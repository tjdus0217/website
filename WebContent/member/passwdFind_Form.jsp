<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
    String mname = request.getParameter("mname");
	String id = request.getParameter("id");
    String email = request.getParameter("email");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Member</title>
  <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	#red{
	color:red; 
	}	
	</style>  

</head>
<body>

<div class="container">
<h>비밀번호찾기</h>

<form class="form-horizontal" 
		action="passwdFind_Proc.jsp"
		method="post">
		
<div class="form-group">
<label class="control-label col-sm-2" for="mname">Name:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="mname" placeholder="Enter Name" name="mname" required="required">
</div>
</div>
	
<div class="form-group">
<label class="control-label col-sm-2" for="id">ID:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="id" placeholder="Enter ID" name="id" required="required">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="email">E-mail:</label>
<div class="col-sm-6">
<input type="email" class="form-control" id="email" placeholder="Enter E-mail" name="email" required="required">
</div>
</div>

<div class="form-group">        
<div class="col-sm-offset-2 col-sm-8">
<button type="submit" class="btn btn-default">Confirm</button>
<button type="reset" class="btn btn-default">CancelS</button>
</div>
</div>

</form>
</div>

</body>
</html>