<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<link rel="stylesheet" href="/Harapeko/css/NewFile.css">
</head>
<body>
	<header class="header">
		<div class="logo">
			<h1><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></h1>
		</div>
	</header>
<main>
<div class="wrapper">
	<h2 class="heading">メインメニュー</h2>

	<div class="dishsuggest">
		<a href="/Harapeko/SuggestServlet">
			<img alt="条件入力へ" src="/Harapeko/images/条件入力.jpg"class="img_center">
		</a>
	</div>

	<div class="recommend">
		<p>おすすめ食材は</p>
		<p>${recomend}</p>
	</div>

		<div id="peko" class="img_right">
			<a href="/Harapeko/ProfileServlet"><img alt="はらペコーぬ" src="/Harapeko/images/mainpeko.jpg" ></a>
		</div>


</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

