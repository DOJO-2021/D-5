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


	<div class="poem">
	<p class="poem1"><strong>あなたの自炊は、ボタンをひとつ押すところから。</strong></p>
    <p>「またカレーかぁ」</p>
	<p>今日も日本のどこかで誰かがつぶやいています。</p>
	<p>毎回作る料理を決めるのって本当に大変。</p>
	<p>「はらペコ。」は、そんなあなたの手助けをします。</p>
	</div>

	<div class="dishsuggest">
		<form method = "get" action="/Harapeko/SuggestServlet" name="geo">
		<a href="javascript:a();"><img src="/Harapeko/images/条件入力.jpg"  alt="条件入力へ"  class="img_center" onClick="a();"></a>
		<input type="hidden" name="lat" id="lat">
		<input type="hidden" name="lng" id="lng">
<!-- 	<input type="image" src="/Harapeko/images/条件入力.jpg"  alt="条件入力へ">  -->
		</form>
	</div>

	<ul class="m_btn">
	  <li>
		<section class="mainbtn">
		  <a href="/Harapeko/GalleryServlet" class="btn_02_a"><span>ギャラリー</span></a>
		  </section>
	  </li>
 	  <li>
 	    <section class="mainbtn">
  		 <a href="/Harapeko/ColumnServlet" class="btn_02_a"><span>コラム&emsp;</span></a>
		</section>
	  </li>
	</ul>


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
 <script  type="text/javascript" src="js/pos1.js"></script>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
