window.addEventListener('scroll', function(){
    var menu = document.querySelector('.navbar');
    menu.classList.toggle('sticky', window.scrollY > 0);
  })