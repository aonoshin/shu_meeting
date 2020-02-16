// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// ページトップ遷移ボタン
// update by matsushita 2020/1/23 about turbolinks:load
// $(document).on('turbolinks:load', window).scroll(function(){
$(window).on('turbolinks:load', function() {
  let appear = false;
  let pagetop = $('.fa-arrow-circle-up');
  
  $(window).scroll(function () {
    if ($(this).scrollTop() > 150) {  //100pxスクロールしたら
      if (appear == false) {
        appear = true;
        pagetop.stop().animate({
        'bottom': '10px' //下から10pxの位置に
        }, 500); //0.5秒かけて現れる
      }
    } else {
      if (appear) {
        appear = false;
        pagetop.stop().animate({
        'bottom': '-50px' //下から-50pxの位置に
        }, 500); //0.5秒かけて隠れる
      }
    }
  });
  
  pagetop.click(function () {
    $('body, html').animate({ scrollTop: 0 }, 500); //0.5秒かけてトップへ戻る
    return false;
  });
});
// ---------------------------------------------------


// トグルボタンの制御（スマホ＆タブレットサイズホ時）
$(window).on('turbolinks:load', function(){
  $('.toggle-btn').click(function(){
    $('.navbar-select').slideToggle(300);
  });
});
// ---------------------------------------------------