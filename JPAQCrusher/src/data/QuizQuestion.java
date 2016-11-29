package data;

import javax.persistence.*;

@Entity
@Table(name="quiz_question")
public class QuizQuestion {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="quiz_id")
	private int quizId;
	@Column(name="question_id")
	private int questionId;
	
	public QuizQuestion(){}

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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "QuizQuestion [id=" + id + ", quizId=" + quizId + ", questionId=" + questionId + "]";
	}

}
