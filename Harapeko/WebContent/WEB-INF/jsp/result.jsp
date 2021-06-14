<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="styleSheet" href="/Harapeko/css/common.css">
	<link rel="stylesheet" href="/Harapeko/css/NewFile.css">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<header class="header">
		<div class="logo">
			<h1><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></h1>
		</div>
<main>
<div class="wrapper">
<button onclick="javascript:history.back();">前の画面に戻る</button>
<h2>今日のメニューはこれだ！</h2>
<!-- <h3>${comment}</h3> -->

<!-- 料理名 -->
  <h3>${dish.name}</h3>

<div class="table">
<table style="border:none;">
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

        <td style="border:none;">
          <label><img src="/Harapeko/${dish.path}">
            </label>
        </td>


</table>
</td>

<td valign="top" style="border:none;">
<table style="border:none;">
	  <tr style="border:none;">
	   <th style="border:none;">食材</th>
        <td style="border:none;">
         <label><c:forEach var="food" items="${dish.foodList}">
         <p>${food.name}
          </p>
          </c:forEach></label>
        </td>
      </tr>
      <tr style="border:none;">
       <th style="border:none;">ジャンル</th>
        <td style="border:none;">
          <label>${dish.genre}
          </label>
        </td>
      </tr>
      <tr>
        <th style="border:none;">カロリー</th>
        <td style="border:none;">
          <label>${dish.cal}
          </label>
        </td>
      </tr>
      <tr style="border:none;">
       <th style="border:none;">難易度</th>
        <td style="border:none;">
          <label>${dish.diff}
          </label>
        </td>
      </tr>
      <tr>
        <th style="border:none;">作り方URL</th>
         <td style="border:none;">
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
	<input type="submit" value="再提案">
</form>
<a href="/Harapeko/MainServlet">メインへ戻る</a>
</div>
</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>