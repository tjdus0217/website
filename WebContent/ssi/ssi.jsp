<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="memo.MemoDTO"%>

<%@ page import="java.util.*" %>
<%@ page import="utility.Utility"%>
<jsp:useBean id="dao" class="memo.MemoDAO"/>

<%
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8"); 

	List<MemoDTO> list=null;
	Iterator<MemoDTO> iter=null;
	boolean flag=false;
    		
    
%> 