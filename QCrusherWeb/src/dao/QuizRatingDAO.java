package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.Quiz;
import data.QuizRating;
import data.User;
@Transactional
public class QuizRatingDAO {
	@PersistenceContext
    private EntityManager em;
	
	public QuizRating getQuizRatingById(int id){
		return em.find(QuizRating.class, id);
	}

	
	public int createNewQuizRating(int rating, String feedback, User user, Quiz quiz){
		QuizRating qr = new QuizRating();
		qr.setRating(rating);
		qr.setFeedback(feedback);
		qr.setUser(user);
		qr.setQuiz(quiz);
		em.persist(qr);
		return qr.getId();
	}
}
