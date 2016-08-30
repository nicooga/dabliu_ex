'use strict';

window.jQuery = require('jquery');
window.$ = window.jQuery;

require('wowjs');
require('bootstrap');
require('jquery.easing');
require('jquery.scrollto');

new WOW().init();

$(_ => {
  $("#preloader").delay(100).fadeOut("slow");
  $("#load").delay(100).fadeOut("slow");

  //jQuery to collapse the navbar on scroll
  $(window).scroll(_ =>
    $(".navbar").offset().top > 50 ?
      $(".navbar-fixed-top").addClass("top-nav-collapse") :
      $(".navbar-fixed-top").removeClass("top-nav-collapse")
  );

  //jQuery for page scrolling feature - requires jQuery Easing plugin
  $('.navbar-nav li a').bind('click', function(event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: $($anchor.attr('href')).offset().top
    }, 1500, 'easeInOutExpo');
    event.preventDefault();
  });

  $('.page-scroll a').bind('click', function(event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: $($anchor.attr('href')).offset().top
    }, 1500, 'easeInOutExpo');
    event.preventDefault();
  });
});
