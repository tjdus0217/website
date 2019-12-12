<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	Cookie[] cookies=request.getCookies();
	Cookie cookie=null;
	
	String name=null;
	int kuk=0;
	int eng=0;
	
	for(int i=0; i<cookies.length;i++){
		cookie=cookies[i];
		
		if(cookie.getName().equals("name")){
			name=cookie.getValue();
		}else if(cookie.getName().equals("kuk")){
			kuk=Integer.parseInt(cookie.getValue());
		}else if(cookie.getName().equals("eng")){
			eng=Integer.parseInt(cookie.getValue());
		}
	}

%>


<!DOCTYPE html>
<html>
<head>
  <title>쿠키 읽기</title>
  <meta charset="utf-8">
 <link href="../css/style.css" rel="Stylesheet" type="text/css">  

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<%
	if(name!=null){
		out.print("성명: "+name+"<br>");
		out.print("국어: "+kuk+"<br>");
		out.print("영어: "+eng+"<br>");
		out.print("총점: "+(kuk+eng)+"<br>");
		out.print("평균: "+(kuk+eng)/2+"<br>");
		out.print("30초 후 이 쿠키는 인식되지 않습니다."+"<br>");
	} else{
		out.println("쿠키를 읽어올 수 없습니다."+"<br>");
	}

%>



</div>

</body>
</html>