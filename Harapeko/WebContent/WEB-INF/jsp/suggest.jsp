<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>



<table>


<table border="1">
 <tr>
  <th>食材</th>
 </tr>
 <tr>
  <td><div onclick="obj=document.getElementById('open').style; obj.display=(obj.display=='none')?'block':'none';">
      <a style="cursor:pointer;">肉</a>
      </div>
<!--// 折り畳み展開ポインタ -->

<!-- 折り畳まれ部分 -->
   <div id="open" style="display:none;clear:both;">
     <input type="radio" value="pig" checked>豚肉
          <input type="radio" value="pig" checked>豚肉


   </div></td>
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
</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>