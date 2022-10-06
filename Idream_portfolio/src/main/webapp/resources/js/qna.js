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
