<%@page import="dto.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Movies</title>
</head>
<body>
	<%
	List<Movie> list = (List<Movie>) request.getAttribute("list");
	%>

	<table border="1 px" align="center">
		<tr>
			<th>Name</th>
			<th>Image</th>
			<th>Language</th>
			<th>Genre</th>
			<th>Rating</th>
			<th>Edit</th>
			<th>Delete</th>

		</tr>
		<%
		for (Movie movie : list) {
		%>
		<tr>
			<td><%=movie.getName()%></td>
			<td><img height="75px" width="75px" alt="<%=movie.getName()%> "></td>
			<td><%=movie.getLanguage()%></td>
			<td><%=movie.getGenre()%></td>
			<td><%=movie.getRating()%></td>
			<td><button>Edit</button></td>
			<td><button>Delete</button></td>

		</tr>
		<%
		}
		%>
	</table>
</body>
</html>