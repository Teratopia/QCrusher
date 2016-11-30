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
	private boolean passFail;
	@ManyToOne
	@JoinColumn(name="attempt_id")
	private Attempt attempt;
	@ManyToOne
	@JoinColumn(name="question_id")
	private QuestionObject questionObject;
	
	public AttemptQuestion(){}
	
	public AttemptQuestion(boolean passFail, Attempt attempt, QuestionObject questionObject) {
		super();
		this.passFail = passFail;
		this.attempt = attempt;
		this.questionObject = questionObject;
	}

	public boolean getPassFail() {
		return passFail;
	}
	
	public void setPassFail(boolean passFail) {
		this.passFail = passFail;
	}

	public int getId() {
		return id;
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
		return "AttemptQuestion [id=" + id + ", passFail=" + passFail + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + (passFail ? 1231 : 1237);
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
		AttemptQuestion other = (AttemptQuestion) obj;
		if (id != other.id)
			return false;
		if (passFail != other.passFail)
			return false;
		return true;
	}
}
