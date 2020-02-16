$(document).on('turbolinks:load', function() {
    var obj;
    obj = document.getElementById('messagesArea');
    obj.scrollTop = obj.scrollHeight;
});