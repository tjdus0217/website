<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>업로드</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
 
<h1 class="col-sm-offset-2 col-sm-10">글등록</h1>
  <form class="form-horizontal" 
        action="createProc_bean.jsp"
        method="post"
        enctype="multipart/form-data">
        
        
    <div class="form-group">
      <label class="control-label col-sm-2" for="fname">파일명</label>
      <div class="col-sm-6">
        <input type="file" class="form-control" id="fname" name="filename" multiple="multiple">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="title" placeholder="Enter title" 
        name="title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">내용</label>
      <div class="col-sm-6">          
    <textarea rows="5" class="form-control" cols="30" name="content"></textarea>
        </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="etc">참고</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="etc" placeholder="Enter etc" 
        name="etc">
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