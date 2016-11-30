package dao;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.Attempt;
import data.Quiz;
import data.User;

@Transactional
public class AttemptDAO{
	@PersistenceContext
    private EntityManager em;
	
	public Attempt getAttemptById(int id){
		return em.find(Attempt.class, id);
	}
		
	public int createNewAttempt(int userId, int quizId){
		Attempt a;
			a = new Attempt();
			a.setUser(em.find(User.class, userId));
			a.setQuiz(em.find(Quiz.class, quizId));
			a.setDateTime(new Date());
			em.persist(a);
			return a.getId();
	}

}
