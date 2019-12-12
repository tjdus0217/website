<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>


<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
<%
   flag = dao.update(dto);
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
<h1 class="col-sm-offset-2 col-sm-10">회원수정 확인</h1>
<div class="well well-lg">
<% 
if(flag){
out.print("회원수정을 성공했습니다.");
}else{
 
out.print("회원수정을 실패했습니다.");
}
 
%>
</div>
<button class="btn" onclick="location.href='read.jsp?id=<%=dto.getId()%>'">Member Profile</button>
<button class="btn" onclick="history.back()">Re-try</button>
 
 
</div>
</body> 
</html> 