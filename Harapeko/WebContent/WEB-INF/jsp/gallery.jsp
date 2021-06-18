<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!--  	<link rel="stylesheet" href="/Harapeko/css/NewFile.css">-->
 <link rel="stylesheet" href="/Harapeko/css/gallery.css">
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript" src="js/jqfloat.min.js"></script>
 <script type="text/javascript" src="js/gallery.js"></script>
</head>
<body>
	<header class="header">
		<div class="logo">
			<h1><img alt="はらぺこ。" src="/Harapeko/images/logo1_2.jpg"></h1>
		</div>
	</header>
<main>
	<div class="wrapper">
	<a href="/Harapeko/MainServlet" class="main_btn">メインへ戻る</a>
		<h2 class="heading">写真を選んでクリックしてみてね</h2>
	<button onclick="window.location.reload(true);" class="button2">画像がうまく表示されない場合</button>
		<div id="gallery" class="gallery">
			<c:set var="i" value="1" />
			<c:forEach var="e" items="${List}">
				<div class="menus">
					<form method="post" action="/Harapeko/GalleryServlet">
						<input type="hidden" name="id" value="${e.id}">
						<input type="image" src="/Harapeko${e.path}" style="width:45%" id="dish${i}" class="menu">
						<input type="hidden" name="temp" value="15">
					</form>
				</div>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
