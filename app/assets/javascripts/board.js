$(document).on('turbolinks:load', function() {
  $(window).scroll(function(){
    $('.boards-index-main').each(function(){
        let position = $(this).offset().top,
        scroll = $(window).scrollTop(),
        windowHeight = $(window).height();
        if (scroll > position - windowHeight + 70){
            $(this).addClass('scrollin');
        }
    });
  });
});