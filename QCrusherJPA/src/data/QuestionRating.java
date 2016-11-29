package data;

import javax.persistence.*;

@Entity
@Table(name="question_rating")
public class QuestionRating {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int rating;
	private String feedback;
	//private int attemptId;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@ManyToOne
	@JoinColumn(name="question_id")
	private QuestionObject questionObject;
	
	public QuestionRating(){}
	
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public QuestionObject getQuestionObject() {
		return questionObject;
	}

	public void setQuestionObject(QuestionObject questionObject) {
		this.questionObject = questionObject;
	}

	@Override
	public String toString() {
		return "QuestionRating [id=" + id + ", rating=" + rating + ", feedback=" + feedback + ", user=" + user
				+ ", questionObject=" + questionObject + "]";
	}
	
}
