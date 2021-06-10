package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Dish;

public class DFoodDAO {
	public List<Dish> select(Dish dish,String food) {
		Connection conn = null;

		List<Dish> foodList2 = new ArrayList<Dish>();

		try {
			Class.forName("org.h2.Driver");

			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			//SQL文 料理IDで検索してSelectはFood_name
			String sql = "select mf.food_name from dish_details as dd, m_dish md, m_food mf"
					+ " where dd.dish_id = md.dish_id AND dd.food_id = mf.food_id"
					+ " and mf.dish_id=?;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL完成させる

				if(dish.getCal()==0){
					pStmt.setInt(1, 100000);
				}
				else {
					pStmt.setInt(1, dish.getCal());
				}

				pStmt.setString(2, "%"+  dish.getGenre() + "%");

				pStmt.setString(3,  "%"+ dish.getDiff() + "%");

				pStmt.setString(4, "%"+ food + "%") ;



			// SQL�������s���A���ʕ\���擾����
			ResultSet rs = pStmt.executeQuery();

			// ���ʕ\���R���N�V�����ɃR�s�[����
			while (rs.next()) {				//Next�͎��̃f�[�^������A���̃f�[�^���������
				Dish card = new Dish(
				rs.getString("dish_ID"),
				rs.getString("dish_name"),
				rs.getString("img_path"),
				rs.getString("dish_genre"),
				rs.getInt("cal"),
				rs.getString("difficulty"),
				rs.getString("url")
				);
				foodList2.add(card);		//63�s�ڂ�SearchServe�ɑ�����
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			//cardList=null�̏ꍇconsole�ɗ�O���o���B
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

		// ���ʂ�Ԃ� search_Servlet.java�Ō������ʂ����N�G�X�g�X�R�[�v�Ɋi�[����
		return foodList2;
	}

}
