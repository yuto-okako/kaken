$(document).on('turbolinks:load', function() {
  $(document).off('blur', '.temp-field').on('blur', '.temp-field', function() {
    checkTemp(); 
  });
  
  $(document).off('click', '.temp-btn').on('click', '.temp-btn', function() {
    let flag = true;
    checkTemp();
    
    if($('.temp-error').text() !== '') {
      flag = false;
    }
    
    return flag;
  });
});

function checkTemp() {
  $('.temp-error').empty();
  let temp = $('.temp-field').val() - 0;  // ' - 0' で数値に変換
  
  if(temp === 0) {
    $('.temp-error').append('体温を入力してください！');
  } else if(temp < 30 || 45 < temp) {
    $('.temp-error').append('今すぐ病院に行ってください。');
  }
}