<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id=request.getParameter("id");

	boolean flag=dao.duplicatedId(id);
	
	String str="";
	
	if(flag){
%>		
				
		{str:"<%=id%>는 중복으로 사용할 수 없는 아이디입니다."}
		
<%		
	}else{
%>	
		
		{str:"<%=id%>는 중복이 아니므로 사용할 수 있습니다."}
		
<%		
	}
	
	out.print(str);

%>