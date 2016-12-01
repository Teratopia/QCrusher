package dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.User;
import security.UserRole;

@Transactional
public class UserDAO{
	@PersistenceContext
    private EntityManager em;
	
	public User getUserById(int id){
		return em.find(User.class, id);
	}
	
	public User getUserByUserName(String username){
		User u = null;
		try {
			u = em.createQuery("select u from User u where u.username = ?1", User.class).setParameter(1, username).getSingleResult();
		} catch (NoResultException nre){
			// if no result, User returned is null
		}
		return u;
	}
	
	public boolean createNewUser(String username, String password){
		User u = getUserByUserName(username);
		if (u != null) {
			return false; //username already exists
		} else {
			u = new User();
			u.setUsername(username);
			u.setPassword(password);
			u.setRole(UserRole.ROLE_USER);
			em.persist(u);
			return true;
		}
	}
}
