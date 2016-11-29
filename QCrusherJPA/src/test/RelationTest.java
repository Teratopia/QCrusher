package test;

import static org.junit.Assert.assertEquals;

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


public class RelationTest {
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("qcrusher");
		em = emf.createEntityManager();
	}


	@Test
	public void testSelfReferentialObjectFields() {
		//Attempt
		Attempt a = em.find(Attempt.class, 1);
		assertEquals("2016-11-19", a.getDateTime().toString());
		
		//AttemptQuestion
		AttemptQuestion aq = em.find(AttemptQuestion.class, 1);
		assertEquals(1, aq.getPassFail());
		
		//QuestionObject
		QuestionObject qo = em.find(QuestionObject.class, 1);
		assertEquals("Yellow", qo.getAnswer());

		//QuestionRating
		QuestionRating qr = em.find(QuestionRating.class, 1);
		assertEquals(10, qr.getRating());
		
		//Quiz
		Quiz q = em.find(Quiz.class, 1);
		assertEquals("A Quiz To Remember", q.getName());

		//QuizRating
		QuizRating quizRating = em.find(QuizRating.class, 1);
		assertEquals("A thrilling quiz! Wonderful experience all around!", quizRating.getFeedback());

		//User
		User u = em.find(User.class, 1);
		assertEquals("testpassword", u.getPassword());
	}
	
	@Test
	public void testUsersRelationships(){
		User u = em.find(User.class, 1);
		Set<Attempt> alu = u.getAttempts();
		assertEquals(6, alu.size());
		
		Set<Quiz> quizzes = u.getQuizzes();
		assertEquals(1, quizzes.size());
		
		Set<QuizRating> quizRatings = u.getQuizRatings();
		assertEquals(3, quizRatings.size());
		
		Set<QuestionRating> questionRatings = u.getQuestionRatings();
		assertEquals(2, questionRatings.size());
	}
	
	@Test
	public void testAttemptRelationships(){
		Attempt a = em.find(Attempt.class, 1);
		
		assertEquals("jbone", a.getUser().getUsername());
		
		assertEquals(5, a.getAttemptQuestions().size());
		
		assertEquals("A Quiz To Remember", a.getQuiz().getName());
	}
	
	@Test
	public void testQuizRelationships(){
		Quiz q = em.find(Quiz.class, 1);
		
		assertEquals("jbone", q.getUser().getUsername());
		
		assertEquals(4, q.getAttempts().size());
		
		assertEquals(1, q.getQuizRatings().size());
		
		assertEquals(5, q.getQuestionObjects().size());
		
	}
	
	@Test
	public void testQuestionObjectRelationships(){
		QuestionObject qo = em.find(QuestionObject.class, 1);
		
		assertEquals(1, qo.getQuizzes().size());
		
		assertEquals(4, qo.getAttemptQuestions().size());
		
		assertEquals(1, qo.getQuestionRatings().size());
		
	}
	
	@Test
	public void testQuestionRatingRelationships(){
		QuestionRating qr = em.find(QuestionRating.class, 1);
		
		assertEquals("jbone", qr.getUser().getUsername());

		assertEquals("Yellow", qr.getQuestionObject().getAnswer());
		
	}
	
	@Test
	public void testAttemptQuestion(){
		AttemptQuestion aq = em.find(AttemptQuestion.class, 1);
		
		assertEquals("Yellow", aq.getQuestionObject().getAnswer());
		
		assertEquals("A Quiz To Remember", aq.getAttempt().getQuiz().getName());
		
	}
	
	@After
	public void tearDown() throws Exception {
		
		em.close();
		emf.close();
		
	}
}