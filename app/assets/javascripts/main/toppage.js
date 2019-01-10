$(document).on('turbolinks:load', function(){
    $('.heart-unliked').click(function() {
        $(this).find('.new_like_relation').submit();
    });
    $('.heart-liked').click(function() {
        $(this).find('.edit_like_relation').submit();
    });
});