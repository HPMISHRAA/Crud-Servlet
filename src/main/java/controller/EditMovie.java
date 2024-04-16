package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dto.Movie;

@WebServlet("/edit-movie")
public class EditMovie extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("id"));
		MovieDao dao = new MovieDao();
		List<Movie> list = dao.fetchMovieById(no);
		req.setAttribute("list", list);
		req.getRequestDispatcher("Edit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String lang = req.getParameter("lang");
		String genre = req.getParameter("genre");
		int id = Integer.parseInt(req.getParameter("id"));
		Movie movie = new Movie();
		movie.setGenre(genre);
		movie.setLanguage(lang);
		movie.setName(name);
		MovieDao dao = new MovieDao();
		dao.editMovie(movie, id);
		resp.getWriter().print("<h1>Edited successfully</h1>");
		req.getRequestDispatcher("home.html").include(req, resp);
	}
}
