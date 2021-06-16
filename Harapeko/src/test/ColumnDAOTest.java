package test;
import java.util.List;

import dao.ColumnDAO;
import model.Column;


public class ColumnDAOTest {

		public static void main(String[] args) {
			ColumnDAO dao = new ColumnDAO();

			// select()のテスト
			System.out.println("---------- select()のテスト ----------");
			List<Column> columnList2 = dao.select();
			for (Column column : columnList2) {
				System.out.println(column.getId());
				System.out.println(column.getTitle());
                                System.out.println(column.getContent());

				System.out.println();
			}
		}
}

