<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>후원</title>
<link rel="stylesheet" href="../resources/css/donatemain.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/footer.css">
<link rel="stylesheet" href="../resources/css/font.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
   <script defer src="../resources/js/donatemain.js"></script>
   <script defer src="../resources/js/youtube.js"></script>
</head>
<body>
	<header>
		<div class="inner">
			<nav class="navbar">
				<a href="/index" class="logo"> <img
					src="../resources/img/logo.png" alt="I dream" />
				</a>
				<ul class="navbar__menu">
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

	<section class="visual">
  <div class="inner">
    <div class="title fade-in">
    <img src="../resources/img/후원하기헤더텍스트.png" alt="후원하기 헤더 텍스트" />
    </div>
    <div class="fade-in">
    <img src="../resources/img/헤더이미지.png" alt="child1" class="child1 image" />
    </div>
    
  </div>
</section>



<!--YOUTUBE VIDEO-->
<section class="youtube">
  <div class="youtube__area">
    <div id="player"></div>
  </div>
  <div class="youtube__cover"></div>
</section>



<!--RESERVE STORE-->
<section class="reserve-store">
  <div class="inner">
    <div class="medal">
      <div class="front">
        <img src="../resources/img/도네이트.png" alt="" />
      </div>
      <div class="back">
        <img src="../resources/img/후원텍스트3.png" alt="" />
        <a class="btn" onclick="fn_buy()">
          후원하기
        </a>
      </div>
    </div>
  </div>
</section>





<!--PICK YOUR FAVORITE-->
<section class="pick-your-favorite scroll-spy">
  <div class="inner">
    <div class="text-group">
      <img src="../resources/img/후원사용텍스트1.png" alt="" class="title back-to-position to-right" />
      <img src="../resources/img/후원사용텍스트2.png" alt="" class="description back-to-position to-right delay-1" />
    </div>
  </div>
</section>

<!--후원하기-->
<section class="find-store scroll-spy">
  <div class="inner">
    <img src="../resources/img/후원이미지1.jpg" alt="" class="picture1 back-to-position to-right" />
    <img src="../resources/img/후원이미지2.jpg" alt="" class="picture2 back-to-position to-right delay-1" />
    <div class="text-group">
      <img src="../resources/img/후원텍스트1.png" alt="" class="title back-to-position to-left" />
      <img src="../resources/img/후원텍스트2.png" alt="" class="description back-to-position to-left delay-1" />
      <div class="more back-to-position to-left delay-2">
        <a href="javascript:void(0)" class="btn">자주묻는질문</a>
      </div>
    </div>
  </div>
</section>

	<script>
		function fn_buy() {
			var IMP = window.IMP;
			IMP.init("imp70414242");
			IMP.request_pay({
				pg : "html5_inicis",
				pay_method : "card",
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : "Snack",
				amount : 10,
				buyer_email : "hwangsh097@gmail.com",
				buyer_name : "황서현",
				buyer_tel : "010-1234-5678",
				buyer_addr : "서울특별시 강남구 역삼동",
				buyer_postcode : "11111",
				m_redirect_url : "/paymentDone.do"
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount + '원\n';
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '에러내용 : ';
					msg += rsp.error_msg;
				}
				alert(msg);
			});
		}
	</script>
	<script src="../resources/js/header.js"></script>
<!--AWARDS-->
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
</body>
</html>

