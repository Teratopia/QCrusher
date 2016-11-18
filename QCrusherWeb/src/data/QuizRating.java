package data;

public class QuizRating {
	
	private int userId;
	private int questionId;
	private int rating;
	private String feedback;
	private int attemptId;
	
	public QuizRating(){}

	public QuizRating(int userId, int questionId, int rating, String feedback, int attemptId) {
		super();
		this.userId = userId;
		this.questionId = questionId;
		this.rating = rating;
		this.feedback = feedback;
		this.attemptId = attemptId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

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

	public int getAttemptId() {
		return attemptId;
	}

	public void setAttemptId(int attemptId) {
		this.attemptId = attemptId;
	}

	@Override
	public String toString() {
		return "QuizRating [userId=" + userId + ", questionId=" + questionId + ", rating=" + rating + ", feedback="
				+ feedback + ", attemptId=" + attemptId + "]";
	}
	
	
}
