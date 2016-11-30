package data;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "question_object")
public class QuestionObject {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String question;
	private String answer;
	// private String category; //Enum?
	// private int creatorId;
	@ManyToMany
	@JoinTable(name = "quiz_question", joinColumns = @JoinColumn(name = "question_id"), inverseJoinColumns = @JoinColumn(name = "quiz_id"))
	private Set<Quiz> quizzes;
	@OneToMany(mappedBy = "questionObject", fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
	private Set<AttemptQuestion> attemptQuestions;
	@OneToMany(mappedBy = "questionObject", fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
	private Set<QuestionRating> questionRatings;

	public QuestionObject() {
	}

	public void addQuiz(Quiz quiz) {
		if (quizzes == null) {
			quizzes = new HashSet<Quiz>();
		}
		if (!quizzes.contains(quiz)) {
			quizzes.add(quiz);
		}
	}

	public void removeQuiz(Quiz quiz) {
		if (quizzes != null) {
			quizzes.remove(quiz);
		}
	}

	public void addAttemptQuestion(AttemptQuestion aq) {
		if (attemptQuestions == null) {
			attemptQuestions = new HashSet<AttemptQuestion>();
		}
		if (!attemptQuestions.contains(aq)) {
			attemptQuestions.add(aq);
			if (aq.getAttempt() != null) {
				aq.getAttempt().getAttemptQuestions().remove(aq);
			}
			aq.setQuestionObject(this);
		}
	}

	public void removeAttemptQuestion(AttemptQuestion aq){
	if(attemptQuestions != null){
		attemptQuestions.remove(aq);
	}
}
	
	public void addQuestionRating(QuestionRating qr){
		if(questionRatings == null){
			questionRatings = new HashSet<QuestionRating>();
		}
		if(!questionRatings.contains(qr)){
			questionRatings.add(qr);

			qr.setQuestionObject(this);
		}
	}
	
	public void removeQuestionRating(QuestionRating qr){
		if(questionRatings != null){
			questionRatings.remove(qr);
		}
	}

	public int getId() {
		return id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Set<Quiz> getQuizzes() {
		return quizzes;
	}

	public void setQuizzes(Set<Quiz> quizzes) {
		this.quizzes = quizzes;
	}

	public Set<AttemptQuestion> getAttemptQuestions() {
		return attemptQuestions;
	}

	public void setAttemptQuestions(Set<AttemptQuestion> attemptQuestions) {
		this.attemptQuestions = attemptQuestions;
	}

	public Set<QuestionRating> getQuestionRatings() {
		return questionRatings;
	}

	public void setQuestionRatings(Set<QuestionRating> questionRatings) {
		this.questionRatings = questionRatings;
	}

	@Override
	public String toString() {
		return "QuestionObject [id=" + id + ", question=" + question + ", answer=" + answer + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + id;
		result = prime * result + ((question == null) ? 0 : question.hashCode());
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
		QuestionObject other = (QuestionObject) obj;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (id != other.id)
			return false;
		if (question == null) {
			if (other.question != null)
				return false;
		} else if (!question.equals(other.question))
			return false;
		return true;
	}
	
}
