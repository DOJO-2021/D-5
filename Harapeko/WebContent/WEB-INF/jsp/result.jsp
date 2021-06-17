<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript" src="js/weather.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link rel="styleSheet" href="/Harapeko/css/common.css">
	<link rel="stylesheet" href="/Harapeko/css/NewFile.css">
	<header class="header">
		<div class="logo">
				<h1><a href="/Harapeko/MainServlet"><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></a></h1>
		</div>
		</header>
<main>
<div class="wrapper">
<button onclick="javascript:history.back();" class="button2">前の画面に戻る</button>
<h2>今日のメニューはこれだ！</h2>
<!-- <h3>${comment}</h3> -->

<!-- 料理名 -->
  <h3>  &emsp; ${dish.name}  </h3>

<div class="table">
<table style="border:none;" class="r_table">
<tr style="border:none;">
<td valign="top" style="border:none;">
<table style="border:none;">


  <!--
      <tr style="border:none;">
       <th style="border:none;">料理名</th>
        <td style="border:none;">
          <label>${dish.name}
          </label>
        </td> -->

        <tr>
         <img src="/Harapeko/${dish.path}">

        </tr>


</table>
</td>

<td>
<table>
	  <tr>
	   <th>食材</th>
        <td class="td2">
         <label><c:forEach var="food" items="${dish.foodList}">
         <p>${food.name}
          </p>
          </c:forEach></label>
        </td>
      </tr>

      <tr>
       <th>ジャンル</th>
        <td class="td2">
          <label>${dish.genre}
          </label>
        </td>
      </tr>
      <tr>
        <th>カロリー</th>
        <td class="td2">
          <label>${dish.cal} kcal
          </label>
        </td>
      </tr>
      <tr >
       <th >難易度</th>
        <td class="td2">
          <label>${dish.diff}
          </label>
        </td>
      </tr>
      <tr>
        <th>作り方URL</th>
         <td class="td2">
          <label><a href="${dish.url}">${dish.url}</a>
          </label>
         </td>
      </tr>
</table>
</td>
</tr>
</table>
</div>
<form method="post" action="/Harapeko/SuggestServlet">
	<input type="hidden" name="food" value="${food}">
	<input type="hidden" name="id" value="${id}">
	<input type="hidden" name="cal" value="${cal}">
	<input type="hidden" name="difficulty" value="${diff}">
	<input type="hidden" name="genre" value="${genre}">
	<input type="hidden" name="feeling" value="${feeling}">
	<input type="hidden" name="t_switch" value="${t_switch}">
	<input type="hidden" name="temp" id="temp">

	<input type="submit" value="再提案"  class="button3">
</form>
<a href="/Harapeko/MainServlet">メインへ戻る</a>
</div>
</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>