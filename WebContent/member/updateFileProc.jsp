<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>

<%  UploadSave upload = 
        new UploadSave(request,-1,-1,tempDir); 
       
    String id = upload.getParameter("id");
    String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
    
    FileItem fileItem = upload.getFileItem("fname");
    
    if(oldfile!=null && !oldfile.equals("member.jpg")){
       UploadSave.deleteFile(upDir, oldfile); 
    }
    
    String fname = UploadSave.saveFile(fileItem, upDir);
    
    Map map = new HashMap(); 
    map.put("id",id);
    map.put("fname",fname);
    
    flag = dao.updateFile(map);       
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
<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
<div class="well well-lg">
<%
   if(flag){
   out.print("사진수정을 성공했습니다.");
   }else{
   out.print("사진 수정을 실패했습니다.");
   }
%>
 
</div>
<button class="btn" onclick="location.href='read.jsp?id=<%=id%>'">나의정보</button>
<button class="btn" onclick="history.back()">다시시도</button>
</div>
</body> 
</html> 