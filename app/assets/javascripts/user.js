// スクロール遷移機能
// ---------------------------------------------------
$(function(){
   $('a').click(function(){
      let target = $($(this).attr('href')).offset().top;
      target -= 10;
      $('html, body').animate({scrollTop: target},500);
      return false;
   });
});
// ---------------------------------------------------