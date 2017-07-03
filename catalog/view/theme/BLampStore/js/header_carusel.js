$(document).ready(function() {
   $('.owl-carousel').owlCarousel({
    animateOut: 'fadeOut',
    center:true,
    items:1,
    loop:3,
    responsiveClass:true,
    responsive:{
     0:{
         items:1,
         nav:false,
         dots:false
     },
     600:{
         items:1,
         nav:false
     },
     1000:{
         items:1,
         nav:false,
         loop:false
     }
 },

    // autoHeight: false,
    smartSpeed:450
});
});
