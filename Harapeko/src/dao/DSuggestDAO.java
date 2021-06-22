package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Dish;

//料理(dish)の提案機能のDAOです
//プロパティには料理の概要のdish型、食材検索用？、お天気スイッチ用
public class DSuggestDAO {
	public List<Dish> select(Dish dish,String food,String hot_cold) {
		Connection conn = null;

		//dishlistに提案条件にあう料理を全て詰め込む
		List<Dish> dishList = new ArrayList<Dish>();
		//aaaにはお天気スイッチ(hot=cold)がONの場合、SQL文が４行目に追加される。
		String aaa;
		if(hot_cold.equals("no")) {
			aaa="";
		}else {
			aaa=" AND md." + hot_cold + "='true'";
		}

		//データベースに接続
		try {
			// JDBCのH2ドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			//SQL文を準備する。
			//２行目ではjoinではなくwhere文を用いた結合をしている。
			//３行目はSuggest.jspの条件選択に該当する
			String sql = "SELECT distinct md.dish_id, md.dish_name, md.img_path, md.dish_genre, md.difficulty, md.cal, md.url"
					+ " FROM dish_details AS dd, m_dish AS md, m_food AS mf"
					+ " WHERE dd.dish_id = md.dish_id AND dd.food_id = mf.food_id"
					+ " and md.CAL <= ? and md.DISH_GENRE like ? and md.difficulty like ? and mf.food_id like ? and md.dish_id like ?"
					+ aaa +";";

			//プリペアードステートメントの準備
			PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL完成させる
				pStmt.setInt(1, dish.getCal());

				pStmt.setString(2, "%"+  dish.getGenre() + "%");

				pStmt.setString(3,  "%"+ dish.getDiff() + "%");

				if(food == null) {
					pStmt.setString(4, "%");
				}
				else {
					pStmt.setString(4, "%"+ food + "%") ;
				}
				pStmt.setString(5, "%" + dish.getId() + "%");


			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {					//Nextでデータを回す
				Dish card = new Dish(
				rs.getString("dish_ID"),
				rs.getString("dish_name"),
				rs.getString("img_path"),
				rs.getString("dish_genre"),
				rs.getInt("cal"),
				rs.getString("difficulty"),
				rs.getString("url")
				);
				dishList.add(card);		 	   //SuggestServetにいくよん
			}
		}

		//エラーが起きたらdishListの中身をnullにしてconsoleに例外を出す
		catch (SQLException e) {
			e.printStackTrace();
			dishList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			dishList = null;
		}
		// データベースを切断
		finally {
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					dishList = null;
				}
			}
		}

		// 結果をsuggestServletに返す。 そのあとに検索結果をリクエストスコープに格納していくよ
		return dishList;
	}


}
