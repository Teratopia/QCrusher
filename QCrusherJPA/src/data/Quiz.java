package data;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
	@OneToMany(mappedBy = "quiz", fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
	private Set<Attempt> attempts;
	@OneToMany(mappedBy = "quiz", fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
	private Set<QuizRating> quizRatings;
	@ManyToMany(mappedBy="quizzes", fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
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
			questionObjects = new TreeSet<QuestionObject>();
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

	public List<QuestionObject> getQuestionObjects() {
		List<QuestionObject> lqo = new ArrayList<QuestionObject>();
		for(QuestionObject qo : questionObjects){
			lqo.add(qo);
		}
		return lqo;
	}

	public void setQuestionObjects(Set<QuestionObject> questionObjects) {
		this.questionObjects = questionObjects;
	}

	@Override
	public String toString() {
		return "Quiz [id=" + id + ", name=" + name + ", createDate=" + createDate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Quiz other = (Quiz) obj;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	
	//Custom helper methods
	public double getAverageScore(){
		if (attempts.size()==0){
			return 0.0;
		}
		//get the average score for all attempts
		double sum = 0.0;
		for (Attempt a : attempts){
			sum += a.getScore();
		}
		return sum / attempts.size();
	}
	
	public double getHighScore(){
		double highest = 0.0;
		for (Attempt a : attempts){
			highest = Math.max(a.getScore(), highest);
		}
		return highest;
	}
	
	public Attempt getHighScoringAttempt(){
		Attempt highestAttempt = null;
		double highest = 0.0;
		for (Attempt a : attempts){
			highest = Math.max(a.getScore(), highest);
			highestAttempt = a;
		}
		return highestAttempt;
	}
	
	public Integer getUniqueAttempts(){
		Set<Integer> ids = new HashSet<>();
		for (Attempt a : attempts){
			ids.add(a.getUser().getId());
		}
		return ids.size();
	}
	
	public boolean hasAttempted(User u){
		boolean returnBool = false;
		for (Attempt a : attempts){
			if (a.getUser().equals(u)){
				returnBool = true;
				break;
			}		
		}
		return returnBool;
	}
	
}
