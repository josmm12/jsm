// vanilla js

// const searchE1 = document.querySelector('.search');
// const searchInputE1 = document.querySelector('input');

// // input과 돋보기 아이콘을 클릭했을 때
// searchE1.addEventListener('click', function(){
//     searchInputE1.focus();
// });

// // inputbox 포커스가 될때
// searchInputE1.addEventListener('focus', function(){
//     searchInputE1.setAttribute('placeholder', '통합검색');
// });

// searchInputE1.addEventListener('blur', function(){
//     searchInputE1.setAttribute('placeholder', '');
// });


// jquery js

$('.search').click(function(){
    $('input').focus();
});

$('input').focus(function(){
    $('input').attr('placeholder', '통합검색');
});

$('input').blur(function(){
    $('input').attr('placeholder', '');
});


window.addEventListener('scroll', _.throttle(function(){
    console.log(window.scrollY);
    if(window.scrollY > 500) {
        // 배지 숨기기
        // $('.badges').hide();
        gsap.to('header .badges', 0.4, {
            opacity: 0
        });
    } else {
        // 배지 보이기
        // $('.badges').show();
        gsap.to('header .badges', 0.4, {
            opacity: 1
        });
    }
}, 300));
    
// visual 애니메이션

const fadeEls = document.querySelectorAll('.visual .fade-in');
fadeEls.forEach(function(value, index){
    console.log('index: ' + index, value)

    // gsap.to(요소, 지속시간 ,옵션)
    gsap.to(value, 1, {
        delay: (index + 1) * 0.7,
        opacity: 1,
    })
});


// notice swpier rolling
new Swiper('.notice-line .swiper-container', {
      // Optional parameters
  direction: 'vertical',
  loop: true,
  autoplay: {
    delay: 2000,
  }
});

// promotion swpier rolling
new Swiper('.promotion .swiper-container', {
    slidesPerView: 3, // 표시할 갯수
    spaceBetween: 10, // 슬라이드 사이 여백
    centeredSlides: true,
    autoplay: {
        delay: 3000,
    },
    loop: true,

    pagination: {
        el: '.pagination .swiper-pagination', // 페이지 번호 요소 선택자
        clickable: true, // 페이지 번호 클릭시 제어 가능
    },
    navigation: {
        prevEl: '.promotion .swiper-prev',
        nextEl: '.promotion .swiper-next',
    } 
});

// promotion 슬라이드 토글 기능

const promotioneE1 = document.querySelector('.promotion');
const promotioneToggleBtn = document.querySelector('.toggle-promotion');
let isHidePromotion = false;
promotioneToggleBtn.addEventListener('click', function(){
    isHidePromotion = !isHidePromotion
    
    if(isHidePromotion) {
        promotioneE1.classList.add('hide');
    } else {
        promotioneE1.classList.remove('hide');
    }
})

// jquery js
// promotion 슬라이드 토글 기능
// let isHidePromotion = false;
// $('.toggle-promotion').click(function() {
//   isHidePromotion = !isHidePromotion

//   if (isHidePromotion) {
//     $('.promotion').attr('class', 'promotion hide');
//   } else {
//     $('.promotion').attr('class', 'promotion');
//   }
// });




