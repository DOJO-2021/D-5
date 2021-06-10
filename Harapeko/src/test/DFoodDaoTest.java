package test;

import java.util.List;

import dao.DFoodDAO;
import model.Dish;
import model.Food;

public class DFoodDaoTest {
	public static void main(String[] args) {
		DFoodDAO dao = new DFoodDAO();
		System.out.println("---------- select()�̃e�X�g ----------");
	List<Food> foodList2 = dao.select2(new Dish("d1","", "", "", 0, "",""));
	for (Food f:foodList2) {
		System.out.println("ID" + f.getId());
		System.out.println("Name" + f.getName());
		System.out.println();
	}
}
}
