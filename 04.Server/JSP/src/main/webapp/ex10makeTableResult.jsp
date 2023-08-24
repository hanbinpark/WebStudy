<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	p{
		text-align:center;
	}
</style>

</head>
<body>
	<%
			int c = Integer.parseInt(request.getParameter("c"));
			int r = Integer.parseInt(request.getParameter("r"));
	%>
	
	<p><%=c %>층</p>
	<p><%=r %>방</p>
	
	<table border="1" style="margin: auto;">
		<%
			
			for(int i=0; i<c; i++){
				out.print("<tr>");
				for(int j=0; j<r; j++){
					out.print("<td>"+j+"</td>");
				}
				out.print("</tr>");
			}
		%>
		
	
	</table>




</body>
</html>