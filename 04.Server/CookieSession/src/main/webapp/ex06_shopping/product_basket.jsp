<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>��ٱ���</h1>
	
	<fieldset>
		<legend>��ǰ����Ʈ</legend>
		<!-- 
			��Ű�� ����� ��ǰ���� ����ϴ� ����� �����Ͻÿ�. 
			- "product" -> "��ǰ"��ȯ (replace() Ȱ��)
		 -->
		<ul>
		<%
	
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i = 0; i<cookies.length; i++){
				// JSESSIONID�� ������ ��Ű������ ���
				if(cookies[i].getName().contains("product")){
					String product = cookies[i].getValue().replace("product", "��ǰ");
					out.print("<li>"+product+"</li>");
				}
			}
		}
		%>
		</ul>
		
	
	</fieldset>
	<p><a href="product_list.jsp">��Ӽ����ϱ�</a></p>
	<p><a href="product_deleteAll.jsp">����ǰ����</a></p>
</body>
</html>