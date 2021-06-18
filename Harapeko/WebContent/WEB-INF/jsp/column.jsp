<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
 <!--  	<link rel="stylesheet" href="/Harapeko/css/NewFile.css">-->
</head>
<body>
	<header class="header">
		<div class="logo">
			<h1><a href="/Harapeko/MainServlet"><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></a></h1>
		</div>
	</header>
<main>
	<div class="wrapper">
	<a href="/Harapeko/MainServlet" class="main_btn">メインへ戻る</a>
		<h2 class="heading">コラム</h2>

	</div>

<!-- コラム案 -->
<div class="section">
 <div class="oneArea">
    <div class="onebox">
      <div class="imgArea"><img src="/Harapeko/images/harapekonu5.jpg" alt="はらペコーぬ"></div>
      <div class="fukiArea"><div class="fukidasi">		<p><strong>${column.title}</strong></p>
		<p>${column.content}</p></div>
    </div>
    </div>
    <div class="onebox">
      <div class="imgArea"><img src="/Harapeko/images/icon2.png"  alt="ユーザーさん"></div>
      <div class="fukiArea"><div class="fukidasi">はらペコーぬありがとう！</div></div>
    </div>
  </div>
</div>


</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>