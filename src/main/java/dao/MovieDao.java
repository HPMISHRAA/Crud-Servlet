package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Movie;

public class MovieDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("hari");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public void savemovie(Movie movie) {
		transaction.begin();
		manager.persist(movie);
		transaction.commit();
	}

	public List<Movie> fetchMovies() {
//		return manager.createNativeQuery("select * from Movie", Movie.class).getResultList();   //this method is used to write sql query
		return manager.createQuery("select x from Movie x").getResultList();
	}

	public List<Movie> fetchMoviesByName(String name) {
		return manager.createQuery("select x from Movie x where name=?1").setParameter(1, name).getResultList();
	}

	public List<Movie> fetchMovieById(int no) {
		return manager.createQuery("select x from Movie x where id=?5").setParameter(5, no).getResultList();
	}

	public List<Movie> fetchMoviesByRating(double rating) {
		return manager.createQuery("select x from Movie x where rating>=?2").setParameter(2, rating).getResultList();
	}

	public List<Movie> fetchMovieByLang(String name) {
		return manager.createQuery("select x from Movie x where name=?8").setParameter(8, name).getResultList();
	}

	public List<Movie> fetchMovieByGenre(String name) {
		return manager.createQuery("select x from Movie x where name=?9").setParameter(9, name).getResultList();
	}
}
