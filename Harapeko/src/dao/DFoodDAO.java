package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Dish;
import model.Food;

public class DFoodDAO {
	public List<Food> select2(Dish dish) {
		Connection conn = null;

		List<Food> foodList2 = new ArrayList<Food>();

		try {
			Class.forName("org.h2.Driver");

			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			//SQL文 料理IDで検索してSelectはFood_name
			String sql = "SELECT mf.food_name,mf.food_id"
					+ " FROM dish_details AS dd, m_dish AS md, m_food AS mf"
					+ " WHERE md.dish_id = ? AND dd.dish_id = md.dish_id AND dd.food_id = mf.food_id;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL完成させる

				pStmt.setString(1, dish.getId());

				//pStmt.setString(2, "%"+  dish.getGenre() + "%");

				//pStmt.setString(3,  "%"+ dish.getDiff() + "%");


			ResultSet rs = pStmt.executeQuery();


			while (rs.next()) {
				Food card = new Food(
				rs.getString("food_id"), //foodid
				rs.getString("food_name")
				);
				foodList2.add(card);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			foodList2 = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			foodList2 = null;
		}
		finally {
			// �f�[�^�x�[�X��ؒf
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					foodList2 = null;
				}
			}
		}
		return foodList2;
	}

}
