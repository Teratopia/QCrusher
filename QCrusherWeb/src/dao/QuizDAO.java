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
	
//	public User getUserById(int id){
//		return em.find(User.class, id);
//	}
//	
//	public User getUserByUserName(String username){
//		return em.createQuery("select u from User u where u.username = ?1", User.class).setParameter(1, username).getSingleResult();
//	}
//	
//	public boolean createNewUser(String username, String password){
//		User u;
//		try {
//			u = getUserByUserName(username);
//			return false;
//		} catch (NoResultException nre){
//			u = new User();
//			u.setUsername(username);
//			u.setPassword(password);
//			u.setRole(UserRole.ROLE_USER);
//			em.persist(u);
//			return true;
//		}
//	}

}
