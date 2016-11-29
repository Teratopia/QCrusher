package data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="attempt_question")
public class AttemptQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="was_correct")
	private int passFail;
	@ManyToOne
	@JoinColumn(name="attempt_id")
	private Attempt attempt;
	@ManyToOne
	@JoinColumn(name="question_id")
	private QuestionObject questionObject;
	
	public AttemptQuestion(){}
	
	public AttemptQuestion(int passFail, Attempt attempt, QuestionObject questionObject) {
		super();
		this.passFail = passFail;
		this.attempt = attempt;
		this.questionObject = questionObject;
	}

	public int getPassFail() {
		return passFail;
	}
	
	public void setPassFail(int passFail) {
		this.passFail = passFail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Attempt getAttempt() {
		return attempt;
	}

	public void setAttempt(Attempt attempt) {
		this.attempt = attempt;
	}

	public QuestionObject getQuestionObject() {
		return questionObject;
	}

	public void setQuestionObject(QuestionObject questionObject) {
		this.questionObject = questionObject;
	}

	@Override
	public String toString() {
		return "AttemptQuestion [id=" + id + ", passFail=" + passFail + ", attempt=" + attempt + ", questionObject="
				+ questionObject + "]";
	}
	
}
