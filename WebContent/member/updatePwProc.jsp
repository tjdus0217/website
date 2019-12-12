<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp" %> 

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("passwd");
    
    Map map = new HashMap();    
    map.put("id",id);
    map.put("pw",pw);
    
   flag = dao.updatePw(map); 
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
<br><h2>Password Update</h2><br>
<div class="well well-lg">
<%
   if(flag){
   out.print("비밀번호를 변경했습니다.");
   }else{
   out.print("비밀번호 변경을 실패했습니다.");
   }
 
%>
 
</div>
<button class="btn" onclick="location.href='loginForm.jsp'">Sign-in</button>
<button class="btn" onclick="history.back()">Try-Again</button>
 
 
 
</div>
</body> 
</html> 