<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <label><c:out value="${dish.name}"/>
          </label>
        </td>
        <td style="border:none;">
          <label><c:out value="${dish.path}"/>
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
         <label><c:forEach var="dish" items="${foodlist }" >
         <p><c:out value="${dish.food}"/> //for文を使った訂正が必要
          </p>
          </c:forEach></label>
        </td>
      </tr>
      <tr style="border:none;">
       <th style="border:none;">ジャンル</th>
        <td style="border:none;">
          <label><c:out value="${dish.genre}"/>
          </label>
        </td>
      </tr>
      <tr>
        <th style="border:none;">カロリー</th>
        <td style="border:none;">
          <label><c:out value="${dish.cal}"/>
          </label>
        </td>
      </tr>
      <tr style="border:none;">
       <th style="border:none;">難易度</th>
        <td style="border:none;">
          <label><c:out value="${dish.diff}"/>
          </label>
        </td>
      </tr>
      <tr>
        <th style="border:none;">作り方URL</th>
         <td style="border:none;">
          <label><c:out value="${dish.url}"/>
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