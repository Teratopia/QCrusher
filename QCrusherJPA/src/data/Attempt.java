package data;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Attempt {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="date_time")
	@Temporal(TemporalType.DATE)
	private Date dateTime;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="quiz_id")
	private Quiz quiz;
	@OneToMany(mappedBy = "attempt", fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private Set<AttemptQuestion> attemptQuestions;
	
	public Attempt(){}
	
	public void addAttemptQuestion(AttemptQuestion aq){
		if(attemptQuestions==null){
			attemptQuestions = new HashSet<AttemptQuestion>();
		}
		if(!attemptQuestions.contains(aq)){
			attemptQuestions.add(aq);
//			if(aq.getAttempt()!=null){
//				aq.getAttempt().getAttemptQuestions().remove(aq);
//			}
			aq.setAttempt(this);
		}
	}
	
	public void removeAttemptQuestion(AttemptQuestion aq){
		if(attemptQuestions != null){
			attemptQuestions.remove(aq);
		}
	}

	public int getId() {
		return id;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public Set<AttemptQuestion> getAttemptQuestions() {
		return attemptQuestions;
	}

	public void setAttemptQuestions(Set<AttemptQuestion> attemptQuestions) {
		this.attemptQuestions = attemptQuestions;
	}
	
	@Override
	public String toString() {
		return "Attempt [id=" + id + ", dateTime=" + dateTime + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dateTime == null) ? 0 : dateTime.hashCode());
		result = prime * result + id;
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
		Attempt other = (Attempt) obj;
		if (dateTime == null) {
			if (other.dateTime != null)
				return false;
		} else if (!dateTime.equals(other.dateTime))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	//helper methods
	public double getScore(){
		if (attemptQuestions.size()==0){
			return 0.0;
		}
		double sum = 0.0;
		for (AttemptQuestion aq : attemptQuestions){
			if (aq.getPassFail()) sum ++;
		}
		return 100 * sum / attemptQuestions.size();
	}

}
