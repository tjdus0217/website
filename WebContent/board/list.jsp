<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/board_ssi.jsp"%>
<%
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")) word="";
	
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage=5;
	
	int sno= (nowPage-1)*recordPerPage + 1;
	int eno= nowPage*recordPerPage;
	
	Map map=new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total=dao.total(map);
	list=dao.list(map);
	iter=list.iterator();
	
	String paging=Utility.paging(total, nowPage, recordPerPage, col, word);
	
%>

<!DOCTYPE html>
<html>
<head>
  <title>Board</title>
  <meta charset="utf-8">
 
 <script type="text/javascript">
 
 function read(num){
	  var url="read.jsp";
	  url+="?num="+num;
	  url+= "&col=<%=col%>";
	  url+= "&word=<%=word%>";
	  url+= "&nowPage=<%=nowPage%>";
	  location.href=url;   
 }
 

 function updateB(num){
 	 var url="updateForm.jsp";
 	 url+="?num="+num;
 	 url+="&col=<%=col%>";
 	 url+="&word=<%=word%>";
 	 url+="&nowPage=<%=nowPage%>";
 	 location.href=url;
 	 }

 function replyB(num){
 	 var url="replyForm.jsp";
 	 url+="?num="+num;
 	 url+="&col=<%=col%>";
 	 url+="&word=<%=word%>";
 	 url+="&nowPage=<%=nowPage%>";
 	 location.href=url;
 	 }
 	 
 
 function downFile(filename){
	 var url="<%=root%>/download";
	 url += "?dir=/board/storage";
	 url += "&filename="+filename;
	 
	 location.href=url;
	 
 }
  
 </script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<br><h2>Board List</h2>

<form class="form-inline" 
		action="./list.jsp"
		method="post">	
<div class="form-group">

	<select class="form-control" name="col">
		<option value="name"
			<% if(col.equals("name")) out.print("selected"); %>	
		>Writer</option>
		<option value="subject"
			<% if(col.equals("subject")) out.print("selected"); %>	
		>Title</option>
		<option value="content"
			<% if(col.equals("content")) out.print("selected"); %>	
		>Content</option>
		<option value="total"
			<% if(col.equals("total")) out.print("selected"); %>	
		>All</option>
	</select>
</div>

<div class="form-group">
<input type="text" class="form-control" value="<%=word %>" name="word">
</div>


  <button type="submit" class="btn btn-default">Search</button>
  <button type="button" class="btn btn-default" onclick="location.href='./createForm.jsp'">Write</button>

</form>

<table class="table table-striped">
	<thead>
		<tr>
			<th>No.</th>
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th>
			<th>View</th>
			<th>Ref</th>
			<th>Indent</th>
			<th>Ans</th>
			<th>File</th>
			<th>Update</th>
			<th>Reply</th>
			
		</tr>
	</thead>
	
	<tbody>
	
	<%
		if(list.size()==0){ 
	%>
	<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
	<%		
		} else{
			while(iter.hasNext()){
				BoardDTO dto=iter.next();
	%>
		
		<tr>
			<td><%=dto.getNum() %></td>
			
			<td>
			<%
			for(int r=0;r<dto.getIndent();r++){
				out.println("&nbsp&nbsp");
			}
			
			if(dto.getIndent()>0){
				out.print("<img src='../images/re.jpg'>");
			}
			%>
						
			<a href="javascript:read('<%=dto.getNum()%>')"><%=dto.getSubject() %></a>
			
			<%if(Utility.compareDay(dto.getRegdate())){ %>
				<img src="<%=root %>/images/new.gif">
			<%} %> 	
			</td>
			
			<td><%=dto.getName() %></td>			
			<td><%=dto.getRegdate() %></td>
			<td><%=dto.getCount() %></td>
			<td><%=dto.getRef()%></td>
			<td><%=dto.getIndent()%></td>
	 		<td><%=dto.getAnsnum()%></td>
	 		
			<td><%
				if(dto.getFilename()==null){
					out.print(" ");
				}else{ %>
					<a href="javascript:downFile('<%=dto.getFilename() %>')"><%=dto.getFilename() %></a>
			<% }				
				%></td>
			<td><a href="javascript:updateB('<%=dto.getNum()%>')">Update</a></td> 
			<td><a href="javascript:replyB('<%=dto.getNum()%>')">Reply</a></td>
				
				
		</tr>
	
	<%	
			} 
		}
	%>
	
	</tbody>
	
</table>

<div><%=paging %></div>

</div>

</body>
</html>