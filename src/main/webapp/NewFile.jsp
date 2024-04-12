
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int a = 7;
	System.out.print(a);
	%>

	<%!int b = 8;%>
	<%
	System.out.print(a);
	%>
	<%=a%>

</body>
</html>