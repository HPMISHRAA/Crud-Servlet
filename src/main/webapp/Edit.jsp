<%@page import="dto.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Movies</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: goldenrod;
	text-align: center;
}

form {
	text-align: left;
	margin-top: 20px;
}

label {
	font-weight: bold;
}

select, input[type="text"], input[type="file"] {
	padding: 8px;
	width: 100%;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	padding: 10px 20px;
	background-color: goldenrod;
	color: #fff;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
}

button:hover {
	background-color: #d4af37;
}

.back-button {
	display: block;
	margin-top: 20px;
	text-align: center;
	text-decoration: none;
	color: #333;
}

.back-button:hover {
	color: #666;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Edit Movies</h1>
		<form action="edit-movie" method="post" enctype="multipart/form-data">
			<%
			Movie movie = (Movie) request.getAttribute("movie");
			%>
			<input type="hidden" name="id" value="<%=movie.getId()%>"> <label
				for="name">Movie Name:</label><br> <input type="text" id="name"
				name="name" value="<%=movie.getName()%>" required><br>
			<label for="language">Language:</label><br> <select
				id="language" name="language" required>
				<option selected value="<%=movie.getLanguage()%>"><%=movie.getLanguage()%></option>
				<option value="English">English</option>
				<option value="Hindi">Hindi</option>
				<option value="Bhojpuri">Bhojpuri</option>
			</select><br> <label for="rating">Rating:</label><br> <input
				type="text" id="rating" name="rating" value="<%=movie.getRating()%>"
				required><br> <label for="picture">Image:</label><br>
			<input type="file" id="picture" name="picture"><br> <label
				for="genre">Genre:</label><br> <select id="genre" name="genre"
				required>
				<option selected value="<%=movie.getGenre()%>"><%=movie.getGenre()%></option>
				<option>Horror</option>
				<option>Comedy</option>
				<option>Action</option>
				<option>Thriller</option>
			</select><br>
			<br>
			<button type="submit">Update</button>
		</form>
		<a href="javascript:history.back()" class="back-button">Back</a>
	</div>
</body>
</html>
