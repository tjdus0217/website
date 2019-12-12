<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>
<%
	String mname=(String)request.getAttribute("mname");  //B를 재요청했을때 생성되는 request
%>


<!DOCTYPE html>
<html>
<head>
  <title>B</title>
  <meta charset="utf-8">
 

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">

A.jsp에서 request에 저장한 name의 값<br>     <%//근데 response.SendRedirect()인 경우 A에 저장한 값은 B가 재요청되기 전에 response로 인해 이미 닫혀서 쓸 수 없어. 그래서 null이 됨 %>
<%=mname %><br> 					<%//forward로 요청한 경우 하나의 request가 닫히기 전이므로 A에 저장된 값까지 읽힐 수 있음. 단 요청페이지URL은 그대로 A%>

</div>
</div>

</body>
</html>