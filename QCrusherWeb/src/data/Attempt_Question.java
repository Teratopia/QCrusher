package data;

public class Attempt_Question {
	private int attemptId;
	private int questionId;
	private boolean passFail;
	
	public Attempt_Question(){}

	public Attempt_Question(int attemptId, int questionId, boolean passFail) {
		super();
		this.attemptId = attemptId;
		this.questionId = questionId;
		this.passFail = passFail;
	}

	public int getAttemptId() {
		return attemptId;
	}

	public void setAttemptId(int attemptId) {
		this.attemptId = attemptId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public boolean isPassFail() {
		return passFail;
	}

	public void setPassFail(boolean passFail) {
		this.passFail = passFail;
	}

	@Override
	public String toString() {
		return "Attempt_Question [attemptId=" + attemptId + ", questionId=" + questionId + ", passFail=" + passFail
				+ "]";
	}
	
	
}
