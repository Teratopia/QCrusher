package data;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(name="date_time")
	@Temporal(TemporalType.DATE)
	private Date createDate;
	@ManyToOne
	@JoinColumn(name="creator_id")
	private User user;
	@OneToMany(mappedBy = "quiz")
	private List<Attempt> attempts;
	@OneToMany(mappedBy = "quiz")
	private List<QuizRating> quizRatings;
	@ManyToMany(mappedBy="quizzes")
	private List<QuestionObject> questionObjects;
	
	
	public Quiz(){}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreate_date() {
		return createDate;
	}
	public void setCreate_date(Date create_date) {
		this.createDate = create_date;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Attempt> getAttempts() {
		return attempts;
	}

	public void setAttempts(List<Attempt> attempts) {
		this.attempts = attempts;
	}

	public List<QuizRating> getQuizRatings() {
		return quizRatings;
	}

	public void setQuizRatings(List<QuizRating> quizRatings) {
		this.quizRatings = quizRatings;
	}

	public List<QuestionObject> getQuestionObjects() {
		return questionObjects;
	}

	public void setQuestionObjects(List<QuestionObject> questionObjects) {
		this.questionObjects = questionObjects;
	}

	@Override
	public String toString() {
		return "Quiz [id=" + id + ", name=" + name + ", createDate=" + createDate + ", user=" + user + ", attempts="
				+ attempts + ", quizRatings=" + quizRatings + ", questionObjects=" + questionObjects + "]";
	}
	
}
