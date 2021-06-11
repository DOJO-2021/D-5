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
	public List<Dish> select(Dish dish,String food) {
		Connection conn = null;

		List<Dish> dishList = new ArrayList<Dish>();

		try {
			Class.forName("org.h2.Driver");

			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			//SQL文
			String sql = "select distinct md.dish_id, md.dish_name, md.img_path, md.dish_genre, md.difficulty, md.cal, md.url from dish_details as dd, m_dish as md, m_food as mf"
					+ " where dd.dish_id = md.dish_id AND dd.food_id = mf.food_id"
					+ " and md.CAL <= ? and md.DISH_GENRE like ? and md.DIFFICULTY like ? and mf.food_id like ? and md.dish_id like ?;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL完成させる "%"+ + "%"


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
				dishList.add(card);		//63�s�ڂ�SearchServe�ɑ�����
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			//cardList=null�̏ꍇconsole�ɗ�O���o���B
			dishList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			dishList = null;
		}
		finally {
			// �f�[�^�x�[�X��ؒf
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

		// ���ʂ�Ԃ� search_Servlet.java�Ō������ʂ����N�G�X�g�X�R�[�v�Ɋi�[����
		return dishList;
	}


}
