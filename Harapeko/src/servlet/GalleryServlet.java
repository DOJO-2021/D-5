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
 * Servlet implementation class GalleryServlet
 */
@WebServlet("/GalleryServlet")
public class GalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//料理を選ぶ
		DSuggestDAO DDao = new DSuggestDAO();
		List<Dish> dishList = DDao.select(new Dish(), "", "no");
		request.setAttribute("List", dishList );

		// ギャラリーページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/gallery.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String food = "";
		int cal = 10000;
		String diff = "";
		String genre = "";
		String feeling = "";
		String peComment = "この料理だペコ。";
		String tSwitch = "no";

		DSuggestDAO DsDao = new DSuggestDAO();

		Dish dish = DsDao.select(new Dish(id, "", "", "",10000, "", ""),"","no").get(0);

		DFoodDAO DfDao = new DFoodDAO();
		List<Food> foodList = DfDao.select2(dish);

		for(Food foods : foodList) {
			dish.setFoodList(foods);
		}

		request.setAttribute("dish", dish);
		request.setAttribute("id", id);
		request.setAttribute("food", food);
		request.setAttribute("cal", cal);
		request.setAttribute("diff", diff);
		request.setAttribute("genre", genre);
		request.setAttribute("feeling", feeling);
		request.setAttribute("comment", peComment);
		request.setAttribute("t_switch",tSwitch );


		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}

}
