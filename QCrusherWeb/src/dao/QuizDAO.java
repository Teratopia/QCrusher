package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.Quiz;

@Transactional
public class QuizDAO {
	
	@PersistenceContext
    private EntityManager em;
	
	public Quiz getQuizById(int id){
		return em.find(Quiz.class, id);
	}

}
