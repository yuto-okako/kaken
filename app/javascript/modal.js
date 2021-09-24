$(document).on('turbolinks:load', function() {
  $(document).on('click', '.open-modal', function(){
    let target = $(this).data('target');
    let modal = document.getElementById(target);
    $('body').addClass('no-scroll');
    $(modal).fadeIn();
  });
  
  $(document).on('click', '.close-modal', function(){
    $('body').removeClass('no-scroll');
    $('.modal-area').fadeOut();
  });
});