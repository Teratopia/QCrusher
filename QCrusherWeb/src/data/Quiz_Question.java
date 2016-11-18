package data;

public class Quiz_Question {
	
	private int quizId;
	private int questionId;
	
	public Quiz_Question(){}

	public Quiz_Question(int quizId, int questionId) {
		super();
		this.quizId = quizId;
		this.questionId = questionId;
	}

	public int getQuizId() {
		return quizId;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	@Override
	public String toString() {
		return "Quiz_Question [quizId=" + quizId + ", questionId=" + questionId + "]";
	}
	
	
}
