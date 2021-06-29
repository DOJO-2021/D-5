<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="styleSheet" href="/Harapeko/css/common.css">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<header class="header">
		<div class="logo">
		 <h1><a href="/Harapeko/MainServlet"><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></a></h1>
		</div>
	</header>
<main>
<div class="wrapper">
	<button onclick="javascript:history.back();" class="button2">前の画面に戻る</button>
	<h2 class="heading">検索結果</h2>

	<div class="recommend">
		<h3>条件に当てはまる料理は見つからなかったペコ・・・。</h3>
	</div>

	<div class="peko">
		<img alt="はらペコーぬ" src="/Harapeko/images/harapekonu5.jpg">
	</div>
</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>