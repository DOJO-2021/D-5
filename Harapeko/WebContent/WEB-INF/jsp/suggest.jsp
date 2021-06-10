<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>

<a href="/Harapeko/MainServlet">メインへ戻る</a>
<h1>どんな気分？</h1>

<div>
<form method="POST" action="/Harapeko/SuggestServlet" name="SUGGEST">
<table class="table1"style="border:none;">
<tr style="border:none;">
<td valign="top" style="border:none;">
<table style="border:none;">
      <tr style="border:none;">
       <td style="border:none;"><strong>食材</strong></td>
      </tr>
      <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('meat').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">肉</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="meat" style="display:none;clear:both;">
            <input type="radio" name="food" value="pork" checked>豚肉
            <input type="radio" name="food" value="chicken" >鶏肉
            <input type="radio" name="food" value="beef" >牛肉
          </div>
        </td>
        </tr>
        <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('fish').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">魚介類</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="fish" style="display:none;clear:both;">
            <input type="radio" name="food" value="Azi" checked>あじ
            <input type="radio" name="food" value="Iwashi" >いわし
            <input type="radio" name="food" value="Sanma" >さんま
          </div>
        </td>
        </tr>
        <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('vegetable').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">野菜</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="vegetable" style="display:none;clear:both;">
            <input type="radio" name="food" value="carrot" checked>にんじん
            <input type="radio" name="food" value="onion" >たまねぎ
            <input type="radio" name="food" value="green peper" >ピーマン
          </div>
        </td>
        <tr>
        <td style="border:none;">
          <div onclick="obj=document.getElementById('other').style; obj.display=(obj.display=='none')?'block':'none';">
              <a style="cursor:pointer;">穀類・乳製品・その他</a>
          </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
          <div id="other" style="display:none;clear:both;">
            <input type="radio" name="food" value="milk" checked>牛乳
            <input type="radio" name="food" value="egg" >たまご
            <input type="radio" name="food" value="rice" >米
            <input type="radio" name="food" value="spaghetti" >スパゲッティ
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