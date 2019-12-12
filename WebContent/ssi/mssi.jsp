<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.MemberDTO"%>
<%@ page import="utility.*"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");  

	List<MemberDTO> list=null;
	Iterator<MemberDTO> iter=null;
	boolean flag=false; 
	
	String upDir=application.getRealPath("/member/storage");
	String tempDir=application.getRealPath("/member/temp");
%> 