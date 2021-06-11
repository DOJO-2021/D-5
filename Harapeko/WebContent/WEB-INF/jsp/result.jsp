<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="styleSheet" href="/Harapeko/css/common.css">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>
<div class="wrapper">
<a href="/Harapeko/SuggestServlet">前の画面に戻る</a>
<h1>今日のメニューはこれだ！</h1>

<div class="table">
<table style="border:none;">
<tr style="border:none;">

<td valign="top" style="border:none;">
<table style="border:none;">
      <tr style="border:none;">
       <th style="border:none;">料理名</th>
        <td style="border:none;">
          <label>${dish.name}
          </label>
        </td>
        <td style="border:none;">
          <label><img src="/Harapeko/${dish.path}">
            </label>
        </td>
      </tr>
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
<button>再提案</button>
<a href="/Harapeko/MainServlet">メインへ戻る</a>
</div>
</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>