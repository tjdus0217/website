<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="utility.Utility"%>
<%@ page import="java.util.*" %>

<jsp:useBean id="dao" class="bbs.bbsDAO"/>

<%
	 String root=request.getContextPath();
	request.setCharacterEncoding("utf-8"); 

	List<bbsDTO> list=null;
	Iterator<bbsDTO> iter=null;
	boolean flag=false;
    		
    
%> 