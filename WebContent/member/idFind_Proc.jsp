<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>
<%
	
	String mname=request.getParameter("mname");
	String email=request.getParameter("email");
	
	Map map=new HashMap();
	map.put("mname", mname);
	map.put("email", email);
	
	String id=dao.findId(map);
%>




<!DOCTYPE html>
<html>
<head>
  <title>Member</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
<br><br>

<div class="well well=lg col-sm-offset-1 col-sm-4">

<% if(id!=null){ %>
	<a>당신의 아이디는 <%=id%>입니다. <br><br></a>
		
	<% }else { %>
	<a>가입된 회원이 아닙니다.<br><br></a>
	<button class="btn btn-default" onclick="location.href='agreement.jsp'">회원가입</button>
		
		
	<% } %>
</div>


<div class="col-sm-offset-2 col-sm-8">
       <button class="btn btn-default" onclick="location.href='idFind_Form.jsp'">다시시도</button>
       <button class="btn btn-default" onclick="window.close()">닫기</button>     
</div>


</body>
</html>