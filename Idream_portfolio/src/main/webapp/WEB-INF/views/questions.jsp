<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page671 JSP에서 로그인한 사용자 정보 보여주기  : 아래 2줄 tablib 구문 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="../resources/css/header.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/donate.css">
<link rel="stylesheet" href="../resources/css/qna.css">
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="../resources/js/custom.js"></script>
<script src="../resources/js/qna.js"></script>
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
<style type="text/css">
.textBold {
	font-weight: bold !important;
}

.textContent {
	line-height: 28px;
	font-family: 'NanumBarunGothic';
	font-size: 20px;
}
</style>
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
					<li><a href="/user/signup">회원가입</a></li>
					<li><a href="/customLogin">로그인</a></li>
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
	<section class="visual" id="qa">
		<div class="inner">
			<p><span class="txt01">자주하는 질문과 답변</span><br /><br /><span class="txt02">여러분들이
					많이 <span class="or">질문</span>하시는 내용들과 그에 대한 <span class="or">답변</span>들을 볼 수 있습니다.</span></p>
			<p><img src="../resources/img/question2.png" alt="child" class="child1" /></p>
		</div>
	</section>

	<section class="faq">
		<div class="faq-inner">
			<br> <br> <br>
			<div class="accordion">
				<div class="accordion-item">
					<div class="title">Q. 실종아동등 예방을 위해 어떤 방법이 좋을까요?</div>
					<div class="content">
						<p class="textContent">A. 아동의 몸에 아이의 이름이 새겨진 목걸이나 팔지 등을 착용하게 하고,
							아동을 혼자 두지 마시고, 혼잡한 곳을 외출할 때에는 각별한 관심을 가져주시기 바랍니다. 아이에게 사진의 이름과 집 전화번호를 외울수 있도록 반복하여 교육해 주시기 바랍니다.</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 실종아동등을 보호하고 있는데 어떻게 해야 하나요?</div>
					<div class="content">
						<p class="textContent">A. 국번없이 182로 신고해 주세요. 가장 가까운 순찰지구대로 연락,
							경찰관이 출동하여 아동을 인계받아 안전한 경찰관서에 보호하면서 부모를 찾기 위한 노력을 하게 됩니다. 일정한 시간이 지나도록 부모를 찾지 못하면 아동은 일시보호시설로 보내지게 됩니다.</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 실종아동을 미연에 방지할 수 있는 생활습관으로는 어떤 것이 있을까요?</div>
					<div class="content">
						<p class="textContent">A. 가정에서는 어린이가 혼자 밖에 나가 놀지 않도록 해야 하며 낯선 사람의
							유혹에 넘어가지 않도록 가르쳐야하며, 길을 읽은 경우 주위 어른들에게 도움을 요청하거나 경찰에 신고할 수 있도록 평소 122 또는 182 전화번로를 외우도록 해야 하며 아이의 특징도 기록해 두어야 합니다.</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 아동정보 사전등록 방법과 절차를 알고 싶어요.</div>
					<div class="content">
						<p class="textContent">
							A. 사전등록은 '<b class="textBold">개별등록</b>'과 어린이집이나 유치원 등을 통한 '<b
								class="textBold">단체등록</b>'을 받고 있습니다. 개별등록을 원하시는 보호자께서는 가까운 경찰관서에 대상자(아동, 치매노인 등)과 함께 방문하셔서 사전등록신청서를 작성하시고 지문과 사진 등을 등록하시면 됩니다.
							단체등록을 원하시는 보호자께서는 어린집을 통해 사전등록신청서를 제출하시면 어린이집에서 단체로 등록을 해줄 것입니다. 이와 같이 사전등록을 신청하여 등록을 마친 보호자께는 "<b class="textBold">사전등록증</b>"을 교부해 드립니다.
						</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 아동정보 사전등록된 대상자가 실종이 되거나 못찾는 경우, 어떻게 찾게
						되나요?</div>
					<div class="content">
						<p class="textContent">A. 집을 못 찾거나 길을 잃고 배회하는 아동, 치매노인,
							장애인(지적장애, 자폐성장애, 정신지체장애인)을 찾는 신고가 경찰관서에 접수되면 사전등록정보 등록된 자료를 찾아, 대조 및 확인 등을 통해 신고자 및 가족에게 연락을 해서 찾아주게 될 것입니다.</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 신고하면 어떻게 찾아주는 건가요?</div>
					<div class="content">
						<p class="textContent">A. 경찰관서에 보호된 경우 인상착의와 나이 등을 비교하여 찾는
							신고와의 유사점이 있으면 신고자에게 연락하여 확인토록 하고 있습니다. 아이를 잃어버린 보호자분이나 길거리에서 아이를 발견하신 분이 빨리 182로 신고해 주시는 것이 무엇보다도 중요합니다.</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 실종아동찾기센터에서 실종아동등미아 전단지도 작성해 주나요?</div>
					<div class="content">
						<p class="textContent">A. 매년 정기적으로 수배전단을 만들어서 배포하기도 하고, 사이버경찰청 사진수배, 휴대전화 수배 등을 합니다.</p>
					</div>
				</div>

				<div class="accordion-item">
					<div class="title">Q. 초등학생인 자녀가 가출을 했는데, 어떻게 하면 되나요?</div>
					<div class="content">
						<p class="textContent">A. 14세 미만인 실종아동은 국번없이 182센터로 전화해 주시면 즉시
							경찰청 정보통신망에 입력, 신속하게 소재 발견, 부모님께 인계해 드립니다. 자주 가출을 한다면 병원이나 청소년상담소를 방문, 상담치료가 필요합니다.</p>
					</div>
				</div>
				<div class="accordion-item">
					<div class="title">Q. 중학교 다니는 딸아이가 가출을 했는데 핸드폰 위치파악을 해 주나요?</div>
					<div class="content">
						<p class="textContent">A. 핸드폰 위치추적은 통신비밀보호법에 의해 범죄와의 관련성이 있다고
							판단되었을 경우 수사상 목적으로만 가능합니다. 가까운 경찰관서 여성청소년계에 방문하셔서 상담하시기 바랍니다.</p>
					</div>
				</div>
			</div>
		</div>

	</section>

	<br>
	<br>
	<br>



	<!--FOOTER-->
	<footer>
		<div class="inner">
			<div class="btn-group">
				<a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a> <a
					href="javascript:void(0)" class="btn btn--white">후원하기</a> <a
					href="javascript:void(0)" class="btn btn--white">공지사항</a>
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</body>
</html>