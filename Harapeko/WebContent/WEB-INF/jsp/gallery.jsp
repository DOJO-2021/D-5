<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h2 class="heading">ギャラリー</h2>

		<c:forEach var="e" items="${List}">
			<form method="post" action="/Harapeko/GalleryServlet">
				<input type="text" name="id" value="${e.id}">
				<input type="image" src="/Harapeko/${e.path}">
			</form>

		</c:forEach>

	</div>
</main>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
