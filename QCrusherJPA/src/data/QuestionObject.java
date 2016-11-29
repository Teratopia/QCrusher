package data;

import java.util.List;
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
@Table(name="question_object")
public class QuestionObject {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String question;
	private String answer;
//	private String category; //Enum?
//	private int creatorId;
	@ManyToMany
	@JoinTable(name="quiz_question", 
		joinColumns=@JoinColumn(name="question_id"), 
		inverseJoinColumns=@JoinColumn(name="quiz_id"))
	private List<Quiz> quizzes;
	@OneToMany(mappedBy = "questionObject")
	private Set<AttemptQuestion> attemptQuestions;
	@OneToMany(mappedBy = "questionObject")
	private Set<QuestionRating> questionRatings;
	
	
	public QuestionObject(){}

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

	public List<Quiz> getQuizzes() {
		return quizzes;
	}

	public void setQuizzes(List<Quiz> quizzes) {
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
