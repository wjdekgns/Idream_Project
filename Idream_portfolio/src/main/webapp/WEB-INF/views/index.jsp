<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/font.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>3팀 미션</title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/default.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons "
   rel="stylesheet">
<link rel="stylesheet"
   href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- Swiper.js -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
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
<script defer src="../resources/js/main.js"></script>

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
      <!--BADGES-->
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
      
      
      <!-- End Channel Plugin -->
   </header>
   <!--VISUAL-->
   <section id="section01">
         <div id="bg">
         <img src="../resources/img/sky_bg.png" alt=""  />
         	<!-- <div id="bg_txt">
         		<p>I DREAM</p>
         		<p>Finding children's dreams</p>
         	</div> -->
         </div>
   </section>

   <!--NOTICE-->
   <section class="notice">

      <div class="inner">
         <div class="inner__left">
            <h2>안내</h2>
            <div class="swiper">
               <div class="swiper-wrapper">
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">실종 아동들을 찾을수 있는 사이트입니다.</a>
                  </div>
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">실종 아이를 등록하고 싶으시면 등록게시판으로</a>
                  </div>
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">실종 아이의 제보하시려면 실종 아동 제보 페이지로 이동해
                        주시길 바랍니다.</a>
                  </div>
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">항상 저희 사이트를 이용해주셔서 감사합니다</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="inner__right"></div>

      </div>
   </section>

   <!--PROMOTION-->
   <section class="container">
      <div class="row">
        <div class="col-lg-3">
          <div class="service-item first-service">
            <div class="icon"></div>
            <h4><a href="/inquiry/list">문의하기</a></h4>
            <p><a href="/inquiry/list">궁금한 점을 문의할 수 있는 페이지입니다.</a></p>
            <div class="text-button">
              <a href="/inquiry/list">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-item second-service">
            <div class="icon"></div>
            <h4><a href="/missing/list">실종 아동 등록</a></h4>
            <p><a href="/missing/list">실종 아동을 등록 할 수 있는 페이지입니다.</a></p>
            <div class="text-button">
              <a href="/missing/list">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-item third-service">
            <div class="icon"></div>
            <h4><a href="/tip/list">실종 아동 제보</a></h4>
            <p><a href="/tip/list">실종 아동을 제보 할 수 있는 페이지입니다.</a></p>
            <div class="text-button">
              <a href="/tip/list">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-item fourth-service">
            <div class="icon"></div>
            <h4><a href="/notice/list">공지사항</a></h4>
            <p><a href="/notice/list">사이트의 공지사항을 볼 수 있는 페이지입니다.</a></p>
            <div class="text-button">
              <a href="/notice/list">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!--PROMOTION-->
    
<section class="promotion">
  <div class="swiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <img src="../resources/img/slide1.png" alt="" />
        <a href="/userlist/hu1" class="btn">후원하기</a>
      </div>
      <div class="swiper-slide">
        <img src="../resources/img/slide2.png" alt="" />
        <a href="/userlist/hu1" class="btn">후원하기</a>
      </div>
      <div class="swiper-slide">
        <img src="../resources/img/slide3.png" alt="" />
        <a href="/userlist/hu1" class="btn">후원하기</a>
      </div>
    </div>
  </div>
  <div class="swiper-pagination"></div>
  <div class="swiper-button-prev">
    <span class="material-icons">arrow_back</span>
  </div>
  <div class="swiper-button-next">
    <span class="material-icons">arrow_forward</span>
  </div>
</section> 
   
<section class="awards">
    <div class="inner">
      <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img  src="../resources/img/awrad-slide1.png"  alt="1" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide2.png" alt="2" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide3.png" alt="3" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide4.png" alt="4" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide5.png" alt="5" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide6.png" alt="6" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide7.png" alt="7" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide8.png" alt="8" />
          </div>
          <div class="swiper-slide">
            <img src="../resources/img/awrad-slide9.png" alt="9" />
          </div>
        </div>
      </div>
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