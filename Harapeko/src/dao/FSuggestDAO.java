package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Food;

public class FSuggestDAO {

	public List<Food> select(Food foods) {
		Connection conn = null;
		List<Food> foodList = new ArrayList<Food>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			// SQL文を準備する
			String sql = "selec * from m_food";
			PreparedStatement pStmt = conn.prepareStatement(sql);


			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Food food = new Food(
				rs.getString("food_id"),
				rs.getString("food_name")
				);
				foodList.add(food);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			foodList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			foodList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					foodList = null;
				}
			}
		}

		// 結果を返す
		return foodList;
	}
}
