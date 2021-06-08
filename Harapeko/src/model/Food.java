package model;
import java.io.Serializable;

public class Food implements Serializable {
	private String id;
	private String name;

	public Food(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public Food() {
		this.id = "";
		this.name = "";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
