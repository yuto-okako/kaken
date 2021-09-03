$(document).on('turbolinks:load', function() {
  $('#openModal').click(function(){
      $('#modalArea').fadeIn();
  });
  
  $('#closeModal').click(function(){
    $('#modalArea').fadeOut();
  });
});