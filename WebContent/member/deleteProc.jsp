<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>

<%
    String id = request.getParameter("id");
    String oldfile = request.getParameter("oldfile");
    
   flag = dao.delete(id);
    
   if(flag){
	   session.invalidate();
	   
   }
    if(flag && !oldfile.equals("member.jpg")){
      UploadSave.deleteFile(upDir, oldfile);
    }
 
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
<h2 class="col-sm-offset-2 col-sm-10">회원탈퇴</h2>
<div class="well well-lg">
<%
   if(flag){
   out.println("탈퇴되었습니다. 자동 로그아웃됩니다.");
   }else{
   out.println("회원탈퇴가 실패되었습니다.");
   }
 
%>
 
</div>
<button class="btn" onclick="location.href='<%=root%>/index.jsp'">홈</button>
<button class="btn" onclick="history.back()">다시시도</button>
</div> 
</body> 
</html> 
