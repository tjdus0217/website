<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>
<%
	
	String mname=request.getParameter("mname");
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	
	Map map=new HashMap();
	map.put("mname", mname);
	map.put("id", id);
	map.put("email", email);
	
	String passwd=dao.findPasswd(map);
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

<% if(passwd!=null){ %>
	<a>당신의 비밀번호는 <%=passwd%>입니다. <br><br></a>
		
	<% }else { %>
	<a>입력된 정보에 일치하는 회원이 없습니다.<br><br></a>		
		
	<% } %>
</div>


<div class="col-sm-offset-2 col-sm-8">
       <button class="btn btn-default" onclick="location.href='passwdFind_Form.jsp'">다시시도</button>
       <button class="btn btn-default" onclick="window.close()">닫기</button>     
</div>


</body>
</html>