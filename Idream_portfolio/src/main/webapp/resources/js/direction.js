/**
 * 순서대로 나타나는 기능
 */
// 나타날 요소(.fade-in)들을 찾기
const fadeEls = document.querySelectorAll('.visual .fade-in');
// 요소들을 하나씩 반복해서 처리!
fadeEls.forEach(function (fadeEl, index) {
  // 각 요소들을 순서대로(delay) 보여지게 함!
gsap.to(fadeEl, 1, {
    delay: (index + 1) * .7,
    opacity: 1
});
});

const badgeEl = document.querySelector('header .badges');
const toTopEl = document.querySelector('#to-top');

window.addEventListener('scroll', function () {
    // 페이지 스크롤 위치가 300px이 넘으면.
    if (window.scrollY > 300) {
      // Badge 요소 숨기기!
    gsap.to(badgeEl, .6, {
        opacity: 0,
        display: 'none'
    });
    //이동 버튼 나타내기
    gsap.to(toTopEl, .6, {
        opacity: 1,
        x:0
    });

    // 페이지 스크롤 위치가 500px이 넘지 않으면.
    } else {
      // Badge 요소 보이기!
    gsap.to(badgeEl, .6, {
        opacity: 1,
        display: 'block'
});
 // 이동 버튼 숨기기
    gsap.to(toTopEl, .6, {
    opacity: 0,
    x:100
});
}
});

toTopEl.addEventListener('click',function(){
    gsap.to(window, .6,{
        scrollTo :0
    });
});




/**
 * 슬라이드 요소 관리
 */
new Swiper('.notice .swiper', {
  direction: 'vertical', // 수직 슬라이드
  autoplay: true, // 자동 재생 여부
  loop: true // 반복 재생 여부
});
new Swiper('.promotion .swiper', {
  // direction: 'horizontal', // 수평 슬라이드
  autoplay: { // 자동 재생 여부
    delay: 5000 // 5초마다 슬라이드 바뀜
  },
  loop: true, // 반복 재생 여부
  slidesPerView: 3, // 한 번에 보여줄 슬라이드 개수
  spaceBetween: 10, // 슬라이드 사이 여백
  centeredSlides: true, // 1번 슬라이드가 가운데 보이기
  pagination: { // 페이지 번호 사용
    el: '.promotion .swiper-pagination', // 페이지 번호 요소
    clickable: true // 사용자의 페이지 번호 제어 여부
  },
  navigation: { // 슬라이드 이전/다음 버튼 사용
    prevEl: '.promotion .swiper-button-prev', // 이전 버튼 요소
    nextEl: '.promotion .swiper-button-next' // 다음 버튼 요소
  }
});
new Swiper('.awards .swiper', {
  autoplay: true, // 자동 재생 여부
  loop: true, // 반복 재생 여부
  spaceBetween: 30, // 슬라이드 사이 여백
  slidesPerView: 5, // 한 번에 보여줄 슬라이드 개수
  navigation: { // 슬라이드 이전/다음 버튼 사용
    prevEl: '.awards .swiper-button-prev', // 이전 버튼 요소
    nextEl: '.awards .swiper-button-next' // 다음 버튼 요소
  }
});


// 관리할 요소들 검색!
const spyEls = document.querySelectorAll('section.scroll-spy');
// 요소들 반복 처리!
spyEls.forEach(function (spyEl) {
new ScrollMagic
    .Scene({ // 감시할 장면(Scene)을 추가
      triggerElement: spyEl, // 보여짐 여부를 감시할 요소를 지정
      triggerHook: .8 // 화면의 80% 지점에서 보여짐 여부 감시
    })
    .setClassToggle(spyEl, 'show') // 요소가 화면에 보이면 show 클래스 추가
    .addTo(new ScrollMagic.Controller()); // 컨트롤러에 장면을 할당(필수!)
});
