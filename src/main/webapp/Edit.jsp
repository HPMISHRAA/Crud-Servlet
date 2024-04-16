<%@page import="dto.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Movies</title>
</head>
<body>
	<h1>Edit Movies</h1>
	<%
	List<Movie> list = (List<Movie>) request.getAttribute("list");
	for (Movie movie : list) {
	%>
	<form action="edit-movie" method="post">
		Id: <input type="number" name="id" value="<%=movie.getId()%>"><br>
		<br> Name: <input type="text" name="name"
			value="<%=movie.getName()%>"><br> <br> Genre: <input
			type="text" name="lang" value="<%=movie.getLanguage()%>"> <br>
		<br>Language: <input type="text" name="genre"
			value="<%=movie.getGenre()%>"><br> <br> <input
			type="submit" value="Submit">
	</form>
	<%
	}
	%>
</body>
</html>
