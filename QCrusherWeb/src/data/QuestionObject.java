package data;

public class QuestionObject {

	private int id;
	private String category; //Enum?
	private String question;
	private String answer;
	private int creatorId;
	
	public QuestionObject(){}
	
	public QuestionObject(int id, String category, String question, String answer, int creatorId) {
		super();
		this.id = id;
		this.category = category;
		this.question = question;
		this.answer = answer;
		this.creatorId = creatorId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	@Override
	public String toString() {
		return "QuestionObject [id=" + id + ", category=" + category + ", question=" + question + ", answer=" + answer
				+ ", creatorId=" + creatorId + "]";
	}
	
}
