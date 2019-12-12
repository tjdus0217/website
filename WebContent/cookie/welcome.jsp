<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	Cookie[] cookies=request.getCookies();
	Cookie cookie=null;
	
	String sw=null;
	
	if(cookies!=null){
		for(int i=0; i<cookies.length;i++){
			cookie=cookies[i];
			
			if(cookie.getName().equals("sw")){
				sw=cookie.getValue();
			}
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
  <title>쿠키</title>
  <meta charset="utf-8">
 <link href="../css/style.css" rel="Stylesheet" type="text/css"> 
</head>

<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<%
	if(sw!=null){
		out.println("재 접속을 환영합니다."+"<br>");
	}else{
		out.println("처음 접속 하셨군요!!"+"<br>");
		
		Cookie wcookie=null;
		
		wcookie=new Cookie("sw","1");
		wcookie.setMaxAge(60);
		
		 response.addCookie(wcookie);
		
	}


%>
<br><br>
  <A href='./welcome.jsp'>Server 접속</A>
</div>

</body>
</html>