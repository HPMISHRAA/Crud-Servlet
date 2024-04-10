package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MovieDao;
import dto.Movie;

@WebServlet("/insert-movie")
@MultipartConfig
public class InsertMovie extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("insert.html").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String lang = req.getParameter("language");

		Part picture = req.getPart("picture"); // getPart is a method use to receive the image
		String genre = req.getParameter("genre");
		try {
			double rating = Double.parseDouble(req.getParameter("rating"));

			Movie movie = new Movie();
			movie.setName(name);
			movie.setLanguage(lang);
			movie.setGenre(genre);
			movie.setRating(rating);
			byte[] image = new byte[picture.getInputStream().available()];
			picture.getInputStream().read(image);

//			byte[] image = new byte[(int) picture.getSize()];
//			picture.getInputStream().read(image);
			movie.setPicture(image);

			MovieDao dao = new MovieDao();
			dao.savemovie(movie);

		} catch (NumberFormatException e) {
			resp.getWriter().print("<h1 align='center'>Enter proper Rating </h1>");
			req.getRequestDispatcher("insert.html").include(req, resp);
		}

	}
}
