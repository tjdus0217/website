<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%> 

<%
	String id=request.getParameter("id");
	
	if(id==null) {
		id= (String)session.getAttribute("id");
	}

	MemberDTO dto=dao.read(id);
	
	String grade=(String)session.getAttribute("grade");
%>


<!DOCTYPE html>
<html>
<head>
  <title>Member</title>
  <meta charset="utf-8">
 
 <script type="text/javascript">
 function deleteM(){
	 var url="deleteForm.jsp";
	 url+="?id=<%=id%>";
	 url+="&oldfile=<%=dto.getFname()%>";
	 
	 location.href=url;
 }
 
 function updateM(){
	 var url="updateForm.jsp";
	 url+="?id=<%=id%>";
	 url+="&oldfile=<%=dto.getFname()%>";
	 
	 location.href=url;
 }
 
 function updateFile(){
	 var url="updateFileForm.jsp";
	 url+="?id=<%=id%>";
	 url+="&oldfile=<%=dto.getFname()%>";
	 
	 location.href=url;
 }
 
 function updatePW(){
	 var url="updatePwForm.jsp";
	 url+="?id=<%=id%>";
	 url+="&passwd=<%=dto.getPasswd()%>";
	 
	 location.href=url;
 }
 
 
 
 <% //뭐  더 있어야 함 %>
 
 </script>
 

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br>
<h2><%=dto.getMname() %> Profile</h2><br>

<table class="table table-bordered">
<tr>
	<td colspan="2" style="text-align: center">
		<img src="<%=root%>/member/storage/<%=dto.getFname() %>" width="250px" height="250px" class="img-rounded">
	</td>
</tr>
<tr>
	<th>ID</th>
	<td><%=dto.getId() %></td>
</tr>

<tr>
	<th>Name</th>
	<td><%=dto.getMname() %></td>
</tr>

<tr>
	<th>E-mail</th>
	<td><%=dto.getEmail() %></td>
</tr>

<tr>
	<th>Phone</th>
	<td><%=dto.getTel() %></td>
</tr>

<tr>
	<th>Zip-code</th>
	<td><%=dto.getZipcode() %></td>
</tr>

<tr>
	<th>Address</th>
	<td><%=dto.getAddress1() %><%=dto.getAddress2() %></td>
</tr>

<tr>
	<th>Job</th>
	<td>Job-code:<%=dto.getJob() %>(<%=Utility.getCodeValue(dto.getJob()) %>)</td>
</tr>

<tr>
	<th>Date</th>
	<td><%=dto.getMdate() %></td>  
</tr>

</table>

<div style="text-align: center">
<button class="btn btn-default" onclick="updateM()">Update</button>
<% if(id != null && !grade.equals("A")) { %>
<button class="btn btn-default" onclick="updateFile()">Update Pic</button>
<button class="btn btn-default" onclick="updatePW()">Update Pwd</button>
<button class="btn btn-default" onclick="deleteM()">Delete</button>
<button class="btn btn-default" 
 onclick="location.href='<%=request.getContextPath() %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">Download</button>


<%} %>
<% if(id != null && grade.equals("A")) { %>
<button class="btn btn-default" onclick="location.href='<%=root%>/member/list.jsp'">List</button>
<%} %>



<br><br><br>
</div>
</div>
</body>
</html>