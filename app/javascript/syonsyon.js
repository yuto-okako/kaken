$(document).on('turbolinks:load', function() {
  setInterval(function(){
    $('.syon-img').animate({
      'marginRight': '200%'
    }, 3000).animate({
      'marginLeft': '-20%'
    }, 0);
  }, 2000);
});