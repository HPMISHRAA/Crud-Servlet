<%@page import="org.apache.commons.codec.binary.Base64"%>
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
			<td><img height="75px" width="75px" alt="<%=movie.getName()%> "
				src="data:image/jpeg;base64, <%=Base64.encodeBase64String(movie.getPicture())%>"></td>
			<td><%=movie.getLanguage()%></td>
			<td><%=movie.getGenre()%></td>
			<td><%=movie.getRating()%></td>
			<td><a href="edit-movie?id=<%=movie.getId()%>"><button>Edit</button></a></td>
			<td><a href="delete-movie?id=<%=movie.getId()%>">
					<button>Delete</button>
			</a></td>

		</tr>
		<%
		}
		%>
	</table>
	<br>
	<div align='center'>
		<a href="home.html"><button>Back</button></a>
	</div>
</body>
</html>