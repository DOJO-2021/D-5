<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript" src="common.js"></script>
<main>

<a href="/Harapeko/MainServlet">メインへ戻る</a>
<h1>どんな気分？</h1>

<div>
<form method="POST" action="/Harapeko/SuggestServlet" name="SUGGEST">
<input type="reset" value="リセット" name="reset">
<table class="table1"style="border:none;">
<tr style="border:none;">
<td valign="top" style="border:none;">
<table style="border:none;">
      <tr style="border:none;">
       <td style="border:none;"><strong>食材</strong></td>
      </tr>
      <tr style="border:none;">
       <td style="border:none;"><strong></strong></td>
      </tr>
      <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('meat').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">肉🍖</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="meat" style="display:none;clear:both;">
<!--//食材の整理のため、テーブルを作成  -->
<!--//1行あたり２つの食材を並べる。  -->
<!--//行を追加する場合、<tr><td></td></tr>を追加 -->
          <table>
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="chiken">鶏もも肉</td>
            <td style="border:none;"><input type="radio" name="food" value="pookloin" >豚ロース（薄切り）</td>
            <td style="border:none;"><input type="radio" name="food" value="porkloin2" >豚ロース（厚切り）</td>
            </tr>
           <tr>
             <td style="border:none;"><input type="radio" name="food" value="porkbelly" >豚バラ肉</td>
            <td style="border:none;"><input type="radio" name="food" value="minched" >ひき肉</td>
            <td style="border:none;"><input type="radio" name="food" value="bacon" >ベーコン</td>
           </tr>
          </table>
          </div>
        </td>
        </tr>
        <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('fish').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">魚介類🐡</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="fish" style="display:none;clear:both;">
<!--//食材の整理のため、テーブルを作成  -->
<!--//1行あたり２つの食材を並べる。  -->
<!--//行を追加する場合、<tr><td>～</td></tr>を追加 -->
           <table style="bordder:none;">
            <tr>
             <td style="border:none;"><input type="radio" name="food" value="azi">ブリ</td>
             <td style="border:none;"><input type="radio" name="food" value="buri" >アジ</td>
             <td style="border:none;"><input type="radio" name="food" value="shrimp" >エビ</td>
            <tr>
             <td style="border:none;"><input type="radio" name="food" value="sakurashrimp">桜エビ</td>
            </tr>
           </table>
          </div>
        </td>
        </tr>
        <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('vegetable').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">野菜🥬</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="vegetable" style="display:none;clear:both;">
<!--//食材の整理のため、テーブルを作成  -->
<!--//1行あたり２つの食材を並べる。  -->
<!--//行を追加する場合、<tr><td></td></tr>を追加 -->
          <table style="border:none;">
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="radish" >大根</td>
            <td style="border:none;"><input type="radio" name="food" value="greenpeppar" >ピーマン</td>
            <td style="border:none;"><input type="radio" name="food" value="onion" >玉ねぎ</td>
           </tr>
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="mix" >ミックスベジタブル</td>
            <td style="border:none;"><input type="radio" name="food" value="carrot" >にんじん</td>
            <td style="border:none;"><input type="radio" name="food" value="broccoli"> ブロッコリー</td>
           </tr>
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="leek" >長ネギ</td>
            <td style="border:none;"><input type="radio" name="food" value="cabbage" >キャベツ</td>
            <td style="border:none;"><input type="radio" name="food" value="chive" >ニラ</td>
           </tr>
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="beansprout" >もやし</td>
            <td style="border:none;"><input type="radio" name="food" value="tomato" >トマト</td>
            <td style="border:none;"><input type="radio" name="food" value="coriander" >パクチー</td>
           </tr>
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="macrophyll" >大葉</td>
           </tr>
          </table>
        </div>
        </td>
        <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('other').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">穀類🍚・乳製品🥛・その他</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="other" style="display:none;clear:both;">
<!--//食材の整理のため、テーブルを作成  -->
<!--//1行あたり２つの食材を並べる。  -->
<!--//行を追加する場合、<tr><td></td></tr>を追加 -->
          <table style="border:none;">
           <tr>
            <td style="border:none;"><input type="radio" name="food" value="egg" >たまご</td>
            <td style="border:none;"><input type="radio" name="food" value="milk" >牛乳</td>
            <td style="border:none;"><input type="radio" name="food" value="cream" >生クリーム</td>
           </tr>
           <tr style="border:none;">
            <td style="border:none;"><input type="radio" name="food" value="cheese" >チーズ</td>
            <td style="border:none;"><input type="radio" name="food" value="bambooshoot" >タケノコの水煮</td>
            <td style="border:none;"><input type="radio" name="food" value="tofu" >豆腐</td>
           </tr>
           <tr style="border:none;">
            <td style="border:none;"><input type="radio" name="food" value="clam" >アサリの水煮</td>
            <td style="border:none;"><input type="radio" name="food" value="kimchi" >キムチ</td>
            <td style="border:none;"><input type="radio" name="food" value="peanuts" >ピーナッツ</td>
           </tr>
           <tr style="border:none;">
            <td style="border:none;"><input type="radio" name="food" value="seawood" >のり</td>
           </tr>
          </table>
          </div>
        </td>
        </tr>
</table>
</td>

<td valign="top" valign="top"style="border:none;">
<table class="table2" style="border:none;">
      <tr style="border:none;">
       <th style="border:none;">ジャンル</th>
         <td>
          <label>
          <select name ="genre">
            <option value="empty"></option>
          	<option value="japan">和食</option>
          	<option value="western">洋食</option>
          	<option value="china">中華</option>
          	<option value="other">その他</option>
          </select>
          </label>
        </td>
      </tr>
      <tr>
        <th style="border:none;">カロリー</th>
        <td style="border:none;">
          <div>～<input type="text" name="cal">cal</div>
        </td>
      </tr>
      <tr style="border:none;">
       <th style="border:none;">難易度</th>
        <td>
          <label>
            <select name ="difficulty">
          	<option value="easy">★☆☆</option>
          	<option value="normal">★★☆</option>
          	<option value="difficult">★★★</option>
          </select>
          </label>
        </td>
      </tr>
      <tr>
        <th style="border:none;">はらペコーぬのきまぐれスイッチ</th>
        <td>
         <label>
         <input type="radio" name="feeling" value="yes" checked>
         <input type="radio" name="feeling" value="no">
          </label>
        </td>
      </tr>
</table>
</td>
</tr>
</table>
<input type="submit"  value="決定" >
</form>
</div>

</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>