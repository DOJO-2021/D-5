<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>

<a href="/Harapeko/SuggestServlet">前の画面に戻る</a>
<h1>今日のメニューはこれだ！</h1>

<table>
      <tr>
        <td>
          <label>料理名：<c:out value="${dish.name}">
          </label>
        </td>
        <td>
          <label><c:out value="${dish.path}">
            </label>
        </td>
      </tr>
</table>
<table>
	  <tr>
	   <th>食材</th>
        <td>
         <label><c:out value="${dish.foodList}"> //for文を使った訂正が必要。
          </label>
        </td>
      </tr>
      <tr>
       <th>ジャンル</th>
        <td>
          <label><c:out value="${dish.genre}">
          </label>
        </td>
        <th>カロリー</th>
        <td>
          <label><c:out value="${dish.cal}">
          </label>
        </td>
      </tr>
      <tr>
       <th>難易度</th>
        <td>
          <label><c:out value="${dish.diff}">
          </label>
        </td>
        <th>作り方URL</th>
         <td>
          <label><c:out value="${dish.url}">
          </label>
         </td>
      </tr>
</table>
<button>再提案</button>
<a href="/Harapeko/MainServlet">メインへ戻る</a>
</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>