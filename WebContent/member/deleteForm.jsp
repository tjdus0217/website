<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
    String id = request.getParameter("id");
    String oldfile = request.getParameter("oldfile");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Member</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Member Delete</h2>
<br>
<form class="form-horizontal" 
      action="deleteProc.jsp"
      method="post"
      >
 
  <input type="hidden" name="id" value="<%=id %>">
  <input type="hidden" name="oldfile" value="<%=oldfile %>">
  
  <div class="form-group">
     <label class="col-sm-offset-2 col-sm-8">
    탈퇴를 하시면 더이상 컨텐츠를 제공받을 수 없습니다<br>
    그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요  
    </label>
    
  </div>
  <br>   
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">Confirm</button>
    <button type="button" class="btn btn-default" onclick="history.back()">Cancel</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 