<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");

  String root=request.getContextPath();
  
  String id=(String)session.getAttribute("id");
  String grade=(String)session.getAttribute("grade");
  
  String str="";
  
  if(id != null && grade.equals("A")){
	  str="	관리자 페이지 입니다.";
  }else if(id != null && !grade.equals("A")){
	  str="	안녕하세요." + id + "님!";
  }
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Memo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

  <script type="text/javascript" src="<%=root%>/ajaxError.js"></script>

 
	<style type="text/css">
	#grade{
	color : orange;
	}
	
	</style>

</head> 
<body> 
<div class="container">
 
  <div class="page-header row">
   <div class="col-sm-4">
    <img src="<%=root%>/menu/img_chania.jpg" class="img-responsive img-thumbnail" alt="Cinque Terre" >
   </div>
   <div class="col-sm-8"><h1>Homepage</h1></div><br>     
   
	<p id="grade"><%=str %></p>
		   
  </div>
  <ul class="nav nav-tabs">
    
   
    
    
    <li class="active"><a href="<%=root%>/index.jsp">Home</a></li>
   
 <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Board <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/board/list.jsp">Board List</a></li>
        <li><a href="<%=root%>/board/createForm.jsp">Board Write</a></li>                      
      </ul>
    </li>



	<li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Memo <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/memo/list.jsp">Memo List</a></li>
        <li><a href="<%=root%>/memo/createForm.jsp">Memo Write</a></li>                      
      </ul>
    </li>
    
    
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Bbs<span class="caret"></span></a>
  
   <ul class="dropdown-menu">
   	<li><a href="<%=root%>/bbs/list.jsp">Bbs List</a></li>
    <li><a href="<%=root%>/bbs/createForm.jsp">Bbs Write</a></li>
   </ul>
   </li>
   
   <%if(id==null){ %>
    <li><a href="<%=root%>/member/agreement.jsp">Join</a></li>
    <li><a href="<%=root%>/member/loginForm.jsp">Sign-in</a></li>
  
    <%} else{%>
   
    <li><a href="<%=root%>/member/read.jsp">Profile</a></li>
	    <% if(id != null && grade.equals("A")){ %>
	   <li><a href="<%=root%>/admin/list.jsp">Member List</a></li>
	   <% } %>
    <li><a href="<%=root%>/member/logout.jsp">Sign-out</a></li>
   
   <%} %>
   
   
  </ul>  
  
</div>
</body> 
</html> 