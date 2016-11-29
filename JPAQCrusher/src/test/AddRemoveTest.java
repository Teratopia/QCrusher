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
		
		
		
	}
	
	@After
	public void tearDown() throws Exception {
		
		em.close();
		emf.close();
		
	}

}
