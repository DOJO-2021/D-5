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

@WebServlet("/MainSrvlet")
public class MainSrvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//おすすめ食材を選ぶ
		FSuggestDAO FDao = new FSuggestDAO();
		List<Food> foodList = FDao.select(new Food("",""));
		Food recommend = foodList.get((int)(Math.random() * foodList.size()));
		request.setAttribute("recomend", recommend.getName() );


		// メインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
