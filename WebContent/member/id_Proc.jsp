<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>
<%
	String id=request.getParameter("id");
	flag=dao.duplicatedId(id);
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

	
 	<script type="text/javascript">
 	function use(){
 		opener.frm.id.value='<%=id%>';
 		self.close();
 	}
 	
 	</script>
 

</head>
<body>

<div class="container">
<br><br>

<div class="well well=lg col-sm-offset-1 col-sm-4">
<br> 
입력된 아이디: <%=id %><br><br>

<% if(flag){
		out.print("중복된 아이디는 사용할 수 없습니다. <br><br>");
	}else {
		out.print("중복아님, 사용가능합니다.<br><br>");
		out.print("<button class='btn btn-default' onclick='use()'>사용</button>");
	}	
	%>
</div>


<div class="col-sm-offset-2 col-sm-8">
       <button class="btn btn-default" onclick="location.href='id_Form.jsp'">다시시도</button>
       <button class="btn btn-default" onclick="window.close()">닫기</button>     
</div>


</body>
</html>