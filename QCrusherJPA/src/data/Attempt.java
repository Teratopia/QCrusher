package data;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	@ManyToOne
	@JoinColumn(name="quiz_id")
	private Quiz quiz;
	@OneToMany(mappedBy = "attempt")
	private List<AttemptQuestion> attemptQuestions;
	
	public Attempt(){}

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

	public List<AttemptQuestion> getAttemptQuestions() {
		return attemptQuestions;
	}

	public void setAttemptQuestions(List<AttemptQuestion> attemptQuestions) {
		this.attemptQuestions = attemptQuestions;
	}

	@Override
	public String toString() {
		return "Attempt [id=" + id + ", dateTime=" + dateTime + ", user=" + user + ", quiz=" + quiz
				+ ", attemptQuestions=" + attemptQuestions + "]";
	}


}
