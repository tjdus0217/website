<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>

<%
	String id=request.getParameter("id");	
	String pw=request.getParameter("passwd");

	Map map=new HashMap();
	map.put("id", id);
	map.put("pw", pw);

	flag=dao.loginCheck(map);  //여기면 flag 가 true
	
	if(flag){
		String grade=dao.getGrade(id);
		
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		Cookie cookie=null;
		
		String c_id=request.getParameter("c_id");
		
		if(c_id !=null){
			cookie=new Cookie("c_id", "Y");
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
			
			cookie=new Cookie("c_id_val", id);
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
		}else{    //check를 푼 경우, 기존 쿠키의 유지값을 0으로 바꿔서 없애는 것
			cookie=new Cookie("c_id", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
			cookie=new Cookie("c_id_val", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
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
<br><h2>Sign-in</h2><br>

<div class="well well-lg">
<%
	if(flag){
		out.print("로그인을 성공하였습니다.");
	}else{
		out.print("아이디 또는 비밀번호가 잘못 입력하였거나<br>");
		out.print("회원이 아닙니다. 회원가입을 해주세요.");
	}
%>
</div>

<button class="btn btn-default" onclick="location.href='../index.jsp'">Home</button>
<button class="btn btn-default" onclick="history.back()">Re-Try</button>


</div>

</body>
</html>