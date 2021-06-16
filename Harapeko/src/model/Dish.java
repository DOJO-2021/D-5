package model;

import java.io.Serializable;
import java.util.ArrayList;

public class Dish implements Serializable{
	private String id;
	private String name;
	private String path;
	private String genre;
	private int cal;
	private String diff;
	private String url;
	private ArrayList<Food> foodList;

	public Dish(String id, String name, String path, String genre, int cal, String diff, String url) {
		this.id = id;
		this.name = name;
		this.path = path;
		this.genre = genre;
		this.cal = cal;
		this.diff = diff;
		this.url = url;
		this.foodList = new ArrayList<>();
	}

	public Dish() {
		this.id = "";
		this.name = "";
		this.path = "";
		this.genre = "";
		this.cal = 10000;
		this.diff = "";
		this.url = "";
		this.foodList = new ArrayList<>();

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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getCal() {
		return cal;
	}

	public void setCal(int cal) {
		this.cal = cal;
	}

	public String getDiff() {
		return diff;
	}

	public void setDiff(String diff) {
		this.diff = diff;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public ArrayList<Food> getFoodList() {
		return foodList;
	}

	public void setFoodList(Food food) {
		this.foodList.add(food);
	}
}
