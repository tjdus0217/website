<%@ page contentType="text/html; charset=UTF-8" %> 

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
<br><h2>Bbs Write</h2><br>

<form class="form-horizontal" 
		action="createProc.jsp"
		method="post"
		onsubmit="return input(this)">
		
<div class="form-group">
<label class="control-label col-sm-2" for="wname">Writer:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="wname" placeholder="Enter 작성자" name="wname">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="title">Title:</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="title" placeholder="Enter 제목" name="title">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="content">Content:</label>
<div class="col-sm-6">
<textarea rows="12" cols="6" id="content" name="content" class="form-control"></textarea>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="pwd">Password:</label>
<div class="col-sm-6">
<input type="password" class="form-control" id="pwd" placeholder="Enter 비밀번호" name="passwd">
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