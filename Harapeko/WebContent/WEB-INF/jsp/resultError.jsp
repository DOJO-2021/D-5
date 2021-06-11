<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="styleSheet" href="/Harapeko/css/common.css">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<main>
<div class="wrapper">
	<button onclick="javascript:history.back();">前の画面に戻る</button>
	<h1 class="heading">検索結果</h1>

	<div class="recommend">
		<p>条件に当てはまる料理は見つかりませんでした。</p>
	</div>

	<div class="peko">
		<img alt="はらペコーぬ" src="/Harapeko/images/harapekonu1.jpg">
	</div>
</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>