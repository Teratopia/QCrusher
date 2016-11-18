package data;

import java.util.Date;

public class Quiz {

	private int id;
	private String name;
	private int creatorId;
	private Date createDate;
	
	public Quiz(){}
	
	public Quiz(int id, String name, int creator_id, Date create_date) {
		super();
		this.id = id;
		this.name = name;
		this.creatorId = creator_id;
		this.createDate = create_date;
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
	public int getCreator_id() {
		return creatorId;
	}
	public void setCreator_id(int creator_id) {
		this.creatorId = creator_id;
	}
	public Date getCreate_date() {
		return createDate;
	}
	public void setCreate_date(Date create_date) {
		this.createDate = create_date;
	}

	@Override
	public String toString() {
		return "Quiz [id=" + id + ", name=" + name + ", creator_id=" + creatorId + ", create_date=" + createDate
				+ "]";
	}
	
}
