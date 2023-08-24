<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		int java = Integer.parseInt(request.getParameter("java"));
		int web = Integer.parseInt(request.getParameter("web"));
		int iot = Integer.parseInt(request.getParameter("iot"));
		int android = Integer.parseInt(request.getParameter("android"));
		
		double avg = (java+web+iot+android)/4.0;
	%>

	<fieldset>
			<legend>����Ȯ�����α׷�</legend>
			<table style="margin: auto; text-align:center;">
				<tr>
					<td>�̸�</td>
					<td><%= name %></td>
				</tr>
				<tr>
					<td>Java����</td>
					<td><%= java %></td>
				</tr>
			
				<tr>
					<td>Web����</td>
					<td><%= web %></td>
				</tr>
				<tr>
					<td>IoT����</td>
					<td><%= iot %></td>
				</tr>
				<tr>
					<td>Android����</td>
					<td><%=android%></td>
				</tr>
				<tr>
					<td>���</td>
					<td>
						
						<%= avg %>
				
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td>
						<strong>
						<%
							if(avg >=95 && avg <= 100)
								out.print("A+");
							else if(avg >= 85)
								out.print("A");
							else if(avg >= 80)
								out.print("B+");
							else if(avg >= 70)
								out.print("C");
							else
								out.print("F");
						%>
						</strong>
					
					</td>
				</tr>
			
			</table>
		
		
		</fieldset>
</body>
</html>