$(document).on('turbolinks:load', function() {
  $('.open-modal').click(function(){
    let target = $(this).data('target');
    let modal = document.getElementById(target);
    $('body').addClass('no-scroll');
    $(modal).fadeIn();
  });
  
  $('.close-modal').click(function(){
    $('body').removeClass('no-scroll');
    $('.modal-area').fadeOut();
  });
});