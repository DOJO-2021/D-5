package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ColumnDAO;
import model.Column;


/**
 * Servlet implementation class ColumnServlet
 */
@WebServlet("/ColumnServlet")
public class ColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	//メインからコラムJSPに遷移する際の処理
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// コラムをランダムで1つ表示します
		//DAOの読み込み
		ColumnDAO CDao = new ColumnDAO();
		//全てのコラムを取得
		List<Column> columnList = CDao.select();
		//無作為に抽出
		Column column = columnList.get((int)(Math.random() * columnList.size()));
		//リクエストスコープにコラムインスタンスを乗せる。
		request.setAttribute("column", column );

		// コラムページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/column.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//コラムJSPからの遷移する際の処理はない。
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
