$(window).on('turbolinks:load',function(){
      $(".fa-angle-double-down-1").click(function(){
         $(".questions-answer-1").addClass('click');
         $("this").fadeIn(1500);
      });
});

$(window).on('turbolinks:load',function(){
      $(".fa-angle-double-down-2").click(function(){
         $(".questions-answer-2").addClass('click');
         $("this").fadeIn(1500);
      });
});

$(window).on('turbolinks:load',function(){
      $(".fa-angle-double-down-3").click(function(){
         $(".questions-answer-3").addClass('click');
         $("this").fadeIn(1500);
      });
});


// ボタンを点滅させる機能-------------------------------
$(window).on('turbolinks:load',function () {
//連続してアニメーションさせる
    setTimeout('anime2()');
});
//anime2の動きを設定
function anime2(){
$('.fa-angle-double-down-1, .fa-angle-double-down-2, .fa-angle-double-down-3')
  .animate({ 'opacity' : '1' }, 500)
  .animate({ 'opacity' : '0.3' }, 500);
 setTimeout('anime2()', 1000);
}