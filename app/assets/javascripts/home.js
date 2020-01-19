// トップ画像のフェードイン機能
// ---------------------------------------------------
$(function(){
   $('.home-image').fadeIn(2300);
});
// ---------------------------------------------------

// フェードイン機能
// ---------------------------------------------------
$(window).scroll(function(){
   $('.home-main-1, .image-1, .text-1, .image-2, .text-2, .image-3, .text-3, .voice-text, .news-text, .home-main-5-list').each(function(){
      let dummy = $(this).offset().top,
      scroll = $(window).scrollTop(),
      // スクロールの量
      windowHeight = $(window).height();
      if (scroll > dummy - windowHeight + 70){
      // スクロールした量 > 要素からtopまでの高さ - ブラウザの高さ + 100
         $(this).addClass('scrollin');
         // scrollinクラスを追加する
      }
   });
});
// ---------------------------------------------------

// ホバーをした際の文言変更
// ---------------------------------------------------
$(function(){
   $('.btn-1 a').hover(function(){
      $(this).html('Click').css('padding', '10px 50px');
   }, function(){
      $(this).html('新規登録する').css('padding', '10px 20px');
   });
});

$(function(){
   $('.btn-2 a').hover(function(){
      $(this).html('Click').css('padding', '10px 73px');
   }, function(){
      $(this).html('お問い合わせをする').css('padding', '10px 20px');
   });
});
// ---------------------------------------------------