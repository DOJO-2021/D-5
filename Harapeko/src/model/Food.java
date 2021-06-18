package model;
import java.io.Serializable;

//食材BEANSです。

public class Food implements Serializable {
	private String id;
	private String name;

	//コンストラクタ
	public Food(String id, String name) {
		this.id = id;
		this.name = name;
	}

	//空のコンストラクタ
	public Food() {
		this.id = "";
		this.name = "";
	}

	//getter,setter
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
