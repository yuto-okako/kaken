document.documentElement.addEventListener('touchstart', function (e) {
  if(e.touches.length >= 2) {
    e.preventDefault();
  }
},
{
  passive: false
});