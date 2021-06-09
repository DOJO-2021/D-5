package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Dish;


public class DSuggestDAO {
	// 引数paramで検索項目を指定し、検索結果のリストを返すSELECTメソッド
	public List<Dish> select() {
		Connection conn = null;
		//String s = “文字列”;

		List<Dish> dishList = new ArrayList<Dish>();		//ArrayListでも可能。Bc型のリスト保存

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/D-5/data", "sa", "sa");

			// SQL文を準備する　重要★　？をAND　ORにも適用するか
			//if (aaaa.getKensaku() == "AND") {ptst.setstring(3,getKensaku)

			//全テーブル取得、条件
			String sql = "Select distinct md.dish_id,md.dish_name,md.img_path,md.dish_genre,md.difficulty,md.cal,md.url"
					+ "from ( dish_details as dd INNER JOIN m_dish as md  using(dish_id));"
					+ "inner join m_food as mf using(food_id);";
			//where cal<? and
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
/*

				pStmt.setString(1, "%" + src.getSearch1() + "%");

				pStmt.setString(2, "%" + src.getSearch2() + "%");

				pStmt.setString(3, "%" + src.getSearch1() + "%");

				pStmt.setString(4, "%" + src.getSearch2() + "%");

				pStmt.setString(5, "%" + src.getSearch1() + "%");
*/

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {				//Nextは次のデータだから、次のデータがある限り
				Dish card = new Dish(
				rs.getString("ID"),
				rs.getString("NAME"),
				rs.getString("PATH"),
				rs.getString("GENRE"),
				rs.getInt("CAL"),
				rs.getString("DIFF"),
				rs.getString("URL")
				);
				dishList.add(card);		//63行目にSearchServeに送られる
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			//cardList=nullの場合consoleに例外を出す。
			dishList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			dishList = null;
		}
		finally {
			// データベースを切断
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

		// 結果を返す search_Servlet.javaで検索結果をリクエストスコープに格納する
		return dishList;
	}


}
