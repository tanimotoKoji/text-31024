window.addEventListener("turbolinks:load",(function() {
  new Swiper('.swiper-container', {
  // Optional parameters
  //direction: 'vertical',
  loop: true,
  slidesPerView:2,
  centeredSlides : true,
  effect: 'coverflow',

  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
    
  },

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },

  // And if we need scrollbar
  scrollbar: {
    el: '.swiper-scrollbar',
  },
  });
}))