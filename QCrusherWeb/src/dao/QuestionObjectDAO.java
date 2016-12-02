package dao;


import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.AttemptQuestion;
import data.QuestionObject;
import data.QuestionRating;
import data.Quiz;

@Transactional
public class QuestionObjectDAO {

	@PersistenceContext
    private EntityManager em;
	UserDAO userDAO;
	
	public QuestionObject getQuestionObjectById(int id){
		return em.find(QuestionObject.class, id);
	}
	
	public int createNewQuestionObject(String question, String answer, int id){
		QuestionObject qo = new QuestionObject();
		qo.setQuestion(question);
		qo.setAnswer(answer);
		qo.setQuizzes(new LinkedHashSet<Quiz>());
		qo.setQuestionRatings(new LinkedHashSet<QuestionRating>());
		qo.setAttemptQuestions(new LinkedHashSet<AttemptQuestion>());
		qo.addQuiz(em.find(Quiz.class, id));
		em.persist(qo);
		return qo.getId();
	}
	
	public void persist(QuestionObject qo){
		em.persist(qo);
	}
	
}
