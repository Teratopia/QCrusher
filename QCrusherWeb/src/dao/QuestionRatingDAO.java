package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.QuestionObject;
import data.QuestionRating;
import data.User;

@Transactional
public class QuestionRatingDAO {
	@PersistenceContext
    private EntityManager em;
	
	public QuestionRating getQuestionRatingById(int id){
		return em.find(QuestionRating.class, id);
	}

	
	public int createNewQuestionRating(int rating, String feedback, User user, QuestionObject questionObject){
		QuestionRating qr = new QuestionRating();
		qr.setRating(rating);
		qr.setFeedback(feedback);
		qr.setUser(user);
		qr.setQuestionObject(questionObject);
		em.persist(qr);
		return qr.getId();
	}
}
