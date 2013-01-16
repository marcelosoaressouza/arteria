// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require fancybox
//= require twitter/bootstrap
//= require ckeditor/init
//= require_tree .

$(document).ready(function() {
  $("#image-box").fancybox({
    'closeBtn'    : true,
    'closeClick'  : true,
    'openEffect'  : 'none',
    'closeEffect' : 'none',
  });

  $("#video-box").fancybox({
    'width'         : '640',
    'height'        : '480',
    'closeBtn'      : true,
    'autoScale'     : false,
    'transitionIn'  : 'none',
    'transitionOut' : 'none',
    'type'          : 'iframe'
  });

  $('#arteria-carousel-images').jcarousel({
    animation: 3000,
    scroll: 1,
    wrap: 'circular',
    auto: 3
  });

  $('#arteria-carousel-posts').jcarousel({
    animation: 5000,
    scroll: 1,
    wrap: 'circular',
    auto: 3
  });

  $('.arteria-carousel-galleries').jcarousel({
    animation: 3000,
    scroll: 1,
    wrap: 'circular',
    auto: 3
  });
  
});
