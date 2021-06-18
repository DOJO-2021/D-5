package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FSuggestDAO;
import model.Food;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//メインメニュー読み込み時におすすめ食材を表示するペコ

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//FoodSuggestDAOで選んだ食材から無作為に一つの食材を抽出し、リクエストスコープにセット。
		FSuggestDAO FDao = new FSuggestDAO();
		List<Food> foodList = FDao.select();
		Food recommend = foodList.get((int)(Math.random() * foodList.size()));
		request.setAttribute("recomend", recommend.getName() );

		// メインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 条件入力ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SuggestServlet");
		dispatcher.forward(request, response);
	}

}
