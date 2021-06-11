package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DFoodDAO;
import dao.DSuggestDAO;
import model.Dish;
import model.Food;

/**
 * Servlet implementation class SuggestServlet
 */
@WebServlet("/SuggestServlet")
public class SuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/suggest.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String food = request.getParameter("food");
		int cal = 0;
		String diff = request.getParameter("difficulty");
		String genre = request.getParameter("genre");
		String feeling = request.getParameter("feeling");

		if(request.getParameter("cal") == "") {
			cal = 100000;
		}
		else {
			cal = Integer.parseInt(request.getParameter("cal"));
		}

		DSuggestDAO DsDao = new DSuggestDAO();
		List<Dish> dishList = DsDao.select(new Dish("", "", "", genre,cal, diff, ""),food);


		if(dishList.size() == 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/resultError.jsp");
			dispatcher.forward(request, response);
		}

		Dish dish = dishList.get((int)(Math.random() * dishList.size()));

		DFoodDAO DfDao = new DFoodDAO();
		List<Food> foodList = DfDao.select2(dish);

		for(Food foods : foodList) {
			dish.setFoodList(foods);
		}

		request.setAttribute("dish", dish);


		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);


	}
}
