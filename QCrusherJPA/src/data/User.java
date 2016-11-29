package data;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	@OneToMany(mappedBy="user")
	private List<Attempt> attempts;
	@OneToMany(mappedBy="user")
	private List<Quiz> quizzes;
	@OneToMany(mappedBy="user")
	private List<QuizRating> quizRatings;
	@OneToMany(mappedBy="user")
	private List<QuestionRating> questionRatings;
	
	public User(){}

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
	public void setId(int id) {
		this.id = id;
	}

	public List<Attempt> getAttempts() {
		return attempts;
	}

	public void setAttempts(List<Attempt> attempts) {
		this.attempts = attempts;
	}

	public List<Quiz> getQuizzes() {
		return quizzes;
	}

	public void setQuizzes(List<Quiz> quizzes) {
		this.quizzes = quizzes;
	}

	public List<QuizRating> getQuizRatings() {
		return quizRatings;
	}

	public void setQuizRatings(List<QuizRating> quizRatings) {
		this.quizRatings = quizRatings;
	}

	public List<QuestionRating> getQuestionRatings() {
		return questionRatings;
	}

	public void setQuestionRatings(List<QuestionRating> questionRatings) {
		this.questionRatings = questionRatings;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", attempts=" + attempts
				+ ", quizzes=" + quizzes + ", quizRatings=" + quizRatings + ", questionRatings=" + questionRatings
				+ "]";
	}

}
