<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>
	<h1 class="heading">メインメニュー</h1>

	<div class="dishsuggest">
		<form method="post">
			<button type="submit" ><img alt="条件入力へ" src=""></button>
		</form>
	</div>

	<div class="recommend">
		<p>おすすめ食材は</p>
		<p>${recomend}</p>
	</div>

	<div class="peko">
		<img alt="はらペコーぬ" src="">
	</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>