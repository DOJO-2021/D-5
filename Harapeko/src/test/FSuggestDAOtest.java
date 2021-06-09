package test;
import java.util.List;

import dao.FSuggestDAO;
import model.Food;


public class FSuggestDAOtest {

		public static void main(String[] args) {
			FSuggestDAO dao = new FSuggestDAO();

			// select()のテスト
			System.out.println("---------- select()のテスト ----------");
			List<Food> foodList2 = dao.select(new Food("f1", ""));
			for (Food food : foodList2) {
				System.out.println("food_id：" + food.getId());
				System.out.println("food_name：" + food.getName());

				System.out.println();
			}
		}
}