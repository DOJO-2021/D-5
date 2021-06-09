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
		System.out.println("ID" + dish.getId());
		System.out.println("Name" + dish.getName());
		System.out.println("Path" + dish.getPath());
		System.out.println();
	}
}
}