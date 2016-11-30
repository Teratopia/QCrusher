package dao;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.Attempt;
import data.AttemptQuestion;
import data.QuestionObject;
import data.Quiz;
import data.User;

@Transactional
public class AttemptQuestionDAO {

	@PersistenceContext
	private EntityManager em;

	public AttemptQuestion getAttemptQuestionById(int id) {
		return em.find(AttemptQuestion.class, id);
	}

	public int createNewAttemptQuestion(int questionId, int attemptId, boolean wasCorrect) {
		AttemptQuestion aq;
		aq = new AttemptQuestion();
		aq.setAttempt(em.find(Attempt.class, attemptId));
		aq.setQuestionObject(em.find(QuestionObject.class, questionId));
		aq.setPassFail(wasCorrect);
		em.persist(aq);
		return aq.getId();
	}

}
