<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="styleSheet" href="/Harapeko/css/common.css">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>
<div class="wrapper">
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
</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>