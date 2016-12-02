package dao;


import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import data.Quiz;

@Transactional
public class QuizDAO {
	
	@PersistenceContext
    private EntityManager em;
	@Autowired
	UserDAO userDAO;
	
	public Quiz getQuizById(int id){
		System.out.println("quizDAO questionList size: " + em.find(Quiz.class, id).getQuestionObjects().size());
		return em.find(Quiz.class, id);
	}
	
	public List<Quiz> getAllQuizzes(){
		return em.createQuery("SELECT q FROM Quiz q").getResultList();
	}
	
	public int createNewQuiz(String quizName, String username){
		Quiz q = new Quiz();
		Date d = new Date();
		q.setName(quizName);
		System.out.println("in DAO: "+userDAO.getUserByUserName(username));
		q.setUser(userDAO.getUserByUserName(username));
		q.setCreate_date(d);
		em.persist(q);
		return q.getId();
	}

}
