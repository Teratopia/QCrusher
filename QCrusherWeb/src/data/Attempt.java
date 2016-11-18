package data;

import java.util.Date;

public class Attempt {
	
	private int id;
	private Date dateTime;
	private int userId;
	private int quizId;
	
	public Attempt(){}

	public Attempt(int id, Date dateTime, int userId, int quizId) {
		super();
		this.id = id;
		this.dateTime = dateTime;
		this.userId = userId;
		this.quizId = quizId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getQuizId() {
		return quizId;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}

	@Override
	public String toString() {
		return "Attempt [id=" + id + ", dateTime=" + dateTime + ", UserId=" + userId + ", quizId=" + quizId + "]";
	}
	

}
