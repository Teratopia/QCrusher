package test;

import static org.junit.Assert.*;

import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import data.Attempt;
import data.AttemptQuestion;
import data.QuestionObject;
import data.QuestionRating;
import data.Quiz;
import data.QuizRating;
import data.User;

public class AddRemoveTest {
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("qcrusher");
		em = emf.createEntityManager();
	}

	@Test
	public void testAttemptAddRemove() {
		Attempt a = em.find(Attempt.class, 1);
		
		QuestionObject qo = em.find(QuestionObject.class, 5);
		AttemptQuestion aq = new AttemptQuestion(false, a, qo);
		int numberOfAQs = a.getAttemptQuestions().size();
		a.addAttemptQuestion(aq);
		assertEquals(numberOfAQs+1, a.getAttemptQuestions().size());
		a.removeAttemptQuestion(aq);
		assertEquals(numberOfAQs, a.getAttemptQuestions().size());
		
	}
	
	@Test
	public void testQuestionObjectAddRemove(){
		QuestionObject qo = em.find(QuestionObject.class, 1);
		
		Quiz quiz = em.find(Quiz.class, 5);
		int numQuizzes = qo.getQuizzes().size();
		qo.addQuiz(quiz);
		assertEquals(numQuizzes+1, qo.getQuizzes().size());
		qo.removeQuiz(quiz);
		assertEquals(numQuizzes, qo.getQuizzes().size());
		
		AttemptQuestion aq = em.find(AttemptQuestion.class, 5);
		int numAttemptQuestions = qo.getAttemptQuestions().size();
		qo.addAttemptQuestion(aq);
		assertEquals(numAttemptQuestions+1, qo.getAttemptQuestions().size());
		qo.removeAttemptQuestion(aq);
		assertEquals(numAttemptQuestions, qo.getAttemptQuestions().size());
		
		QuestionRating qr = em.find(QuestionRating.class, 2);
		int numQuestionRatings = qo.getQuestionRatings().size();
		qo.addQuestionRating(qr);
		assertEquals(numQuestionRatings+1, qo.getQuestionRatings().size());
		qo.removeQuestionRating(qr);
		assertEquals(numQuestionRatings, qo.getQuestionRatings().size());
		
	}
	
	@Test
	public void testQuizAddRemove(){
		Quiz q = em.find(Quiz.class, 1);
		
		Attempt attempt = em.find(Attempt.class, 5);
		int numAttempts = q.getAttempts().size();
		q.addAttempt(attempt);
		assertEquals(numAttempts+1, q.getAttempts().size());
		q.removeAttempt(attempt);
		assertEquals(numAttempts, q.getAttempts().size());
		
		QuizRating qr = em.find(QuizRating.class, 3);
		int numQuizRatings = q.getQuizRatings().size();
		q.addQuizRating(qr);
		assertEquals(numQuizRatings+1, q.getQuizRatings().size());
		q.removeQuizRating(qr);
		assertEquals(numQuizRatings, q.getQuizRatings().size());
		
		QuestionObject qo = em.find(QuestionObject.class, 10);
		int numQuestionObjects = q.getQuestionObjects().size();
		q.addQuestionObject(qo);
		assertEquals(numQuestionObjects+1, q.getQuestionObjects().size());
		q.removeQuestionObject(qo);
		assertEquals(numQuestionObjects, q.getQuestionObjects().size());
		
	}
	
	@Test
	public void testUserAddRemove(){
		User u = em.find(User.class, 1);
		
		Attempt attempt = em.find(Attempt.class, 5);
		int numAttempts = u.getAttempts().size();
		u.addAttempt(attempt);
		assertEquals(numAttempts+1, u.getAttempts().size());
		u.removeAttempt(attempt);
		assertEquals(numAttempts, u.getAttempts().size());
		
		Quiz quiz = em.find(Quiz.class, 3);
		int numQuizzes = u.getQuizzes().size();
		u.addQuiz(quiz);
		assertEquals(numQuizzes+1, u.getQuizzes().size());
		u.removeQuiz(quiz);
		assertEquals(numQuizzes, u.getQuizzes().size());
		
		QuizRating qr = em.find(QuizRating.class, 4);
		int numQuizRatings = u.getQuizRatings().size();
		u.addQuizRating(qr);
		assertEquals(numQuizRatings+1, u.getQuizRatings().size());
		u.removeQuizRating(qr);
		assertEquals(numQuizRatings, u.getQuizRatings().size());
		
		QuestionRating questionRating = em.find(QuestionRating.class, 3);
		int numQuestionRatings = u.getQuestionRatings().size();
		u.addQuestionRating(questionRating);
		assertEquals(numQuestionRatings+1, u.getQuestionRatings().size());
		u.removeQuestionRating(questionRating);
		assertEquals(numQuestionRatings, u.getQuestionRatings().size());
		
	}
	
	@After
	public void tearDown() throws Exception {
		
		em.close();
		emf.close();
		
	}

}
