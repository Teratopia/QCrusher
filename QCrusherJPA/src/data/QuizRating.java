package data;

import javax.persistence.*;

@Entity
@Table(name="quiz_rating")
public class QuizRating {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int rating;
	private String feedback;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@ManyToOne
	@JoinColumn(name="quiz_id")
	private Quiz quiz;
	
	public QuizRating(){}

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

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	@Override
	public String toString() {
		return "QuizRating [id=" + id + ", rating=" + rating + ", feedback=" + feedback + "]";
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
		QuizRating other = (QuizRating) obj;
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
