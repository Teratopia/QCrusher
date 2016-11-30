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
		return "QuestionRating [id=" + id + ", rating=" + rating + ", feedback=" + feedback + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((feedback == null) ? 0 : feedback.hashCode());
		result = prime * result + id;
		result = prime * result + rating;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		QuestionRating other = (QuestionRating) obj;
		if (feedback == null) {
			if (other.feedback != null)
				return false;
		} else if (!feedback.equals(other.feedback))
			return false;
		if (id != other.id)
			return false;
		if (rating != other.rating)
			return false;
		return true;
	}
}
