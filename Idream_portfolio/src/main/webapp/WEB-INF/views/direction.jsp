<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찾아오시는길</title>
<link rel="stylesheet" href="../resources/css/header.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/direction.css">
<link rel="stylesheet" href="../resources/css/font.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons "
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- Swiper.js -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"
	integrity="sha512-H6cPm97FAsgIKmlBA4s774vqoN24V5gSQL4yBTDOY2su2DeXZVhQPxFK4P6GPdnZqM9fg1G3cMv5wD7e6cFLZQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/ScrollToPlugin.min.js"
	integrity="sha512-agNfXmEo6F+qcj3WGryaRvl9X9wLMQORbTt5ACS9YVqzKDMzhRxY+xjgO45HCLm61OwHWR1Oblp4QSw/SGh9SA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
	integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script defer src="../resources/js/direction.js"></script>
</head>
<body>
	<header>
		<div class="inner">
			<nav class="navbar">
				<a href="/index" class="logo"> <img
					src="../resources/img/logo.png" alt="I dream" />
				</a>
				<ul class="navbar__menu">
				<se:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="/userlist/admin">회원정보</a></li>
				</se:authorize>
					<li><a href="/direction">찾아오시는 길</a></li>
					<li><a href="/questions">Q&A</a></li>
					<li><a href="/userlist/hu1">후원하기</a></li>
					<se:authorize access="isAnonymous()">
					<li><a href="/user/signup">회원가입</a></li>
					<li><a href="/customLogin">로그인</a></li>
					</se:authorize>
					<se:authorize access="isAuthenticated()">
					<li><a href="/customLogout">로그아웃</a>
					</se:authorize>
				</ul>

				<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</div>
		<!--뱃지-->
		<div class="badges">
			<div class="badge">
				<img src="../resources/img/badge1.png" alt="Badge" />
			</div>
			<div class="badge">
				<img src="../resources/img/badge2.png" alt="Badge" />
			</div>
		</div>
		<!-- Channel Plugin Scripts -->
		<script>
			(function() {
				var w = window;
				if (w.ChannelIO) {
					return (window.console.error || window.console.log || function() {
					})('ChannelIO script included twice.');
				}
				var ch = function() {
					ch.c(arguments);
				};
				ch.q = [];
				ch.c = function(args) {
					ch.q.push(args);
				};
				w.ChannelIO = ch;
				function l() {
					if (w.ChannelIOInitialized) {
						return;
					}
					w.ChannelIOInitialized = true;
					var s = document.createElement('script');
					s.type = 'text/javascript';
					s.async = true;
					s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
					s.charset = 'UTF-8';
					var x = document.getElementsByTagName('script')[0];
					x.parentNode.insertBefore(s, x);
				}
				if (document.readyState === 'complete') {
					l();
				} else if (window.attachEvent) {
					window.attachEvent('onload', l);
				} else {
					window.addEventListener('DOMContentLoaded', l, false);
					window.addEventListener('load', l, false);
				}
			})();
			ChannelIO('boot', {
				"pluginKey" : "700d6c6c-4b83-41e5-98f2-e7d89467e38b"
			});
		</script>
	</header>
	<!-- * 카카오맵 - 지도퍼가기 -->
	<!-- 1. 지도 노드 -->
	<div id="map_wrap">
		<div class="map">
			<div id="daumRoughmapContainer1662433513764"
				class="root_daum_roughmap root_daum_roughmap_landing"
				style="width: 100%"></div>
			<!-- 2. 설치 스크립트
    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1662433513764",
					"key" : "2bmmr",
					"mapHeight" : "600"
				}).render();
			</script>
		</div>
	</div>
	<!--후원하기-->
	<section class="find-store scroll-spy">
		<div id="scroll_wrap">
			<!-- <img src="../resources/img/train.jpg" alt="" class="picture1 back-to-position to-right" /> -->

			<p class="description back-to-position to-left delay-1 txt_wrap">
				<span class="txt01">찾아오시는 길 (지하철 안내)</span><br />
				<span class="txt02">구로캠퍼스<br />1호선 구로역 3번 출구 나오면 바로 <br />구로광장 대각선
					방향 4거리 횡단보도 건너 신한은행4층
				</span>
			</p>
		</div>
	</section>

   <!--FOOTER-->
   <footer>
      <div class="inner">
         <div class="btn-group">
            <a href="/direction" class="btn btn--white">찾아오시는 길</a> <a
               href="/inquiry/list" class="btn btn--white">문의하기</a> <a
               href="/tip/list" class="btn btn--white">제보하기</a>
         </div>
         <div class="info">
            <span>사업자번호 123-45-678901</span> <span>(주)아이찾기 프로젝트</span> <span>TEL
               : 02) 1234-5678 / FAX : 02) 1234-5678</span> <span>사이트 관리자 : 김아무개</span>
         </div>
         <p class="copyright">
            &copy; <span class="this-year"></span> Find Child Company. All
            Rights Reserved.
         </p>
      </div>
   </footer>

	<!--TO TOP BUTTON-->
	<div id="to-top">
		<div class="material-icons">arrow_upward</div>
	</div>
	<script src="../resources/js/header.js"></script>
</body>
</html>