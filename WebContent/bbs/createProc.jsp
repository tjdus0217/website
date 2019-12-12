<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/bssi.jsp"%>
<jsp:useBean id="dto" class="bbs.bbsDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
flag=dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Bbs</title>
  <meta charset="utf-8">
 
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<div class="well well-lg">

<% if(flag==true){
	out.print("성공");
	}else{
	out.print("실패");
	}
	%>
</div>

<button onclick="location.href='./createForm.jsp'" class="btn btn-defalut">Try Again</button>
<button onclick="location.href='./list.jsp'" class="btn btn-defalut">List</button>

</div>
</body>
</html>