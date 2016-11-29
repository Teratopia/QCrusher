package data;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
	private Set<Attempt> attempts;
	@OneToMany(mappedBy = "quiz")
	private Set<QuizRating> quizRatings;
	@ManyToMany(mappedBy="quizzes")
	private Set<QuestionObject> questionObjects;
	
	public Quiz(){}
	
	public void addAttempt(Attempt attempt){
		if(attempts == null){
			attempts = new HashSet<Attempt>();
		}
		if(!attempts.contains(attempt)){
			attempts.add(attempt);
		}
		attempt.setQuiz(this);
		
	}
	
	public void removeAttempt(Attempt attempt){
		
		attempt.setQuiz(null);
		if(attempts!=null){
			attempts.remove(attempt);
		}
		
	}
	
	public void addQuizRating(QuizRating qr){
		if(quizRatings == null){
			quizRatings = new HashSet<QuizRating>();
		}
		if(!quizRatings.contains(qr)){
			quizRatings.add(qr);
		}
		qr.setQuiz(this);
	}
	
	public void removeQuizRating(QuizRating qr){
		qr.setQuiz(null);
		if(quizRatings!=null){
			quizRatings.remove(qr);
		}
	}
	
	public void addQuestionObject(QuestionObject qo){
		if(questionObjects == null){
			questionObjects = new HashSet<QuestionObject>();
		}
		if(!questionObjects.contains(qo)){
			questionObjects.add(qo);
		}
		qo.addQuiz(this);
		
	}
	
	public void removeQuestionObject(QuestionObject qo){
		qo.removeQuiz(this);
		questionObjects.remove(qo);
		
	}

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

	public Set<Attempt> getAttempts() {
		return attempts;
	}

	public void setAttempts(Set<Attempt> attempts) {
		this.attempts = attempts;
	}

	public Set<QuizRating> getQuizRatings() {
		return quizRatings;
	}

	public void setQuizRatings(Set<QuizRating> quizRatings) {
		this.quizRatings = quizRatings;
	}

	public Set<QuestionObject> getQuestionObjects() {
		return questionObjects;
	}

	public void setQuestionObjects(Set<QuestionObject> questionObjects) {
		this.questionObjects = questionObjects;
	}

	@Override
	public String toString() {
		return "Quiz [id=" + id + ", name=" + name + ", createDate=" + createDate + ", user=" + user + ", attempts="
				+ attempts + ", quizRatings=" + quizRatings + ", questionObjects=" + questionObjects + "]";
	}
	
}
