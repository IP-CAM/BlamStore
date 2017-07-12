function slide(){
  var s1 = $('.s1');
  TweenLite.fromTo(s1, 2, {width:"0px"},{width:"500px"});
  TweenLite.from($('.s1 a'),1,{autoAlpha: 0,delay: 1});
};

function conNav(){
  var conNav = $('.con-nav');
  var menuCon = $('#top,#menu');
  TweenLite.fromTo(conNav, 2,{y: -140},{y: 0});
  TweenLite.fromTo(menuCon, 2, {y:-140},{y:0, onComplete:function(){
   TweenLite.set($('#top'),{css:{zIndex:1}});
  }
 });
};
$(document).ready(function() {
   $('.owl-carousel').owlCarousel({
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    center:true,
    items:1,
    slideSpeed : 4000,
    autoplay: true,
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
    smartSpeed:450,
    onDragged:function(){

      slide();
    }
});
conNav();
slide();
});
