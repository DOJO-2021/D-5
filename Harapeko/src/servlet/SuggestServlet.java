package servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");

		// セッションスコープにIDを格納する
		HttpSession session = request.getSession();
		session.setAttribute("lat", lat);
		session.setAttribute("lng", lng);

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
		String id = request.getParameter("id");
		if(request.getParameter("cal") == "") {
			cal = 100000;
		}
		else {
			cal = Integer.parseInt(request.getParameter("cal"));
		}
		String temp = request.getParameter("temp");
		String tSwitch =request.getParameter("t_switch");
		String peComment = "";
		DSuggestDAO DsDao = new DSuggestDAO();
		List<Dish> dishList;

		//現在気温
		double temp2= Double.parseDouble(temp);
		String hot_cold = "no";

		if(tSwitch.equals("yes")) {
			if (temp2<10) {
				hot_cold="cold";
			}else if(temp2>=10 && temp2<25) {
				hot_cold="general";
			}else {
				hot_cold="hot";
			}
		}



       //現在時間を取得
        Date now = new Date();
        Calendar c = Calendar.getInstance();

        c.setTime(now);
        int hour = c.get(Calendar.HOUR_OF_DAY);


        if(feeling.equals("yes")) {
            if(hour>=0 && hour<=4) {
                //"0時台～4時台：無視。
            	peComment="眠いペコ。夜食には関わらない主義ペコ。おやすみzzz";
                dishList = DsDao.select(new Dish("","","", "",100000,"",""),"",hot_cold);
            }
            else if (hour >= 5 && hour <= 9) {
                //5時台～9時台：ジャンルは和食。
            	peComment = "朝は和食に限るペコ。うん。";
                dishList = DsDao.select(new Dish("","","", "和",cal,diff,""),food,hot_cold);
            }
            else if (hour >= 10 && hour <= 12) {
                //10時台～13時台：難易度★★★のみ
            	peComment="チャレンジ精神って大事って思わないペコか？";
                dishList = DsDao.select(new Dish("","","", genre,cal,"★★★",""),food,hot_cold);
            }
            else if (hour >= 14 && hour <= 16) {
                //14時台～16時台：カロリー無視.
            	peComment = "夕食の時間が早いほど太らないペコ？";
                dishList = DsDao.select(new Dish("","","", genre,100000,diff,""),food,hot_cold);
            }
            else if (hour >= 14 && hour <= 16) {
                //17時台～22時台：ニンニクか唐辛子を含む。
            	peComment="力こそパワーペコ。You know??";
                List<Dish> dishList1 = DsDao.select(new Dish("","","", genre,cal,diff,""),"粉唐辛子",hot_cold);
                List<Dish> dishList2 = DsDao.select(new Dish("","","", genre,cal,diff,""),"ニンニク",hot_cold);
                dishList = Stream.concat(dishList1.stream(),dishList2.stream())
                .distinct().collect(Collectors.toList());
            }
            else{
                peComment = "毎日チゲ食べると美人になるらしいペコ。知らんけど。";
                dishList = DsDao.select(new Dish("d18","","", "",100000,"",""),"",hot_cold);
            }
        }
        else {
        //通常の処理です。
            peComment = "普通に検索するならc〇〇kpadとかで良くないペコか...？";

            if(id.equals("")) {
				dishList = DsDao.select(new Dish("", "", "", genre,cal, diff, ""),food,hot_cold);
            }
            else {
				dishList = DsDao.select(new Dish(id, "", "", "",100000, "", ""),"","no");
            }
        }

        //見つからなかった時。
		if(dishList.size() == 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/resultError.jsp");
			dispatcher.forward(request, response);
		}
		else {
			if (dishList.size() > 1){
				for(int i=0 ; i < dishList.size() ; i++) {
					if(dishList.get(i).getId().equals(id)) {
						dishList.remove(i);
						break;
					}
				}
			}

			Dish dish = dishList.get((int)(Math.random() * dishList.size()));

			id = dish.getId();

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
}
