package dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import data.QuestionObject;
import data.Quiz;

@Transactional
public class QuizDAO {

	@PersistenceContext
	private EntityManager em;
	@Autowired
	UserDAO userDAO;

	public Quiz getQuizById(int id) {
		return em.find(Quiz.class, id);
	}

	public List<Quiz> getAllQuizzes() {
		System.out.println("IN DAO METHOD");
		List<Quiz> results = null;
		try {
			System.out.println("ABOUT TO QUERY");
			results = (List<Quiz>) em.createQuery("SELECT q FROM Quiz q").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}
		System.out.println("ABOUT TO RETURN");
		return results;
	}

	public int createNewQuiz(String quizName, String username) {
		Quiz q = new Quiz();
		Date d = new Date();
		q.setName(quizName);
		q.setUser(userDAO.getUserByUserName(username));
		q.setCreate_date(d);
		em.persist(q);
		return q.getId();
	}

	public void removeQuestionObjectFromQuiz(Quiz quiz, QuestionObject qo) {
		quiz.removeQuestionObject(qo);
		System.out.println("test");
		// em.persist(quiz);
		em.merge(qo);
	}
	
	public void deleteQuiz(int quizId){
		Quiz quiz = em.find(Quiz.class, quizId);
		em.remove(quiz);
	}

}
