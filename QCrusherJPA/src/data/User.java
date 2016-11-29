package data;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import security.UserRole;


@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	@Enumerated(EnumType.STRING)
	private UserRole role;
	@OneToMany(mappedBy="user")
	private Set<Attempt> attempts;
	@OneToMany(mappedBy="user")
	private Set<Quiz> quizzes;
	@OneToMany(mappedBy="user")
	private Set<QuizRating> quizRatings;
	@OneToMany(mappedBy="user")
	private Set<QuestionRating> questionRatings;
	
	public User(){}
	
	public void addAttempt(Attempt attempt){
		if(attempts == null){
			attempts = new HashSet<Attempt>();
		}
		if(!attempts.contains(attempt)){
			attempts.add(attempt);

		}
		attempt.setUser(this);
		
	}
	
	public void removeAttempt(Attempt attempt){
		
		attempt.setUser(null);
		if(attempts!=null){
			attempts.remove(attempt);
		}
		
	}
	
	public void addQuiz(Quiz quiz) {
		if (quizzes == null) {
			quizzes = new HashSet<Quiz>();
		}
		if (!quizzes.contains(quiz)) {
			quizzes.add(quiz);
		}
		quiz.setUser(this);
	}

	public void removeQuiz(Quiz quiz) {
		quiz.setUser(null);
		if (quizzes != null) {
			quizzes.remove(quiz);
		}
	}
	
	public void addQuizRating(QuizRating qr){
		if(quizRatings == null){
			quizRatings = new HashSet<QuizRating>();
		}
		if(!quizRatings.contains(qr)){
			quizRatings.add(qr);
		}
		qr.setUser(this);
	}
	
	public void removeQuizRating(QuizRating qr){
		qr.setUser(null);
		if(quizRatings!=null){
			quizRatings.remove(qr);
		}
	}
	//may want to remove first if statement? id may be enough for doubles
	public void addQuestionRating(QuestionRating qr){
		if(questionRatings == null){
			questionRatings = new HashSet<QuestionRating>();
		}
		if(!questionRatings.contains(qr)){
			questionRatings.add(qr);
		}
		qr.setUser(this);
	}
	
	public void removeQuestionRating(QuestionRating qr){
		qr.setUser(null);
		if(questionRatings != null){
			questionRatings.remove(qr);
		}
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}

	public Set<Attempt> getAttempts() {
		return attempts;
	}

	public void setAttempts(Set<Attempt> attempts) {
		this.attempts = attempts;
	}

	public Set<Quiz> getQuizzes() {
		return quizzes;
	}

	public void setQuizzes(Set<Quiz> quizzes) {
		this.quizzes = quizzes;
	}

	public Set<QuizRating> getQuizRatings() {
		return quizRatings;
	}

	public void setQuizRatings(Set<QuizRating> quizRatings) {
		this.quizRatings = quizRatings;
	}

	public Set<QuestionRating> getQuestionRatings() {
		return questionRatings;
	}

	public void setQuestionRatings(Set<QuestionRating> questionRatings) {
		this.questionRatings = questionRatings;
	}

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", attempts=" + attempts
				+ ", quizzes=" + quizzes + ", quizRatings=" + quizRatings + ", questionRatings=" + questionRatings
				+ "]";
	}

}
