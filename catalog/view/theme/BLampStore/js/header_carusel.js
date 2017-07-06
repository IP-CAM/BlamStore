function slide(){
  var s1 = $('.s1');
  TweenLite.to(s1, 2, {width:"500px"});
};
$(document).ready(function() {
   $('.owl-carousel').owlCarousel({
    animateOut: 'fadeOut',
    center:true,
    items:1,
    slideSpeed : 2000,
    autoplay: false,
    loop:true,
    dots:false,
    responsiveClass:true,
    responsive:{
     0:{
         items:1,
         nav:false,
         dots:false
     },
     600:{
         items:1,
         nav:false,
         dots:false
     },
     1000:{
         items:1,
         nav:false,

     }
 },
    // autoHeight: false,
    smartSpeed:450
});
slide();
});
