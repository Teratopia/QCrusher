package data;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
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
	@OneToMany(mappedBy = "questionObject")
	private Set<AttemptQuestion> attemptQuestions;
	@OneToMany(mappedBy = "questionObject")
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

	public void setId(int id) {
		this.id = id;
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
		return "QuestionObject [id=" + id + ", question=" + question + ", answer=" + answer + ", quizzes=" + quizzes
				+ ", attemptQuestions=" + attemptQuestions + ", questionRatings=" + questionRatings + "]";
	}

}
