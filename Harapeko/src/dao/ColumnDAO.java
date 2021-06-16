package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Column;


public class ColumnDAO {

	public List<Column> select() {
		Connection conn = null;
		List<Column> columnList = new ArrayList<Column>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			// SQL文を準備する
			String sql = "select id, title, content from column";
			PreparedStatement pStmt = conn.prepareStatement(sql);


			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Column column = new Column(
				rs.getString("id"),
				rs.getString("title"),
                rs.getString("content")
                                );
				columnList.add(column);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			columnList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			columnList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					columnList = null;
				}
			}
		}

		// 結果を返す
		return columnList;
	}
}


