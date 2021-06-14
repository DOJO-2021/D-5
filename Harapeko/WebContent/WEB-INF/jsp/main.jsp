<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/header.jsp"/>
 <!--  	<link rel="stylesheet" href="/Harapeko/css/NewFile.css">-->
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

   <!--はらぺこーぬの吹き出しからおすすめ食材 -->
<div class="gazo_ni_moji">
			<a href="/Harapeko/ProfileServlet"><img alt="はらペコーぬ" src="/Harapeko/images/mainpeko.jpg" ></a>
 		<div class="gazo_no_moji">
 		<p>おすすめ食材は</p>
		<p><strong>${recomend}</strong></p>
		</div>
</div>



</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

