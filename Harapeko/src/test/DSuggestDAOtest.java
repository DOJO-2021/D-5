package test;

import java.util.List;

import dao.DSuggestDAO;
import model.Dish;

public class DSuggestDAOtest {

	public static void main(String[] args) {
		DSuggestDAO dao = new DSuggestDAO();
		System.out.println("---------- select()�̃e�X�g ----------");
	List<Dish> dishList = dao.select();
	for (Dish dish:dishList) {
		System.out.println("ID�F" + dish.getId());
		System.out.println("Name�F" + dish.getName());
		System.out.println("Path�F" + dish.getPath());
		System.out.println();
	}
}
}