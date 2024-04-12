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
}
