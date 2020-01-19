$(document).on('turbolinks:load', function() {
$(window).scroll(function(){
  $('.boards-index-main').each(function(){
      let dummy = $(this).offset().top,
      scroll = $(window).scrollTop(),
      windowHeight = $(window).height();
      if (scroll > dummy - windowHeight + 70){
          $(this).addClass('scrollin');
      }
  });
});
});