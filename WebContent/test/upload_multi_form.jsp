<%@ page contentType="text/html; charset=UTF-8" %> 



<!DOCTYPE html>
<html>
<head>
  <title>다중업로드</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">제목</h1>

<form class="form-horizontal" 
		action="upload_multi_proc.jsp"
		method="post"
		enctype="multipart/form-data">
		
<div class="form-group">
<label class="control-label col-sm-2" for="file1">① 파일명</label>
<div class="col-sm-6">
<input type="file" class="form-control" id="file1" name="file1">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="file2">② 파일명</label>
<div class="col-sm-6">
<input type="file" class="form-control" id="file2" name="file2">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="file3">③ 파일명</label>
<div class="col-sm-6">
<input type="file" class="form-control" id="file3" name="file3">
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="title">파일설명</label>
<div class="col-sm-6">
<input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="시원한 설악산 계곡">
</div>
</div>

<div class="form-group">        
<div class="col-sm-offset-2 col-sm-8">
<button type="submit" class="btn btn-default">등록</button>
</div>
</div>

</form>
</div>

</body>
</html>