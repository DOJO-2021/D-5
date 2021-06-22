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

	//メインページからSuggest.jspにフォワードする際の処理。
	//条件入力をするボタンを押した際に取得される緯度・経度を「セッションスコープ」に格納する。
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");

		// セッションスコープに緯度・経度を格納する
		HttpSession session = request.getSession();
		session.setAttribute("lat", lat);
		session.setAttribute("lng", lng);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/suggest.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//Result.jspに遷移する際の処理。
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String food = request.getParameter("food");
		int cal = 0;
		String diff = request.getParameter("difficulty");
		String genre = request.getParameter("genre");
		String feeling = request.getParameter("feeling");			//気まぐれスイッチ
		String id = request.getParameter("id");						//resultで表示したidを取得（再提案で使用、suggesstではnull）
		if(request.getParameter("cal") == "") {						//入力がない場合はカロリー制限なしってこと
			cal = 100000;
		}
		else {
			cal = Integer.parseInt(request.getParameter("cal"));	//入力された半角数字のStringをintに変換
		}
		String temp = request.getParameter("temp");					//気温
		String tSwitch =request.getParameter("t_switch");			//天気スイッチ
		String peComment = "";										//気まぐれなペコメント

		//取り敢えず作る
		DSuggestDAO DsDao = new DSuggestDAO();
		List<Dish> dishList;

		//現在気温から「寒い」「普通」「暑い」を判断しそれを、hot_coldとして出力
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

        //気まぐれスイッチONの場合⇒現在時間で場合分けしてSelectを実行する
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
                //dishlist1と2を足してdishlistにまとめる。
                dishList = Stream.concat(dishList1.stream(),dishList2.stream())
                .distinct().collect(Collectors.toList());
            }
            else{
                peComment = "毎日チゲ食べると美人になるらしいペコ。知らんけど。";
                dishList = DsDao.select(new Dish("d18","","", "",100000,"",""),"",hot_cold);
            }
        }
        else {
        	 //気まぐれOFFの通常の処理です
            peComment = "普通に検索するならC〇〇kpadとかで良くないペコか...？";

			dishList = DsDao.select(new Dish("", "", "", genre,cal, diff, ""),food,hot_cold);
        }

        //見つからなかった時。エラーページにフォワード。
		if(dishList.size() == 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/resultError.jsp");
			dispatcher.forward(request, response);
		}
		//dishListの中身が２つ以上の場合、再提案した際に同じ料理を表示しないようにする。
		else {
			if (dishList.size() > 1){
				for(int i=0 ; i < dishList.size() ; i++) {
					if(dishList.get(i).getId().equals(id)) {	//dishlistのiのidと今表示している料理のidの判定
						dishList.remove(i);				//dishllistから排除
						break;
					}
				}
			}

			//ランダムにひとつを抽出
			Dish dish = dishList.get((int)(Math.random() * dishList.size()));

			//「id」をresult.jspで表示していた料理のidから、次の画面で表示する料理のidに切り替える
			id = dish.getId();

			//抽出した料理から食材のリスト(foodlist)を取得
			DFoodDAO DfDao = new DFoodDAO();
			List<Food> foodList = DfDao.select2(dish);

			//Dishのセッター。DishBeanの完成
			for(Food foods : foodList) {
				dish.setFoodList(foods);
			}

			//リクエストスコープにセットしてリザルトに送るぜベイベー
			//このインスタンスで料理情報と食材を送っている
			request.setAttribute("dish", dish);
			//検索条件を送る
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
