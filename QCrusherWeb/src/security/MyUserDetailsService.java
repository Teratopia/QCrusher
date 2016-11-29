package security;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import data.Quiz;
import data.User;

@Service
@Transactional
public class MyUserDetailsService implements UserDetailsService{

	@PersistenceContext
	private EntityManager entityManager;

    public UserDetails loadUserByUsername(String username){
    		// assuming that you have a User class that implements UserDetails

    		User u = (User) entityManager.createQuery("select u from User u where u.username = :un")
                    .setParameter("un", username)
                    .getSingleResult();
    		
        return new CustomUserDetails(u);

    }
}