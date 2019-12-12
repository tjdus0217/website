<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/mssi.jsp"%>


<% 
	String name="홍길동";
	
	request.setAttribute("mname", name);     //A를 요청했을때 생성되는 request
	
	//b페이지로 이동(response.SendRedirect())
	//response.sendRedirect("B.jsp");

	
%>

	<%//B페이지로 이동(forward)  %>
	<jsp:forward page="B.jsp"/>   