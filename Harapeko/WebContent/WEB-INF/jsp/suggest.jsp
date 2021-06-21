<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="styleSheet" href="/Harapeko/css/common.css">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

</head>
<body>
	<header class="header">
		<div class="logo">
			<h1><a href="/Harapeko/MainServlet"><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></a></h1>
		</div>
	</header>


<main>
	<div class="wrapper">
		<a href="/Harapeko/MainServlet">メインへ戻る</a>
		<h2>どんな気分？</h2>
		<!-- セッションスコープから緯度経度の挿入 -->
		<div id="lat"  hidden>${lat}</div>
		<div id="lng"  hidden>${lng}</div>

		<div class="bigtable">
			<form method="POST" action="/Harapeko/SuggestServlet" name="SUGGEST"  onSubmit="return check()">
				<input type="reset" value="リセット" name="reset" class="button2">
				<!-- 左右両方のテーブル -->
				<table>
					<!-- 右のテーブル -->
					<tr>
						<td valign="top" style="border:none;">
							<div class="table1">
								<table>
									<tr style="border:none;">
										<td style="border:none;" class="title"><strong>食材（１つ選んでね）</strong></td>
									</tr>
									<tr>
										<td style="border:none;" >
											<div onclick="obj=document.getElementById('meat').style; obj.display=(obj.display=='none')?'block':'none';" class="category">
												<a style="cursor:pointer;">肉🍖</a>
											</div>
											<!-- 折り畳み展開ポインタ -->
											<!-- 折り畳まれ部分 -->
											<div id="meat" style="display:none;clear:both;">
												<!-- 食材の整理のため、テーブルを作成  -->
												<!-- 1行あたり3つの食材を並べる。  -->
												<!-- 行を追加する場合、<tr><td></td></tr>を追加 -->
												<table>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f23">鶏もも肉</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f104" >鶏むね肉</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f95" >豚こま切れ</td>
													</tr>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f24" >豚ロース（薄切り）</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f29" >豚ロース（厚切り）</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f111" >豚肩ロース</td>
													</tr>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f56" >豚バラ肉</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f81" >牛バラ肉（薄切り）</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f85" >牛もも肉（薄切り）</td>
													</tr>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f159" >牛こま切れ肉</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f31" >ひき肉</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f156" >レバー</td>
													</tr>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f145" >ハム</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f93" >ウインナー</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f35" >ベーコン</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>

									<tr>
										<td style="border:none;" >
											<div onclick="obj=document.getElementById('fish').style; obj.display=(obj.display=='none')?'block':'none';" class="category">
												<a style="cursor:pointer;" >魚介類🐡</a>
											</div>
											<!-- 折り畳み展開ポインタ -->

											<!-- 折り畳まれ部分 -->
											<div id="fish" style="display:none;clear:both;">
												<!-- 食材の整理のため、テーブルを作成  -->
												<!-- 1行あたり3つの食材を並べる。  -->
												<!-- 行を追加する場合、<tr><td>～</td></tr>を追加 -->
												<table style="bordder:none;">
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f137" >アサリ</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f27" >アジ</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f97" >イカ</td>
													</tr>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f53" >エビ</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f70">桜エビ</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f83" >サバ</td>
													</tr>
													<tr>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f90" >シャケ</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f25">ブリ</td>
														<td style="border:none;" class="t_width"><input type="radio" name="food" value="f123" >マグロ</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>

									<tr>
										<td style="border:none;">
											<div onclick="obj=document.getElementById('vegetable').style; obj.display=(obj.display=='none')?'block':'none';" class="category">
												<a style="cursor:pointer;">野菜🥬</a>
											</div>
											<!--  折り畳み展開ポインタ -->

											<!-- 折り畳まれ部分 -->
											<div id="vegetable" style="display:none;clear:both;">
												<!-- 食材の整理のため、テーブルを作成  -->
												<!-- 1行あたり3つの食材を並べる。  -->
												<!-- 行を追加する場合、<tr><td></td></tr>を追加 -->
												<table style="border:none;">
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f114" >赤パプリカ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f141" >アスパラガス</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f109" >アボカド</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f79" >大葉</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f113" >かいわれ大根</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f57" >キャベツ</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f150" >キュウリ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f149" >グリンピース</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f103" >小ネギ</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f112" >サンチュ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f86" >じゃがいも</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f26" >大根</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f34" >玉ねぎ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f152" >チンゲン菜</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f75" >トマト</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f54" >長ネギ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f126" >ナス</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f61" >ニラ</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f42" >にんじん</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f96" >白菜</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f77" >パクチー</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f30" >ピーマン</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f47">ブロッコリー</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f120" >ほうれん草</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f36" >ミックスベジタブル</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f69" >もやし</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f107" >レタス</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f129" >レンコン</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>

									<tr>
										<td style="border:none;">
											<div onclick="obj=document.getElementById('other').style; obj.display=(obj.display=='none')?'block':'none';" class="category">
												<a style="cursor:pointer;">穀類🍚・乳製品🥛・その他</a>
											</div>
											<!-- 折り畳み展開ポインタ -->

											<!-- 折り畳まれ部分 -->
											<div id="other" style="display:none;clear:both;">
												<!-- 食材の整理のため、テーブルを作成  -->
												<!-- 1行あたり3つの食材を並べる。  -->
												<!-- 行を追加する場合、<tr><td></td></tr>を追加 -->
												<table style="border:none;">
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f130" >えのき</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f153" >きくらげ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f65" >キムチ</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f32" >牛乳</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f98" >しいたけ</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f87" >しめじ</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f131" >しらたき</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f28" >たまご</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f40" >チーズ</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f63" >豆腐</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f37" >生クリーム</td>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f80" >のり</td>
													</tr>
													<tr>
														<td style="border:none;"class="t_width"><input type="radio" name="food" value="f144" >マッシュルーム</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</td>

						<!-- 右のテーブル -->
						<td valign="top" valign="top"style="border:none;">
							<div class="table2">
								<table class="table2_1">
									<tr style="border:none;">
										<th class="title2">ジャンル</th>
										<td>
											<label>
												<select name ="genre">
													<option value=""></option>
													<option value="和">和食</option>
													<option value="洋">洋食</option>
													<option value="中">中華</option>
													<option value="その他">その他</option>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<th class="title2">カロリー</th>
										<td style="border:none;">
											<div>～<input type="text" name="cal" pattern="[1-9][0-9]*">cal</div>
										</td>
									</tr>
									<tr style="border:none;">
										<th class="title2">難易度</th>
										<td>
											<label>
												<select name ="difficulty">
													<option value=""></option>
													<option value="★☆☆">★☆☆</option>
													<option value="★★☆">★★☆</option>
													<option value="★★★">★★★</option>
												</select>
											</label>
										</td>
									</tr>
									<tr>
										<th class="title2">お天気スイッチ <p class="tenki">&emsp;※気温に合った料理が出てくるよ</p></th>
										<td>
											<label>
												<input type="radio" name="t_switch" value="yes" checked>ON
											</label>
											<label>
											 	<input type="radio" name="t_switch" value="no">OFF

												<!-- JSを使用し気温を挿入するためのhiddenです -->
												<input type="hidden" name="temp" id="temp">

											</label>
										</td>
									</tr>
									<tr>
										<th class="title2">はらペコーぬの<br> &emsp;&ensp; きまぐれスイッチ</th>
										<td>
											<label>
												<input type="radio" name="feeling" value="yes" checked>ON
											</label>
											<label>
												<input type="radio" name="feeling" value="no">OFF
											</label>
										</td>
									</tr>
								</table>
							</div>
							<div class="decision">
								<input type="submit" value="決定" class="button">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</main>

<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/weather1.js"></script>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>