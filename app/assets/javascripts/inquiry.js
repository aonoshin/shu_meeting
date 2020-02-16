// 一定の文字数を超えると省略される機能
$(window).on('turbolinks:load',function(){
    let count = 90;
    $('.inquiry-index-text p').each(function(){
        let thisText = $(this).text();
        let textLength = thisText.length;
        if (textLength > count){
            let showText = thisText.substring(0, count);
            let insertText = showText += '.....';
            $(this).html(insertText);
        };
    });
});