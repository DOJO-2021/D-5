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
	// ����param�Ō������ڂ��w�肵�A�������ʂ̃��X�g��Ԃ�SELECT���\�b�h
	public List<Dish> select() {
		Connection conn = null;
		//String s = �g������h;

		List<Dish> dishList = new ArrayList<Dish>();		//ArrayList�ł��\�BBc�^�̃��X�g�ۑ�

		try {
			// JDBC�h���C�o��ǂݍ���
			Class.forName("org.h2.Driver");

			// �f�[�^�x�[�X�ɐڑ�����
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/D-5/data", "sa", "sa");

			// SQL������������@�d�v���@�H��AND�@OR�ɂ��K�p���邩
			//if (aaaa.getKensaku() == "AND") {ptst.setstring(3,getKensaku)

			//�S�e�[�u���擾�A����
			String sql = "select distinct md.dish_id, md.dish_name, md.img_path, md.dish_genre, md.difficulty, md.cal, md.url from dish_details as dd, m_dish md, m_food mf"
					+ " where dd.dish_id = md.dish_id AND dd.food_id = mf.food_id;";
			//where CAL <= ? and DISH_GENRE = ? and DIFFICULTY = ? and FOOD_NAME = ?;
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL��������������
/*

				pStmt.setString(1, "%" + src.getSearch1() + "%");

				pStmt.setString(2, "%" + src.getSearch2() + "%");

				pStmt.setString(3, "%" + src.getSearch1() + "%");

				pStmt.setString(4, "%" + src.getSearch2() + "%");

				pStmt.setString(5, "%" + src.getSearch1() + "%");
*/

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
