<<<<<<< HEAD
// Generated by CoffeeScript 1.9.3
$(document).ready(function() {
  $('#front-nav').on('mouseenter', 'li a', function() {
    return $(this).animate({
      opacity: '1'
    }, "slow");
  }).on("mouseleave", 'li a', function() {
    return $(this).animate({
      opacity: '0'
    }, "slow");
  });
  return $('#sections > div').each(function(i, sec) {
    var link;
    link = $("a[href='#" + sec.id + "']");
    return $(sec).scrollspy({
      min: $(sec).position().top + 0,
      max: $(sec).position().top + $(sec).height() - 0,
      onEnter: function(ele, pos) {
        link.trigger('mouseenter');
        return console.log("Enter " + ele.id);
      },
      onLeave: function(ele, pos) {
        link.trigger('mouseleave');
        return console.log("Leave " + ele.id);
      }
    });
  });
});
=======
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/




  


>>>>>>> design