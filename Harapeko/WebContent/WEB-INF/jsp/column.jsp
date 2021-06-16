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
	<a href="/Harapeko/MainServlet">メインへ戻る</a>
		<h2 class="heading">コラム</h2>
		<p><strong>${column.title}</strong></p>
		<p><strong>${column.content}</strong></p>

		<p><img alt="はらペコーぬ" src="/Harapeko/images/mainpeko.jpg" ></p>
	</div>


</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>