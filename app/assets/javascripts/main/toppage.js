$(document).on('turbolinks:load', function(){
    /**
     * お気に入りボタン
     */
    $('.heart-unliked').click(function() {
        $(this).find('.new_like_relation').submit();
    });
    $('.heart-liked').click(function() {
        $(this).find('.edit_like_relation').submit();
    });

    // ファイル送信
    $('.add-file').click(function(){
        $('.hidden-file').click();
    });
});