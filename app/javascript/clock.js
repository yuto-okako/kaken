function zeroPadding(num) {
  num += ''
  if(num.length === 1) {
    num = '0' + num;
  }
  return num
}

setInterval(function() {
  var time = new Date();
  var hour = zeroPadding(time.getHours());
  var min = zeroPadding(time.getMinutes());
  $('.hour').text(hour);
  $('.min').text(min);
}, 1000);

setInterval(function() {
  $('.coron').fadeOut(500, function() {
    $(this).fadeIn(500)
  });
}, 3000);

setInterval(function() {
  $('.text').fadeOut(1000, function() {
    $(this).fadeIn(1000)
  });
}, 10000);