<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>

<a href="/Harapeko/SuggestServlet">前の画面に戻る</a>
<h1>今日のメニューはこれだ！</h1>

<table>
      <tr>
        <td>
          <label>料理名：<c:out value="${dish.dish}">
          </label>
        </td>
        <td>
          <label><c:out value="${dish.image}">
            </label>
        </td>
       </tr>
	  <tr>
        <td>
         <label>食材：<c:out value="${dish.food}"> //for文を使った訂正
          </label>
        </td>
       </tr>
      <tr>
        <td>
          <label>ジャンル：<c:out value="${dish.genre}">
          </label>
        </td>
        <td>
          <label>住所<br><input type="text" name="ADDRESS" value="${e.address}">
          </label>
        </td>
      </tr>
      <tr>
        <td>
          <label>電話番号<br><input type="text" name="PHONE" value="${e.phone}">
          </label>
        </td>
        <td>
          <label>FAX番号<br><input type="text" name="FAX" value="${e.fax}">
          </label>
        </td>
        </tr>
        <tr>
        <td>
          <label> Email<br><input type="text" name="EMAIL" value="${e.email}">
          </label>
        </td>
        <td>
          <label>備考<br><input type="text" name="REMARKS" value="${e.remarks}">
          </label>
        </td>
        </tr>
 </table>




<h3>ジャンル：<c:out value="${dish.genre}">
<h3>カロリー：<c:out value="${dish.cal}"</h3>
<h3>難易度：<c:out value="${dish.difficulty}"</h3>
<h3>作り方URL：<c:out value="${dish.url}"</h3>
<a href="/Harapeko/MainServlet">メインへ戻る</a>







</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>