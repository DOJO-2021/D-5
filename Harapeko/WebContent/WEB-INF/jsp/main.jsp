<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>
	<h1 class="heading">メインメニュー</h1>

	<div class="dishsuggest">
		<a href="/Harapeko/SuggestServlet">
			<img alt="条件入力へ" src="">
		</a>
	</div>

	<div class="recommend">
		<p>今日のおすすめ食材は</p>
		<p>${recomend}</p>
	</div>

	<div class="peko">
		<img alt="はらペコーぬ" src="">
	</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>