package data;

public class QuestionRating {
	
	private int userId;
	private int questionId;
	private int rating;
	private String feedback;
	private int attemptId;
	
	public QuestionRating(){}
	
	public QuestionRating(int user_id, int question_id, int rating, String feedback, int attempt_id) {
		super();
		this.userId = user_id;
		this.questionId = question_id;
		this.rating = rating;
		this.feedback = feedback;
		this.attemptId = attempt_id;
	}

	public int getUser_id() {
		return userId;
	}
	public void setUser_id(int user_id) {
		this.userId = user_id;
	}
	public int getQuestion_id() {
		return questionId;
	}
	public void setQuestion_id(int question_id) {
		this.questionId = question_id;
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
	public int getAttempt_id() {
		return attemptId;
	}
	public void setAttempt_id(int attempt_id) {
		this.attemptId = attempt_id;
	}

	@Override
	public String toString() {
		return "QuestionRating [user_id=" + userId + ", question_id=" + questionId + ", rating=" + rating
				+ ", feedback=" + feedback + ", attempt_id=" + attemptId + "]";
	}
	
}
